package dao;

import connection.DBConnection;
import pojo.Prenotazione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@SuppressWarnings("ALL")
public class PrenotazioneDAO {

    public static ArrayList<Prenotazione> getAll() throws SQLException { //todo non capisco perche sta select torna anche gli id
        String getAll = "SELECT * FROM prenotazione";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(getAll);
            ArrayList<Prenotazione> pren = new ArrayList<>();
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Prenotazione s = new Prenotazione(rs.getString("stato"), rs.getString("studente"), rs.getString("docente"), rs.getString("slot"), rs.getString("data"));
                pren.add(s);
            }
            return pren;
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static int insert(Prenotazione pren) throws SQLException {
        String insert = "INSERT INTO prenotazione(stato, studente, docente, id_insegamento, slot, data) VALUES (?,?,?,?,?,?)";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(insert);
            st.setString(1, pren.getStato());
            st.setString(2, pren.getStudente());
            st.setString(3, pren.getDocente());
            st.setString(5, pren.getSlot());
            st.setString(6, pren.getData());
            return st.executeUpdate();

        }catch (Exception e){
            //catturo l'eccezione che potrebbe essere generata e ritorno immediatamente -1 error.
            return -1;
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static void delete(Prenotazione pren) throws SQLException {
        String remove = "DELETE FROM prenotazione WHERE slot = ? AND data = ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(remove);
            st.setString(1, pren.getSlot());
            st.setString(2, pren.getData());
            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static int getN() throws SQLException {
        String getN = "SELECT count(id) FROM prenotazione";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(getN);
            ResultSet rs = st.executeQuery();
            rs.next();
            return rs.getInt(1);
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static void main(String[] args) {
//        http://localhost:8080/controller?action=prenotazione&slot=1&docente=ippolito&insegnamento=9&corso=italiano&data=2018-11-28
        Prenotazione p = new Prenotazione("attiva", "gintonik", "ippolito", "1", "2018-11-30");

        try {
            PrenotazioneDAO.insert(p);
        } catch (SQLException e) {
            e.getMessage();
        }

    }
}
