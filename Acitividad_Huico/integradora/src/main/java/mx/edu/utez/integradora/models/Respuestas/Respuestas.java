package mx.edu.utez.integradora.models.Respuestas;

public class Respuestas {
/*
    id_respuesta varchar(5) not null primary key,
    id_tiendita varchar(5) not null,
    id_encuesta varchar(5) not null,
    id_pregunta varchar(5) not null,
    valor int not null,*/

    private int id_respuesta;
    private String id_tiendita;
    private String id_encuesta;
    private String[] id_pregunta;
    private int[] valor;

    public Respuestas() {
    }

    public Respuestas(int id_respuesta, String id_tiendita, String id_encuesta, String[] id_pregunta, int[] valor) {
        this.id_respuesta = id_respuesta;
        this.id_tiendita = id_tiendita;
        this.id_encuesta = id_encuesta;
        this.id_pregunta = id_pregunta;
        this.valor = valor;
    }

    public int getId_respuesta() {
        return id_respuesta;
    }

    public void setId_respuesta(int id_respuesta) {
        this.id_respuesta = id_respuesta;
    }

    public String getId_tiendita() {
        return id_tiendita;
    }

    public void setId_tiendita(String id_tiendita) {
        this.id_tiendita = id_tiendita;
    }

    public String getId_encuesta() {
        return id_encuesta;
    }

    public void setId_encuesta(String id_encuesta) {
        this.id_encuesta = id_encuesta;
    }

    public String[] getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(String[] id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public int[] getValor() {
        return valor;
    }

    public void setValor(int[] valor) {
        this.valor = valor;
    }
}
