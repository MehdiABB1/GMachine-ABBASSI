<%@page import="service.SalleMachineService"%>
<%@page import="beans.sallemachine"%>
<%@page import="service.SalleService"%>
<%@page import="java.sql.Date"%>
<%@page import="beans.Machine"%>
<%@page import="java.sql.*"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@include file="header.jsp"%>



<div class="content">
	<div style="border: 4mm ridge rgba(170, 50, 220, .6);">
		<div class="card-body">

			<form method="POST" action="RechercheParSalle.jsp">
				<br /> <br />
				<fieldset>
					<legend style="color: white;">Liste des machines</legend>

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




				</fieldset>
				<div style="background-color: #1e1e2f;">
					<input type="submit" id="submit" value="submit" name="submit"
						class="btn btn-info">
				</div>
				<br>
			</form>
		</div>
	</div>
	<br /> <br /> <br />
	<div class="table-responsive ps">
		<table class="table tablesorter ">
			<thead>
				<tr style="color: white; background-color: #8B008B;">

					<th>Reference Machine</th>
					<th>Date achat</th>
					<th>Prix</th>

				</tr>
			</thead>
			<tbody>
				<%
				String code = request.getParameter("salles");

				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");

				pst = con.prepareStatement(
						"select * from machine m,salle s, sallemachine sm where sm.code=? and  sm.code=s.code and sm.reference = m.reference ");
				pst.setString(1, request.getParameter("salles"));

				rs = pst.executeQuery();

				while (rs.next()) {
					String id = rs.getString("id");
				%>

				<tr style="color: white;">
					<td><%=rs.getString("reference")%></td>
					<td><%=rs.getString("dateAchat")%></td>
					<td><%=rs.getString("prix")%></td>

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