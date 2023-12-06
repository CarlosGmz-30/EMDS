package mx.edu.utez.integradora.controller.Resumen;

import mx.edu.utez.integradora.models.Respuestas.Respuestas;
import mx.edu.utez.integradora.models.Resumen.Resumen;
import mx.edu.utez.integradora.models.Resumen.ResumenDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletResumen", urlPatterns = "/mostarResumen")
public class ServletResumen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        ResumenDao dao = new ResumenDao();
        switch (option) {
            case "/mostarResumen":
                // Obtén los parámetros directamente de la URL
                String[] pathInfo = req.getPathInfo().split("/");
                if (pathInfo.length == 3) {
                    String idTiendita = pathInfo[1];
                    String idEncuesta = pathInfo[2];

                    // Obtener el resultado de la consulta
                    List<Resumen> resumenList = dao.findOne(idTiendita, idEncuesta);

                    // Almacenar la lista en la sesión
                    req.getSession().setAttribute("resumen", resumenList);

                    // Almacenar información adicional en la respuesta
                    req.setAttribute("tiendita", idTiendita);
                    req.setAttribute("encuesta", idEncuesta);

                    // Redireccionar a la página de resumen
                    req.getRequestDispatcher("/index.jsp").forward(req, resp);
                } else {
                    // Manejar el caso en el que la URL no tiene el formato esperado
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de URL incorrecto");
                }
                break;
            default:
                // Puedes agregar un mensaje o información adicional antes de redirigir
                resp.sendRedirect("index.jsp");
        }
    }
}
