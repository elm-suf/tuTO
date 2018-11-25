package dao;

import connection.DBConnection;
import pojo.Corso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@SuppressWarnings("ALL")
public class CorsoDAO {
    public static void insert(Corso c) throws SQLException {
        String insert = "INSERT INTO corso(titolo) VALUES(?)";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(insert);
            st.setString(1, c.getTitolo());
            st.executeUpdate();
        }finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static void delete(Corso c) throws SQLException {
        String remove = "DELETE FROM corso WHERE id = ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(remove);
            st.setInt(1, c.getId());
            st.executeUpdate();
        }finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static void update(String titoloInit, String titoloFinal) throws SQLException {
        String modify = "UPDATE corso SET titolo = ? WHERE titolo = ?";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(modify);
            st.setString(1, titoloFinal);
            st.setString(2, titoloInit);
            st.executeUpdate();
        }finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }

    public static int getN() throws SQLException {
        String getN = "SELECT count(*) FROM corso";
        PreparedStatement st = null;
        Connection conn = DBConnection.getInstance();
        try {
            st = conn.prepareStatement(getN);
            ResultSet rs = st.executeQuery();
            rs.next();
            return rs.getInt(1);
        }finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }
}
