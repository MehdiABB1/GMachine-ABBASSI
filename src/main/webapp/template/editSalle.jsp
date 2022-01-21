<%@page import="service.SalleService"%>
<%@page import="beans.Salle"%>
<%@page import="java.sql.Date"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>

<%
SalleService ms = new SalleService();
if (request.getParameter("submit") != null) {
	String id = request.getParameter("id");
	String code = request.getParameter("code");
	String type = request.getParameter("type");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("update salle set code = ?,type =? where id = ?");
	pst.setString(1, code);
	pst.setString(2, type);
	pst.setString(3, id);
	pst.executeUpdate();
%>
<script>
	alert("salle modifiee");
</script>
<%
}
%>
<div class="content">
	<div style="border: 4mm ridge rgba(170, 50, 220, .6);">
		<div class="card-body">
			<form action="#" method="POST">

				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");

				String id = request.getParameter("id");

				pst = con.prepareStatement("select * from salle where id = ?");
				pst.setString(1, id);
				rs = pst.executeQuery();

				while (rs.next()) {
				%>
				 <input type="hidden" name="id"
					value="<%=request.getParameter("id")%>" size="id" />
				<fieldset>
					<legend style="color: white;">Nouvelle Salle</legend>
					<div class="row">

						<div class="col-md-5 pr-md-1">
							<div class="form-group">
								<label>Code :</label> <input class="form-control" required="" type="text" name="code"
								value="<%=rs.getString("code")%>" />
							</div>
							
						</div>
						</div>
					<div class="row">
					<div class="col-md-5 pr-md-1">
							<div class="form-group">
								<label>Type :</label> <input class="form-control" required="" type="text" name="type"
								value="<%=rs.getString("type")%>" />
							</div>

						</div>
							
					</div>
						<%
						}
						%>
					
				</fieldset>
				<div style="background-color: #1e1e2f;">
					<input type="submit" id="submit" value="submit" name="submit"
						class="btn btn-info"> <input type="reset"
						class="btn btn-warning" value="Annuler" />
				</div>
				<br /> <br />
			</form>
		</div>
	</div>
	<fieldset>
		<legend style="color: white;">Liste des Salles </legend>
		<div class="table-responsive ps">
			<table class="table tablesorter ">
				<thead>
					<tr style="color: white; background-color: #8B008B;">
						<th>ID</th>
						<th>Code</th>
						<th>Type</th>
						<th>Supprimer</th>
						<th>Modifier</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Salle m : ms.findAll()) {
					%>
					<tr style="color: white;">
						<td><%=m.getId()%></td>
						<td><%=m.getCode()%></td>
						<td><%=m.getType()%></td>
						<td><a href="delete.jsp?id=<%=m.getId()%>">Supprimer</a></td>
						<td><a href="editSalle.jsp?id=<%=m.getId()%>">Modifier</a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</fieldset>
</div>

<%@include file="footer.jsp"%>
