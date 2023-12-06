package mx.edu.utez.integradora.models.Resumen;

public class Resumen {
    //id de tienda
    //id de encuesta
    //porcentaje indivual
    //porcentaje grupal
    private String tiendita;
    private String encuesta;
    private double promedioRespuestasPorcentaje;
    //
    public Resumen() {
    }

    public Resumen(String tiendita, String encuesta, double promedioRespuestasPorcentaje) {
        this.tiendita = tiendita;
        this.encuesta = encuesta;
        this.promedioRespuestasPorcentaje = promedioRespuestasPorcentaje;
    }

    //

    public String getTiendita() {
        return tiendita;
    }

    public void setTiendita(String tiendita) {
        this.tiendita = tiendita;
    }

    public String getEncuesta() {
        return encuesta;
    }

    public void setEncuesta(String encuesta) {
        this.encuesta = encuesta;
    }

    public double getPromedioRespuestasPorcentaje() {
        return promedioRespuestasPorcentaje;
    }

    public void setPromedioRespuestasPorcentaje(double promedioRespuestasPorcentaje) {
        this.promedioRespuestasPorcentaje = promedioRespuestasPorcentaje;
    }
}
