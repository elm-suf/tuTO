package dao;

import connection.DBConnection;
import pojo.Prenotazione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                Prenotazione s = new Prenotazione(rs.getString("studente"), rs.getString("docente"), rs.getString("corso"), rs.getInt("idInsegnamento"), rs.getString("slot"), rs.getString("stato"), rs.getString("data"));
                pren.add(s);
            }
            return pren;
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static int insert(Prenotazione pren) throws SQLException {
        String insert = "INSERT INTO prenotazione(stato, studente, docente, id_insegnamento, slot, data) VALUES (?,?,?,?,?,?)";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(insert);
            st.setString(1, pren.getStato());
            st.setString(2, pren.getStudente());
            st.setString(3, pren.getDocente());
            st.setInt(4, pren.getIdInsegnamento());
            st.setString(5, pren.getSlot());
            st.setString(6, pren.getData());
            return st.executeUpdate();

        } catch (Exception e) {
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

    public static List getSlotDisponibili(String docente, String data) {
        //todo in realta' mi serve solo slot e lo stato
        String sql = "SELECT slot,stato FROM prenotazione WHERE docente = ? and data = ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        List list = new ArrayList<Prenotazione>();
        List<String> active = new ArrayList<>(); //todo forse e' meglio usare int
        active.add("1");
        active.add("2");
        active.add("3");
        active.add("4");
        try {
            st = conn.prepareStatement(sql);
            st.setString(1, docente);
            st.setString(2, data);
            ResultSet rs = st.executeQuery();
            System.out.println("executing following query\n" + st.toString());
            //studente, docente,  corso, id_ins, slot, stato, data
            while (rs.next()) {
                String stato = rs.getString("stato");
                //String studente = rs.getString("studente");
                //docente = rs.getString("docente");
                //String corso = rs.getString("corso");
                //int id_insegamento = rs.getInt("id_insegamento");
                String slot = rs.getString("slot");
                //data = rs.getString("data");

                if(stato.equals("attiva")){
                    active.remove(slot );
                }
            }
            //ArrayList<Pair> pairs = new ArrayList<>();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return active;
    }
}
