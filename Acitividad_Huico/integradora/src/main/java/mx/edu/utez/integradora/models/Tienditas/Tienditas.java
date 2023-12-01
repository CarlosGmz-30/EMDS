package mx.edu.utez.integradora.models.Tienditas;

public class Tienditas {
    private String id_tiendita;
    private String nombre;

    public Tienditas() {
    }

    public Tienditas(String id_tiendita, String nombre) {
        this.id_tiendita = id_tiendita;
        this.nombre = nombre;
    }

    public String getId_tiendita() {
        return id_tiendita;
    }

    public void setId_tiendita(String id_tiendita) {
        this.id_tiendita = id_tiendita;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
