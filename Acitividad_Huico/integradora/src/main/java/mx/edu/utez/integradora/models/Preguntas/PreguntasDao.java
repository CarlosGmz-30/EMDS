package mx.edu.utez.integradora.models.Preguntas;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.models.Encuestas.Encuestas;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PreguntasDao implements DaoRepository<Preguntas> {
    @Override
    public List<Preguntas> findall() {
        List<Preguntas> preguntas = new ArrayList<>();
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM preguntas;");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Preguntas p = new Preguntas();
                p.setId_pregunta(res.getString("id_pregunta"));
                p.setNombre(res.getString("nombre"));
                preguntas.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return preguntas;
    }

    @Override
    public boolean create(Preguntas object) {
        return false;
    }
}
