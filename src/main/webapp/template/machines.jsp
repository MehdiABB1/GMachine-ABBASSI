<%@page import="java.sql.Date"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>

<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>

<%
if (request.getParameter("submit") != null) {
	String reference = request.getParameter("reference");
	double prix = Double.parseDouble(request.getParameter("prix"));
	Date dateAchat = Date.valueOf(request.getParameter("dateAchat"));

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("insert into machine(reference,dateAchat,prix)values(?,?,?)");
	pst.setString(1, reference);
	pst.setDate(2, dateAchat);
	pst.setDouble(3, prix);
	pst.executeUpdate();
	   %>
	    <script>  
	        alert("Machine ajoutee");    
	    </script>
	    <%            
	    }
	   %>
<div class="content">
<div style="border: 4mm ridge rgba(170, 50, 220, .6);">
<div class="card-body" >

	<form action="machines.jsp" method="POST"  >
	
		<input type="hidden" name="id"
			value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
			size="id" />
		<fieldset >
			<legend style="color: white;">Nouvelle machine</legend>
			   <div class="row">
                    <div class="col-md-5 pr-md-1">
                      <div class="form-group">
                        <label>R�f�rence :</label> <input class="form-control" required=""
									type="text" name="reference" />
							</div>
                    </div>
                    <div class="col-md-3 px-md-1">
                      <div class="form-group">
                        <label>Date Achat :</label>
                        <input class="form-control"  required="" type="date" name="dateAchat"/>
                      </div>
                    </div>
                  </div>
                   <div class="row">
                    <div class="col-md-5 pr-md-1">
                      <div class="form-group">
                        <label>Prix : </label>
                        <input class="form-control"  required="" type="text" name="prix"/>
                      </div>
                    </div>
                  </div>
               

		</fieldset>
		 <div style="background-color: #1e1e2f;">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                <input type="reset" class="btn btn-warning" value="Annuler" />
              </div>
			</form>
		</div>
		  
		
</div>
	
	<br /> <br /> <br />
	<fieldset>
		<legend style="color: white;">Liste des machines </legend>
		<div class="table-responsive ps">
		<table  class="table tablesorter " >
			<thead >
				<tr style="color: white; background-color: #8B008B;">
					<th>ID</th>
					<th>R�f�rence</th>
					<th>Date Achat</th>
					<th>Prix</th>
					<th>Supprimer</th>
					<th>Modifier</th>
				</tr>
			</thead>
			<tbody>
				<%
				MachineService ms = new MachineService();
				for (Machine m : ms.findAll()) {
				%>
				<tr style="color: white;">
					<td><%=m.getId()%></td>
					<td><%=m.getReference()%></td>
					<td><%=m.getDateAchat()%></td>
					<td><%=m.getPrix()%></td>
					<td><a href="delete.jsp?id=<%=m.getId()%>">Supprimer</a></td>
					<td><a href="edit.jsp?id=<%=m.getId()%>">Modifier</a></td>
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
