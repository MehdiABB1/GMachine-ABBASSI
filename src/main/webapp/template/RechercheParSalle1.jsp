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
      <form method="GET" action="RechercheParSalle.jsp">
            <fieldset>
                <legend style="color: white;">Liste des machines</legend>

                <table border="0">  

                   
                    
                    <tr style="color: white;">
                        <td>Salles  : </td>
                        <td>

                            <select name="salles">
                                <%
                                    SalleService s = new SalleService();
                                    for (String p : s.findCode()) {
                                %>
                                <option><%= p%></option>
                                <%}%>
                            </select>

                        </td>
                        	
                    </tr>
                    <tr>
                    <td><input type="submit" id="submit" value="submit" name="submit" class="btn btn-info"></td></tr>
                </table>
               

            </fieldset>
              </form>
            <div class="table-responsive ps">
		<table  class="table tablesorter " >
			<thead>
				<tr style="color: white;">
					<th>ID</th>
					<th>Reference Machine</th>
					<th>Code Salle</th>
				
				</tr>
			</thead>
		
				</table>
      </div>

</div>
   <script>
            $(document).on("click", "#somebutton", function () { 
                $.post('ReferenceController', {reference: $('select[name="references"]').val()},
                function (returnedData) {
                    $("#somediv").html(returnedData);
                });
            });
        </script>

<%@include file="footer.jsp"%>