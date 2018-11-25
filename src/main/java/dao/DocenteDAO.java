package dao;

import connection.DBConnection;
import pojo.Corso;
import pojo.Docente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
public class DocenteDAO {

    public DocenteDAO() {
    }

    public void insert(Docente user) throws SQLException {
        String sqlInsertion = "INSERT INTO docente(username, nome, cognome, password) VALUE (?,?,?,?)";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();

        try {
            st = conn.prepareStatement(sqlInsertion);
            st.setString(1, user.getUsername());
            st.setString(2, user.getNome());
            st.setString(3, user.getCognome());
            st.setString(4, user.getPassword());

            st.executeUpdate();

        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public void delete(Docente user) throws SQLException {
        String sqlDelete = "DELETE FROM docente WHERE username=?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();

        try {
            st = conn.prepareStatement(sqlDelete);
            st.setString(1, user.getUsername());
            //todo forse e' meglio usare id dato che li abbiamo usati ???

            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public void update(Docente user) throws SQLException {
        String sqlUpdate = "UPDATE docente SET nome = ?, cognome = ? WHERE username= ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();

        try {
            st = conn.prepareStatement(sqlUpdate);
            st.setString(1, user.getNome());
            st.setString(2, user.getCognome());
            st.setString(3, user.getUsername());

            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }


    public static void main(String[] args) throws SQLException {

        DocenteDAO dao = new DocenteDAO();
        System.out.println(dao.getAllInsegnaMateria("prog"));

//        Docente prof = new Docente("Trinciao", "Paolo", "Rossi", "password");
//        Corso corso = new Corso("italiano");
//        Corso corso1 = new Corso("prog");
//        prof.addInsegnamento(corso);
//        prof.addInsegnamento(corso1);
//
//        try {
//            dao.insert(prof);
//        } catch (SQLException e) {
//            e.getMessage();
//        }

//        try {
//            dao.addInsegnamento(prof,corso);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

//        try {
//            dao.deleteInsegnamento(prof,corso);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

//        try {
//            dao.insert(prof);
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }

//        try {
//            dao.update(new Docente("Trinciao", "sassaassa", "altobelli", "password"));
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }

//        try {
//            dao.delete(new Docente("Trinciao", "Paolo", "Rossi", "password"));
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//

    }
}
