<%@page import="java.sql.Date"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>

 
 
<%
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
        pst = con.prepareStatement("delete from sallemachine where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        
    
       <div style="margin-left:30%; margin-top:15%;" class="content">

					<h1>Affectation Suprimee</h1>
					<button class="btn btn-danger"><a href="affect.jsp">Retour</a></button>
			
</div>

<%@include file="footer.jsp"%>