package mx.edu.utez.integradora.models.Respuestas;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RespuestasDao implements DaoRepository<Respuestas> {
    public Respuestas findRespuestas(String idTiendita, String idEncuesta) {
        Connection con = new MysqlConector().connect();
        Respuestas respuestas = new Respuestas();

        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM respuestas WHERE id_tiendita = ? AND id_encuesta = ?;");
            stmt.setString(1, idTiendita);
            stmt.setString(2, idEncuesta);

            // Lists to store id_pregunta and valor
            List<String> idPreguntaList = new ArrayList<>();
            List<Integer> valorList = new ArrayList<>();

            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                respuestas.setId_tiendita(res.getString("id_tiendita"));
                respuestas.setId_encuesta(res.getString("id_encuesta"));
                idPreguntaList.add(res.getString("id_pregunta"));
                valorList.add(res.getInt("valor"));
            }
            // Convert lists to arrays
            respuestas.setId_pregunta(idPreguntaList.toArray(new String[0]));
            respuestas.setValor(valorList.stream().mapToInt(Integer::intValue).toArray());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Cierra la conexión en el bloque finally para asegurar que siempre se cierre
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Manejo básico de la excepción
            }
        }
        return respuestas;
    }


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


}
