package mx.edu.utez.integradora.controller.Preguntas;

import mx.edu.utez.integradora.models.Preguntas.Preguntas;
import mx.edu.utez.integradora.models.Preguntas.PreguntasDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletPreguntas", urlPatterns = "/mostrarPreguntas")
public class ServletPreguntas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        PreguntasDao dao = new PreguntasDao();
        switch (option){
            case "/mostrarPreguntas":
                List<Preguntas> preguntasList = dao.findall();
                req.getSession().setAttribute("preguntas", preguntasList);
                System.out.println("Preguntas list size: " + preguntasList.size());
                req.getRequestDispatcher("/index.jsp").forward(req, resp);

        }
    }
}
