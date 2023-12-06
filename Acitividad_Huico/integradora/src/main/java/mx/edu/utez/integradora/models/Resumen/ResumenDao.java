package mx.edu.utez.integradora.models.Resumen;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResumenDao implements DaoRepository<Resumen> {
    @Override // Creo que no se ocupa
    public List<Resumen> findall() {
        return null;
    }

    @Override //este tampoco se ocupa, creo
    public boolean create(Resumen object) {
        return false;
    }

    @Override // Este tampoco se ocupa
    public Resumen findOne(int id) {
        return null;
    }
    @Override
    public List<Resumen> findOne(String id_tiendita, String id_encuesta) {
        List<Resumen> resultados = new ArrayList<>();
        Connection con = new MysqlConector().connect();

        try {
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT t.id_tiendita, t.nombre AS 'Tiendita', e.id_encuesta, e.nombre AS 'Encuesta', " +
                            "AVG((r.valor - 1) / 4.0) * 100 AS 'PromedioRespuestasPorcentaje' " +
                            "FROM tienditas t " +
                            "JOIN respuestas r ON t.id_tiendita = r.id_tiendita " +
                            "JOIN encuestas e ON r.id_encuesta = e.id_encuesta " +
                            "WHERE t.id_tiendita = ? AND e.id_encuesta = ? " +
                            "GROUP BY t.id_tiendita, e.id_encuesta");

            stmt.setString(1, id_tiendita);
            stmt.setString(2, id_encuesta);

            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                Resumen resumen = new Resumen(
                        res.getString("Tiendita"),
                        res.getString("Encuesta"),
                        res.getDouble("PromedioRespuestasPorcentaje")
                );
                resultados.add(resumen);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return resultados;
    }
}
