package mx.edu.utez.integradora.models.Resumenes;

public class Resumen {

    private String id_encuesta;
    private String nombreEncuesta;
    private int tienditasRegistradas;
    private int TienditasReapuestas;
    private double promedioGeneral;

    public Resumen(){

    }

    public Resumen(String id_encuesta, String nombreEncuesta, int tienditasRegistradas, int tienditasReapuestas, double promedioGeneral) {
        this.id_encuesta = id_encuesta;
        this.nombreEncuesta = nombreEncuesta;
        this.tienditasRegistradas = tienditasRegistradas;
        TienditasReapuestas = tienditasReapuestas;
        this.promedioGeneral = promedioGeneral;
    }

    public String getId_encuesta() {
        return id_encuesta;
    }

    public void setId_encuesta(String id_encuesta) {
        this.id_encuesta = id_encuesta;
    }

    public String getNombreEncuesta() {
        return nombreEncuesta;
    }

    public void setNombreEncuesta(String nombreEncuesta) {
        this.nombreEncuesta = nombreEncuesta;
    }

    public int getTienditasRegistradas() {
        return tienditasRegistradas;
    }

    public void setTienditasRegistradas(int tienditasRegistradas) {
        this.tienditasRegistradas = tienditasRegistradas;
    }

    public int getTienditasReapuestas() {
        return TienditasReapuestas;
    }

    public void setTienditasReapuestas(int tienditasReapuestas) {
        TienditasReapuestas = tienditasReapuestas;
    }

    public double getPromedioGeneral() {
        return promedioGeneral;
    }

    public void setPromedioGeneral(double promedioGeneral) {
        this.promedioGeneral = promedioGeneral;
    }
}
