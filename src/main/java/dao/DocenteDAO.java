package dao;

import connection.DBConnection;
import pojo.Corso;
import pojo.Professore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocenteDAO {

    public DocenteDAO() {
    }

    public void insert(Professore user) throws SQLException {
        String sqlInsertion = "INSERT INTO professore(username, nome, cognome, password) VALUE (?,?,?,?)";
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

    public void delete(Professore user) throws SQLException {
        String sqlDelete = "DELETE FROM professore WHERE username=?";
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

    public void update(Professore user) throws SQLException {
        String sqlUpdate = "UPDATE professore SET nome = ?, cognome = ? WHERE username= ?";
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

    public void addInsegnamento(Professore user, Corso corso) throws SQLException {

        String sql = "INSERT INTO insegnamento(corso, professore) VALUE (?,?);";
        Connection conn = DBConnection.getInstance();
        PreparedStatement st = conn.prepareStatement(sql);
        try {
            st.setString(1, corso.getTitolo());
            st.setString(2, user.getUsername());
            System.out.println(st.toString());
            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            conn.close();
        }
    }

    public void deleteInsegnamento(Professore user, Corso corso) throws SQLException {
        user.removeInsegnamento(corso);
        String sql = "DELETE FROM insegnamento \n" +
                "WHERE corso = ? AND professore = ?;";
        Connection conn = DBConnection.getInstance();
        PreparedStatement st = conn.prepareStatement(sql);
        try {
            st.setString(1, corso.getTitolo());
            st.setString(2, user.getUsername());

            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            conn.close();
        }

    }


    /**
     *
     * @param corso il titolo del corso
     * @return la lista di professori che insegnano @param corso
     * @throws SQLException
     */
    public List<Professore> getAllInsegnaMateria(String corso) throws SQLException {
        String sql = "SELECT p.username, nome, cognome, password FROM professore AS p, insegnamento AS i WHERE  i.professore = p.username AND i.corso = ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        List<Professore> list = new ArrayList<>();


            st = conn.prepareStatement(sql);
            st.setString(1, corso);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Professore(rs.getString(1),
                                        rs.getString(2),
                                        rs.getString(3),
                                        rs.getString(4)));

            }



        return list;
    }

    public static void main(String[] args) throws SQLException {

        DocenteDAO dao = new DocenteDAO();
        System.out.println(dao.getAllInsegnaMateria("prog"));

//        Professore prof = new Professore("Trinciao", "Paolo", "Rossi", "password");
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
//            dao.update(new Professore("Trinciao", "sassaassa", "altobelli", "password"));
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }

//        try {
//            dao.delete(new Professore("Trinciao", "Paolo", "Rossi", "password"));
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//

    }
}
