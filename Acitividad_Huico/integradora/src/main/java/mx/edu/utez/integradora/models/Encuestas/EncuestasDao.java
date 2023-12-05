package mx.edu.utez.integradora.models.Encuestas;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EncuestasDao implements DaoRepository<Encuestas> {
    @Override
    public List<Encuestas> findall() {
        List<Encuestas> encuestas = new ArrayList<>();
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM encuestas;");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Encuestas e = new Encuestas();
                e.setId_encuesta(res.getString("id_encuesta"));
                e.setNombre(res.getString("nombre"));
                encuestas.add(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return encuestas;
    }

    @Override
    public boolean create(Encuestas object) {
        return false;
    }

}
