package mx.edu.utez.integradora.models.Tienditas;

import mx.edu.utez.integradora.models.DaoRepository;
import mx.edu.utez.integradora.models.Encuestas.Encuestas;
import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TienditasDao implements DaoRepository<Tienditas> {

    @Override
    public List<Tienditas> findall() {
        List<Tienditas> tiendas = new ArrayList<>();
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM tienditas;");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Tienditas t = new Tienditas();
                t.setId_tiendita(res.getString("id_tiendita"));
                t.setNombre(res.getString("nombre"));
                tiendas.add(t);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tiendas;
    }

    @Override
    public boolean create(Tienditas object) {
        return false;
    }
}