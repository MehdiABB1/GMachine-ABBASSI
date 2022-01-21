<%@page import="service.SalleMachineService"%>
<%@page import="beans.sallemachine"%>
<%@page import="service.SalleService"%>
<%@page import="java.sql.Date"%>
<%@page import="beans.Machine"%>
<%@page import="java.sql.*"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@include file="header.jsp"%>

<%
if (request.getParameter("submit") != null) {
	String code = request.getParameter("salles");
	String references = request.getParameter("references");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("insert into sallemachine(code,reference)values(?,?)");
	pst.setString(1, code);
	pst.setString(2, references);
	pst.executeUpdate();
%>
<script>
	alert("Record Adddeddddd");
</script>
<%
}
%>

<div class="content">

	<div style="border: 4mm ridge rgba(170, 50, 220, .6);">
		<div class="card-body">

			<form method="POST">
			
				<fieldset >
					<legend style="color: white;">Liste des machines</legend>

					<div class="row">
						<div class="col-md-5 pr-md-1">
							<div class="form-group">
								<label>Référence :</label> <select class="form-control"
									name="references">
									<%
									MachineService ms = new MachineService();
									for (String r : ms.findReference()) {
									%>
									<option style="background-color: #1e1e2f;"><%=r%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 pr-md-1">
							<div class="form-group">

								<label>Salles :</label> <select class="form-control"
									name="salles">
									<%
									SalleService s = new SalleService();
									for (String p : s.findCode()) {
									%>
									<option style="background-color: #1e1e2f;"><%=p%></option>
									<%
									}
									%>
								</select>

							</div>
						</div>
					</div>
				

				</fieldset>
				<div style="background-color: #1e1e2f;">
					<input type="submit" id="submit" value="submit"
							name="submit" class="btn btn-info">
				</div>
			</form>
		</div>
	</div>
	<br>
	<div class="table-responsive ps">
		<table class="table tablesorter ">
			<thead>
				<tr style="color: white; background-color: #8B008B;">
					<th>ID</th>
					<th>Reference Machine</th>
					<th>Code Salle</th>
					<th>Supprimer</th>
				</tr>
			</thead>
			<tbody>
				<%
				SalleMachineService sm = new SalleMachineService();
				for (sallemachine m : sm.findAll()) {
				%>
				<tr style="color: white;">
					<td><%=m.getId()%></td>
					<td><%=m.getReference()%></td>
					<td><%=m.getCode()%></td>

					<td><a href="deleteAffect.jsp?id=<%=m.getId()%>">Supprimer</a></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>


	</div>
</div>
<script>
	$(document).on("click", "#somebutton", function() {
		$.post('ReferenceController', {
			reference : $('select[name="references"]').val()
		}, function(returnedData) {
			$("#somediv").html(returnedData);
		});
	});
</script>

<%@include file="footer.jsp"%>