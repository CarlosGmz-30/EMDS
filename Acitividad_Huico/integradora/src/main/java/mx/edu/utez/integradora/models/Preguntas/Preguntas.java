package mx.edu.utez.integradora.models.Preguntas;

public class Preguntas {
    private String id_pregunta;
    private String nombre;

    public Preguntas() {
    }

    public Preguntas(String id_pregunta, String nombre) {
        this.id_pregunta = id_pregunta;
        this.nombre = nombre;
    }

    public String getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(String id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
