import com.google.gson.Gson;
import dao.*;
import pojo.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Controller", urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String nome, cognome, titolo, docente, data;
        HttpSession s = req.getSession();

        switch (action) {
            case "login":
                s = req.getSession(true);
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                s.setAttribute("username", username);
                s.setAttribute("password", password);
                try {
                    if (AmministratoreDAO.exists(username) && AmministratoreDAO.checkPassword(username, password))
                        res.sendRedirect("/JSPs/Amministratore/dashboard.jsp");
                    else if (StudenteDAO.exists(username) && StudenteDAO.checkPassword(username, password))
                        res.sendRedirect("/index.html");
                    else
                        res.sendRedirect("/login_failure.jsp");
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
                break;

            case "elenco_studenti":
                try {
                    res.setContentType("text/plain");
                    gson.toJson(StudenteDAO.getAll(), out);
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
                break;
            case "elenco_docenti":
                try {
                    res.setContentType("text/plain");
                    gson.toJson(DocenteDAO.getAll(), out);
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
                break;

            case "elenco_corsi":
                try {
                    res.setContentType("text/plain");
                    gson.toJson(CorsoDAO.getAll(), out);
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
                break;

            case "insegnamenti":
                DocenteDAO daoProf = new DocenteDAO();
                try {
                    List<Docente> list = daoProf.getAllInsegnaMateria
                            (req.getParameter("subject"));
                    out.println(gson.toJson(list));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;

            case "insert-student":
                username = req.getParameter("username");
                nome = req.getParameter("nome");
                cognome = req.getParameter("cognome");
                password = req.getParameter("password");

                try {
                    int status = StudenteDAO.insert(new Studente(username, password, nome, cognome));
                    if (status < 1) res.sendError(500, "0 rows affected");
                } catch (SQLException e) {
                    e.getMessage();
                }
                break;

            case "insert-docente":
                username = req.getParameter("username");
                nome = req.getParameter("nome");
                cognome = req.getParameter("cognome");
                password = req.getParameter("password");

                try {
                    int status = DocenteDAO.insert(new Docente(username,password, nome, cognome));
                    if (status < 1) res.sendError(500, "0 rows affected");
                } catch (SQLException e) {
                    e.getMessage();
                }
                break;

            case "insert-corso":
                titolo = req.getParameter("titolo");

                try {
                    int status = CorsoDAO.insert(new Corso(titolo));
                    if (status < 1) res.sendError(500, "0 rows affected");
                } catch (SQLException e) {
                    e.getMessage();
                }
                break;

            case "prenotazione":
//INSERT INTO prenotazione(stato, studente, docente, id_insegamento, n_slot, data, corso) VALUES ('attiva','gintonik','ippolito',9,'1',current_date,'italiano')
///controller?action=prenotazione&stato=attiva&studente=gintonik&docente=ippolito&slot=4&corso=italiano&data=2018-12-26
                String studente = (String) s.getAttribute("username");
                if (studente == null || studente.isEmpty() ) {
                    System.out.println("studente is null");
                    res.sendRedirect("/JSPs/home.jsp");
//                    System.out.println();
// todo da sistemare; quando session non ha un utente ridirigere verso login
                } else {
                    res.setContentType("application/json");
                    String slot = req.getParameter("slot");
                    docente = req.getParameter("docente");
                    String corso = req.getParameter("corso");
                    data = req.getParameter("data");
                    String stato = req.getParameter("stato");

                    try {
                        int idInsegmanto = InsegnamentoDAO.getIdInsegmanto(corso, docente);
                        Prenotazione p = new Prenotazione(studente, docente, corso, InsegnamentoDAO.getIdInsegmanto(corso, docente), slot, stato, data);

                        out.println(gson.toJson(p));

                        int status = PrenotazioneDAO.insert(p);
                        if (status < 1) res.sendError(500, "0 rows affected");
                    } catch (SQLException e) {
                        e.getMessage();
                    }
                }
                break;

            case "disponibilita":
//                res.setContentType("application/json"); //todo riguardare

                //todo query: mostra professori disponibili in @param:data
                //select * from prenotazione where docente = @param and data = @param
                //questo mi dovrebbe restituire l'elenco di slot occupati per @docente
                docente = req.getParameter("docente");
                data = req.getParameter("data");
                List list = PrenotazioneDAO.getSlotDisponibili(docente, data);
                //ritorna lista di slot disponibili
                out.println(gson.toJson(list));
                System.out.println(gson.toJson(list));
                break;
        }

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            processRequest(req, res);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {
            processRequest(req, res);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

}
