package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;

import connexion.Connexion;

/**
 * Servlet implementation class validatelogin
 */
@WebServlet("/validatelogin")
public class validatelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		Connection con;
		PreparedStatement pst;
		ResultSet rs;

		JSONArray list = new JSONArray();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		JSONObject obj = new JSONObject();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
			pst = con
					.prepareStatement("select id,email password, username from login where email = ? and password = ?");
			pst.setString(1, email);
			pst.setString(2, password);

			rs = pst.executeQuery();

			String msg;

			HttpSession session = request.getSession();
			if (rs.next()) {

				session.setAttribute("email", email);
				session.setAttribute("password", password);

				msg = "1";
				obj.put("msg", msg);

				list.add(obj);
				out.println(list.toJSONString());
				out.flush();

			} else {
				msg = "3";
				obj.put("msg", msg);

				list.add(obj);
				out.println(list.toJSONString());
				out.flush();
			}

		} catch (ClassNotFoundException e) {
			System.out.println("Driver introvable");
		} catch (SQLException e) {
			System.out.println("Connexion errror");
			System.out.println(e.getMessage());
		}

	}

}
