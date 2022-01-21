package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.sallemachine;
import connexion.Connexion;
import dao.IDao;

public class SalleMachineService implements IDao<sallemachine> {

	@Override
	public boolean create(sallemachine o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(sallemachine o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(sallemachine o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public sallemachine findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<sallemachine> findAll() {
		  List<sallemachine> machines = new ArrayList<sallemachine>();

	        String sql = "select * from sallemachine";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new sallemachine(rs.getInt("id"), rs.getString("reference"), rs.getString("code")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return machines;
	}

}
