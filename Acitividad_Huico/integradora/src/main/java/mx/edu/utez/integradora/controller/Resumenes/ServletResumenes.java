package mx.edu.utez.integradora.controller.Resumenes;


import com.google.gson.JsonObject;
import mx.edu.utez.integradora.models.Resumenes.Resumen;
import mx.edu.utez.integradora.models.Resumenes.ResumenesDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ServletResumenes", urlPatterns = "/mostrarResumen")
public class ServletResumenes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        String idEncuesta = req.getParameter("idEncuesta");
        System.out.println("idEncuesta: " + idEncuesta);
        String option = req.getServletPath();
        ResumenesDao dao = new ResumenesDao();
        switch (option) {
            case "/mostrarResumen":
                int numTiendas = dao.numTienditasRegistradas();
                int numTiendasEvaluadas = dao.getTienditasEvaluadas(idEncuesta);
                double promedioGeneral = dao.getPromedioGeneral(idEncuesta);

                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("numTiendas", numTiendas);
                jsonResponse.addProperty("numTiendasEvaluadas", numTiendasEvaluadas);
                jsonResponse.addProperty("promedioGeneral", promedioGeneral);

                // Escribe la respuesta JSON en el PrintWriter
                try (PrintWriter out = resp.getWriter()) {
                    out.println(jsonResponse.toString());
                }
                req.getRequestDispatcher("/index.jsp").forward(req, resp);

        }
    }
}
