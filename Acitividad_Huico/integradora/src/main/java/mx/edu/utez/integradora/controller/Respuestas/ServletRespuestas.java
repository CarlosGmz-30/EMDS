package mx.edu.utez.integradora.controller.Respuestas;

import com.fasterxml.jackson.databind.ObjectMapper;
import mx.edu.utez.integradora.models.Preguntas.PreguntasDao;
import mx.edu.utez.integradora.models.Respuestas.Respuestas;
import mx.edu.utez.integradora.models.Respuestas.RespuestasDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletRespuestas", urlPatterns = {"/crearRespuestas" , "/mostrarRespuestas"})
public class ServletRespuestas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // si se selecciona una tiendita y encuesta y ya esta seleccionada, mostrar las respuestas que puso
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        RespuestasDao dao = new RespuestasDao();
        switch (option) {
            case "/mostrarRespuestas":
                String id_tiendita = req.getParameter("idTiendita");
                System.out.println("ID Tiendita: " + id_tiendita);
                String id_encuesta = req.getParameter("idEncuesta");
                System.out.println("ID Encuesta: " + id_encuesta);
                Respuestas respuestasList = dao.findRespuestas(id_tiendita, id_encuesta);
                ObjectMapper mapper = new ObjectMapper();
                String respuestasJson = mapper.writeValueAsString(respuestasList);

                resp.setContentType("application/json");
                resp.getWriter().write(respuestasJson);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String option = req.getServletPath();
        RespuestasDao dao =  new RespuestasDao();
        switch (option) {
            case "/crearRespuestas":
                String id_tiendita = req.getParameter("tienditas");
                System.out.println("ID Tiendita: " + id_tiendita);
                String id_encuesta = req.getParameter("encuenta");
                System.out.println("ID Encuesta: " + id_encuesta);

                String id_pregunta1 = req.getParameter("P01");
                String id_pregunta2 = req.getParameter("P02");
                String id_pregunta3 = req.getParameter("P03");
                String id_pregunta4 = req.getParameter("P04");
                String id_pregunta5 = req.getParameter("P05");
                String id_pregunta6 = req.getParameter("P06");
                String id_pregunta7 = req.getParameter("P07");
                String id_pregunta8 = req.getParameter("P08");

                String id_respuesta1 = req.getParameter("Funcionalidad");
                String id_respuesta2 = req.getParameter("Confiabilidad");
                String id_respuesta3 = req.getParameter("Usabilidad");
                String id_respuesta4 = req.getParameter("Rendimiento");
                String id_respuesta5 = req.getParameter("Mantenimiento");
                String id_respuesta6 = req.getParameter("Portabilidad");
                String id_respuesta7 = req.getParameter("Seguridad");
                String id_respuesta8 = req.getParameter("Compatibilidad");

                int valor1 = 0;
                int valor2 = 0;
                int valor3 = 0;
                int valor4 = 0;
                int valor5 = 0;
                int valor6 = 0;
                int valor7 = 0;
                int valor8 = 0;

                if (id_respuesta1.equals("Mala")){
                    valor1 = 1;
                }else if(id_respuesta1.equals("Regular")){
                    valor1 = 2;
                }else if (id_respuesta1.equals("Buena")) {
                    valor1 = 3;
                }else if (id_respuesta1.equals("Muy Buena")){
                    valor1 = 4;
                }else if (id_respuesta1.equals("Excelente")) {
                    valor1 = 5;
                }else {
                    valor1 = 0;
                }

                if (id_respuesta2.equals("Mala")){
                    valor2 = 1;
                }else if(id_respuesta2.equals("Regular")){
                    valor2 = 2;
                }else if (id_respuesta2.equals("Buena")) {
                    valor2 = 3;
                }else if (id_respuesta2.equals("Muy Buena")){
                    valor2 = 4;
                }else if (id_respuesta2.equals("Excelente")) {
                    valor2 = 5;
                }else {
                    valor2 = 0;
                }

                if (id_respuesta3.equals("Mala")){
                    valor3 = 1;
                }else if(id_respuesta3.equals("Regular")){
                    valor3 = 2;
                }else if (id_respuesta3.equals("Buena")) {
                    valor3 = 3;
                }else if (id_respuesta3.equals("Muy Buena")){
                    valor3 = 4;
                }else if (id_respuesta3.equals("Excelente")) {
                    valor3 = 5;
                }else {
                    valor3 = 0;
                }

                if (id_respuesta4.equals("Mala")){
                    valor4 = 1;
                }else if(id_respuesta4.equals("Regular")){
                    valor4 = 2;
                }else if (id_respuesta4.equals("Buena")) {
                    valor4 = 3;
                }else if (id_respuesta4.equals("Muy Buena")){
                    valor4 = 4;
                }else if (id_respuesta4.equals("Excelente")) {
                    valor4 = 5;
                }else {
                    valor4 = 0;
                }

                if (id_respuesta5.equals("Mala")){
                    valor5 = 1;
                }else if(id_respuesta5.equals("Regular")){
                    valor5 = 2;
                }else if (id_respuesta5.equals("Buena")) {
                    valor5 = 3;
                }else if (id_respuesta5.equals("Muy Buena")){
                    valor5 = 4;
                }else if (id_respuesta5.equals("Excelente")) {
                    valor5 = 5;
                }else {
                    valor5 = 0;
                }

                if (id_respuesta6.equals("Mala")){
                    valor6 = 1;
                }else if(id_respuesta6.equals("Regular")){
                    valor6 = 2;
                }else if (id_respuesta6.equals("Buena")) {
                    valor6 = 3;
                }else if (id_respuesta6.equals("Muy Buena")){
                    valor6 = 4;
                }else if (id_respuesta6.equals("Excelente")) {
                    valor6 = 5;
                }else {
                    valor6 = 0;
                }

                if (id_respuesta7.equals("Mala")){
                    valor7 = 1;
                }else if(id_respuesta7.equals("Regular")){
                    valor7 = 2;
                }else if (id_respuesta7.equals("Buena")) {
                    valor7 = 3;
                }else if (id_respuesta7.equals("Muy Buena")){
                    valor7 = 4;
                }else if (id_respuesta7.equals("Excelente")) {
                    valor7 = 5;
                }else {
                    valor7 = 0;
                }

                if (id_respuesta8.equals("Mala")){
                    valor8 = 1;
                }else if(id_respuesta8.equals("Regular")){
                    valor8 = 2;
                }else if (id_respuesta8.equals("Buena")) {
                    valor8 = 3;
                }else if (id_respuesta8.equals("Muy Buena")){
                    valor8 = 4;
                }else if (id_respuesta8.equals("Excelente")) {
                    valor8 = 5;
                }else {
                    valor8 = 0;
                }

                System.out.println("ID Pregunta: " + id_pregunta1 + " valor" + valor1);
                System.out.println("ID Pregunta: " + id_pregunta2 + " valor" + valor2);
                System.out.println("ID Pregunta: " + id_pregunta3 + " valor" + valor3);
                System.out.println("ID Pregunta: " + id_pregunta4 + " valor" + valor4);
                System.out.println("ID Pregunta: " + id_pregunta5 + " valor" + valor5);
                System.out.println("ID Pregunta: " + id_pregunta6 + " valor" + valor6);
                System.out.println("ID Pregunta: " + id_pregunta7 + " valor" + valor7);
                System.out.println("ID Pregunta: " + id_pregunta8 + " valor" + valor8);


                Respuestas respuestas = new Respuestas();

                respuestas.setId_tiendita(id_tiendita);
                respuestas.setId_encuesta(id_encuesta);
                respuestas.setId_pregunta(new String[]{id_pregunta1, id_pregunta2, id_pregunta3, id_pregunta4, id_pregunta5, id_pregunta6, id_pregunta7, id_pregunta8});
                respuestas.setValor(new int[]{valor1, valor2, valor3, valor4, valor5, valor6, valor7, valor8});

                boolean flag = dao.create(respuestas);
                if (flag) {
                    System.out.println("Articulo creado correctamente");
                    resp.sendRedirect("index.jsp");
                    return;
                } else {
                    System.out.println("Error al crear el articulo");
                    resp.sendRedirect("index.jsp");
                    return;
                }
        }
    }



}
