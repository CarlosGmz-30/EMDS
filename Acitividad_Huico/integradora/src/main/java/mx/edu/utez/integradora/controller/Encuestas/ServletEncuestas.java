package mx.edu.utez.integradora.controller.Encuestas;

import mx.edu.utez.integradora.models.Encuestas.Encuestas;
import mx.edu.utez.integradora.models.Encuestas.EncuestasDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletEncuestas", urlPatterns = "/mostarEncuestas")
public class ServletEncuestas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        EncuestasDao dao = new EncuestasDao();
        switch (option) {
            case "/mostarEncuestas":
                List<Encuestas> encuestasList = dao.findall();
                req.getSession().setAttribute("encuestas", encuestasList);
                System.out.println("Encuestas list size: " + encuestasList.size());
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                break;

        }
    }
}
