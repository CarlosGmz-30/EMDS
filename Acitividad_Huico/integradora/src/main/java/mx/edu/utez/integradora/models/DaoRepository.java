package mx.edu.utez.integradora.models;
import mx.edu.utez.integradora.models.Resumen.Resumen;

import java.util.List;
public interface DaoRepository<T> {
    List<T> findall();
    boolean create(T object);
    T findOne(int id);
    List<T> findOne(String id_tiendita, String id_encuesta);
}
