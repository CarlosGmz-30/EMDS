package mx.edu.utez.integradora.models;
import java.util.List;
public interface DaoRepository<T> {
    List<T> findall();
}
