<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="chart.js"></script>
<script src="chart.min.js"></script>
<script src="assets/js/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


</head>
<body>
<div class="content">
	<%
	String code = request.getParameter("salles");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");

	pst = con.prepareStatement("select code , reference from sallemachine group by code");

	rs = pst.executeQuery();
	List<String> code1 = new ArrayList<String>();
	List<String> ref = new ArrayList<String>();
	int i = 0;
	while (rs.next()) {
		code1.add(rs.getString("code"));
		ref.add(rs.getString("reference"));
		i++;
	}
	
	
	%>
	<div>
		<canvas id="myChart"></canvas>
	</div>
	<script>
		const labels = [
	        'Salle1',
	        'Salle2',
	        'A4',
	        'aa'
	    ];
		const data = {
			labels : labels,
			datasets : [ {
				label : 'My First Dataset',
				data : [ 3, 2, 4,1 , 5, 6, 7,10 ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)',
						'rgba(153, 102, 255, 0.2)', 'rgba(201, 203, 207, 0.2)' ],
				borderColor : [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)',
						'rgb(255, 205, 86)', 'rgb(75, 192, 192)',
						'rgb(54, 162, 235)', 'rgb(153, 102, 255)',
						'rgb(201, 203, 207)' ],
				borderWidth : 1
			} ]
		};
		const config = {
			type : 'bar',
			data : data,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			},
		};
	</script>
	<script>
		const myChart = new Chart(document.getElementById('myChart'), config);
	</script>
	</div>
</body>
</html>
  <%@include file="footer.jsp"%>