package mx.edu.utez.integradora.controller.Resumen;

import mx.edu.utez.integradora.models.Respuestas.Respuestas;
import mx.edu.utez.integradora.models.Resumen.Resumen;
import mx.edu.utez.integradora.models.Resumen.ResumenDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletResumen", urlPatterns = "/mostrarResumen")

public class ServletResumen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        ResumenDao dao = new ResumenDao();
        switch (option) {
            case "/mostrarResumen":
                String id_tiendita = req.getParameter("tienditas");
                System.out.println("Pedro: " + id_tiendita);
                String id_encuesta = req.getParameter("encuenta");
                System.out.println("Fenix: " + id_encuesta);

                //
                // Obtener el resultado de la consulta
                List<Resumen> resumen = new ArrayList<>();
                resumen = dao.findOne(id_tiendita, id_encuesta);
                HttpSession misesion = req.getSession();
                misesion.setAttribute("resumen", resumen);

                resp.sendRedirect("resumen.jsp");
                break;
                //
                //
        }
    }
}
