package mx.edu.utez.integradora.Test;

import mx.edu.utez.integradora.models.Respuestas.Respuestas;
import mx.edu.utez.integradora.models.Respuestas.RespuestasDao;
import mx.edu.utez.integradora.models.Resumenes.ResumenesDao;

import java.util.List;

public class MainTest {
    public static void main(String[] args) {
        //String encuesta = "E02";
       /* ResumenesDao resumenesDao = new ResumenesDao();
        String encuesta = "E02";
        System.out.println("\nEncuesta: " + encuesta);
        System.out.println("Tienditas registradas: " + resumenesDao.numTienditasRegistradas() );
        System.out.println(resumenesDao.numTienditasRegistradas());
        System.out.println(
                "Tienditas evaludas con la encuesta " + encuesta  + ": "
                + resumenesDao.getTienditasEvaluadas(encuesta));
        System.out.println(resumenesDao.getTienditasEvaluadas(encuesta));
        System.out.println("Promedio genral de respuestas: "
                + resumenesDao.getProcmedioGeneral(encuesta ));*/


//
//        // probar el findRespuestas
        RespuestasDao respuestasDao = new RespuestasDao();
//        System.out.println(respuestasDao.findRespuestas("TDA02", "E01"));
//
//        System.out.println("----------------------------------------------------------------------------------");
//
//        List<Respuestas> respuestasList = respuestasDao.findRespuestas("TDA02", "E01");
//
//
//        for (Respuestas respuestas : respuestasList) {
//            System.out.println(respuestas);
//        }

        List<Respuestas> respuestasList = respuestasDao.findRespuestas("TDC03", "E01");

        mostrarRespuestas(respuestasList);

        System.out.println("----------------------------------------------------------------------------------");

        mostrarRespuestas2(respuestasList);

    }


    // imprimir las respuestas de una tiendita usando el toString
    public static void mostrarRespuestas2(List<Respuestas> respuestas){
        System.out.printf("%-15s %-15s %-15s %-15s %-15s " , "id_respuesta","id_tiendita","id_encuesta","id_pregunta","Valor");
        System.out.println();
        for(Respuestas r : respuestas){
            System.out.println(r);
        }
    }
    public static void mostrarRespuestas(List<Respuestas> respuestas){
        System.out.printf("%-15s %-15s %-15s %-15s %-15s " , "id_respuesta","id_tiendita","id_encuesta","id_pregunta","Valor");
        System.out.println();
        for(Respuestas r : respuestas){
            System.out.printf("%-15s %-15s %-15s %-15s %-15s" , r.getId_respuesta(), r.getId_tiendita(), r.getId_encuesta(), r.getId_pregunta(), r.getValor());
            System.out.println();
        }
    }


}
