<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.sallemachine"%>
<%@page import="service.SalleMachineService"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>

<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>


<div class="content">

	<form action="machinedate2.jsp" method="GET" style="border: 4mm ridge rgba(170, 50, 220, .6);">
	     <br /> <br /> 
		<input type="hidden" name="id"
			value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
			size="id" />
		<fieldset style="margin-left: 5%;">
			<legend style="color: white;">Selectionner les dates </legend>
			<table border="0">

				<tr style="color: white;">
					<td>Date Debut :</td>
					<td><input class="form-control"  required="" type="date" name="date1"
						 /></td>
					<td>*</td>
				</tr>
					<tr style="color: white;">
					<td>Date Fin :</td>
					<td><input  class="form-control" required="" type="date" name="date2"
						 /></td>
					<td>*</td>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="submit" id="submit" value="submit" name="submit" class="btn btn-info"></td>

				</tr>

			</table>

		</fieldset>
		<br /> <br /> 
	</form>
	<br /> <br /> <br />
	<fieldset>
		<legend style="color: white;">Liste des machines </legend>
		<div class="table-responsive ps">
		<table  class="table tablesorter " >
			<thead>
				<tr style="color: white; background-color: #8B008B;">
					<th>Référence</th>
					<th>Date Achat</th>
					<th>Prix</th>
					
				</tr>
			</thead>
			<tbody>
			      <% 
			      Date date1 = Date.valueOf(request.getParameter("date1"));
			      Date date2 = Date.valueOf(request.getParameter("date2"));
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                Class.forName("com.mysql.cj.jdbc.Driver");
                            	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
                                
                                
                                  pst = con.prepareStatement("select * from machine where dateAchat between ? and  ?");
                                  pst.setDate(1,  Date.valueOf(request.getParameter("date1")));
                                  pst.setDate(2,  Date.valueOf(request.getParameter("date2")));
                                 
                                  
                                   rs = pst.executeQuery();
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr style="color: white;">
                                 <td><%=rs.getString("reference") %></td>
                                 <td><%=rs.getString("dateAchat") %></td>
                                 <td><%=rs.getString("prix") %></td>
                               
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>