package mx.edu.utez.integradora.Test;

import mx.edu.utez.integradora.models.Resumenes.ResumenesDao;

public class MainTest {
    public static void main(String[] args) {
        //String encuesta = "E02";
        ResumenesDao resumenesDao = new ResumenesDao();
        String encuesta = "E02";
        System.out.println("\nEncuesta: " + encuesta);
        System.out.println("Tienditas registradas: " + resumenesDao.numTienditasRegistradas() );
        System.out.println(resumenesDao.numTienditasRegistradas());
        System.out.println(
                "Tienditas evaludas con la encuesta " + encuesta  + ": "
                + resumenesDao.getTienditasEvaluadas(encuesta));
        System.out.println(resumenesDao.getTienditasEvaluadas(encuesta));
        System.out.println("Promedio genral de respuestas: "
                + resumenesDao.getPromedioGeneral(encuesta ));

    }
}
