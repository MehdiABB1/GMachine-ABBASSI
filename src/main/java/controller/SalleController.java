package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Salle;

import dao.IDao;
import service.SalleService;


/**
 * Servlet implementation class SalleController
 */
@WebServlet("/")
public class SalleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private SalleService sas = new SalleService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalleController() {
    	
      
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                sas.delete(sas.findById(id));
                response.sendRedirect("salles.jsp");
            } else if (request.getParameter("op").equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Salle m = sas.findById(id);
                response.sendRedirect("salle.jsp?id=" + m.getId() + "&code=" + m.getCode() + "&type=" + m.getType());
            }
        } else if (request.getParameter("id") != null) {
            if (!request.getParameter("id").equals("")) {
                String code = request.getParameter("code");
                String type = request.getParameter("type");
                int id = Integer.parseInt(request.getParameter("id"));
                Salle m = sas.findById(id);
                m.setCode(code);
                m.setType(type);
                sas.update(m);
                response.sendRedirect("salles.jsp");
            }
        } 
            String code = request.getParameter("code");
            String type = request.getParameter("type");
            System.out.println("~##### "+code);
            sas.create(new Salle(code, type));
            response.sendRedirect("salles.jsp");
        
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  processRequest(request, response);
	}

	  @Override
	    public String getServletInfo() {
	        return "Short description";
	    }// </editor-fold>
}
