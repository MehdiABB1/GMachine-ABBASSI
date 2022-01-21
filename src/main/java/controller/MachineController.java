package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import beans.Machine;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MachineService;

/**
 *
 * 
 */
@WebServlet(name="MachineController",urlPatterns={"/MachineController"})
public class MachineController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MachineService ms = new MachineService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ms.delete(ms.findById(id));
                response.sendRedirect("machines.jsp");
            } else if (request.getParameter("op").equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Machine m = ms.findById(id);
                response.sendRedirect("machines.jsp?id=" + m.getId() + "&reference=" + m.getReference() + "&dateAchat=" + m.getDateAchat() + "&prix=" + m.getPrix());
            }
        } else if (request.getParameter("id") != null) {
            if (!request.getParameter("id").equals("")) {
                String reference = request.getParameter("reference");
                double prix = Double.parseDouble(request.getParameter("prix"));
                Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
                int id = Integer.parseInt(request.getParameter("id"));
                Machine m = ms.findById(id);
                m.setReference(reference);
                m.setPrix(prix);
                m.setDateAchat(dateAchat);
                ms.update(m);
                response.sendRedirect("machines.jsp");
            }
        } 
            String reference = request.getParameter("reference");
            double prix = Double.parseDouble(request.getParameter("prix"));
            Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
            System.out.println("~##### "+reference);
            ms.create(new Machine(reference, dateAchat, prix));
            response.sendRedirect("machines.jsp");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
