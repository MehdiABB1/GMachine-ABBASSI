package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class SalleService implements IDao<Salle> {

	@Override
	public boolean create(Salle o) {
		String sql = "insert into salle values (null, ?, ?)";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getCode());
            ps.setString(2, o.getType());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("create : erreur sql : " + e.getMessage());

        }
       
		return false;
		
	}

	@Override
	public boolean delete(Salle o) {
		  String sql = "delete from salle where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
		return false;
	}

	@Override
	public boolean update(Salle o) {

        String sql = "update machine set code  = ? ,type = ? where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getCode());
            ps.setString(2, o.getType());
            ps.setInt(3, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
	}

	@Override
	public Salle findById(int id) {
	    Salle m = null;
        String sql = "select * from salle where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("type"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return null;
	}

	@Override
	public List<Salle> findAll() {
		   List<Salle> machines = new ArrayList<Salle>();

	        String sql = "select * from salle";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new Salle(rs.getInt("id"), rs.getString("code"),  rs.getString("type")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return machines;
		
	}
	
	  
    public List<String> findCode() {
        List<String> references = new ArrayList<String>();
        String sql = "select distinct(code) as code from salle";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                references.add(rs.getString("code"));
            }
        } catch (SQLException e) {
            System.out.println("findReference " + e.getMessage());
        }
        return references;
    }

}
