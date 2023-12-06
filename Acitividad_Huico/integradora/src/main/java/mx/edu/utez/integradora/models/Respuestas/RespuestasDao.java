package mx.edu.utez.integradora.models.Respuestas;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.models.Resumen.Resumen;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class RespuestasDao implements DaoRepository<Respuestas> {
    @Override
    public List<Respuestas> findall() {
        return null;
    }

    @Override
    public boolean create(Respuestas object) {
        Connection con = new MysqlConector().connect();


        try {

            for (int i = 0; i < 8; i++) {
                PreparedStatement stmt = con.prepareStatement("INSERT INTO respuestas (id_tiendita, id_encuesta, id_pregunta, valor) VALUES (?, ?, ?, ?);");
                stmt.setString(1, object.getId_tiendita());
                stmt.setString(2, object.getId_encuesta());
                stmt.setString(3, object.getId_pregunta()[i]);
                stmt.setInt(4, object.getValor()[i]);
                stmt.executeUpdate();
                if (stmt.getUpdateCount() > 0 && i == 8) {
                    return true;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public Respuestas findOne(int id) {
        return null;
    }

    @Override
    public List<Respuestas> findOne(String id_tiendita, String id_encuesta) {
        return null;
    }
}
