package mx.edu.utez.integradora.controller.Tienditas;

import mx.edu.utez.integradora.models.Tienditas.Tienditas;
import mx.edu.utez.integradora.models.Tienditas.TienditasDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletTienditas", urlPatterns = "/mostrarTienditas")
public class ServletTienditas extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        TienditasDao dao = new TienditasDao();
        switch (option){
            case "/mostrarTienditas":
                List<Tienditas> tienditasList = dao.findall();
                req.getSession().setAttribute("tiendas", tienditasList);
                req.getRequestDispatcher("/index.jsp").forward(req, resp);

        }
    }
}
