import com.google.gson.Gson;
import dao.DaoProfessore;
import pojo.Professore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Controller", urlPatterns = {"/controller"})
public class Controller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        PrintWriter out = resp.getWriter();
        Gson gson = new Gson();



//        String param = req.getParameter("action");
//        Gson gson = new Gson();


        if (action.equals("query")) {

            DaoProfessore daoProf = new DaoProfessore();
            try {
                List<Professore> list = daoProf.getAllInsegnaMateria
                        (req.getParameter("subject"));
                out.println(gson.toJson(list));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }

}
