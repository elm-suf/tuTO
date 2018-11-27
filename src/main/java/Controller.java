import com.google.gson.Gson;
import dao.*;
import pojo.Docente;
import pojo.Insegnamento;
import pojo.Prenotazione;
import pojo.Studente;

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
        String nome, cognome;

        switch (action) {
            case "login":
                HttpSession s = req.getSession(true);
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                s.setAttribute("username", username);
                s.setAttribute("password", password);
                try {
                    if (AmministratoreDAO.exists(username) && AmministratoreDAO.checkPassword(username, password))
                        res.sendRedirect("/JSPs/Amministratore/dashboard.jsp");
                    else if (StudenteDAO.exists(username) && StudenteDAO.checkPassword(username, password))
                        res.sendRedirect("/JSPs/Studente/login_stu.jsp");
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
                    int status = StudenteDAO.insert(new Studente(username,password, nome, cognome));
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


            case "prenotazione":
//                    String stato, Studente studente, Docente docente, int id_ins, String slot, Date data
                String slot = req.getParameter("slot");
                String docente = req.getParameter("docente");
                String studente = req.getParameter("studente");
                int insegnamento = Integer.parseInt(req.getParameter("insegnamento"));
                String corso = req.getParameter("corso");
                String data = req.getParameter("data");

                try {
                    int idInsegmanto = InsegnamentoDAO.getIdInsegmanto(corso, docente);
                    Prenotazione p = new Prenotazione("attiva", studente, docente, insegnamento, slot, data);

                    out.println(gson.toJson(p));
                    out.println("params = "+slot+"|"+docente+"|"+studente+"|"+insegnamento+"|"+corso+"|"+data);
                    PrenotazioneDAO.insert(p);
                } catch (SQLException e) {
                    e.getMessage();
                }
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
