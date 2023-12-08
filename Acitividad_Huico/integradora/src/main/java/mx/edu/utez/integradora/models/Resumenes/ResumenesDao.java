package mx.edu.utez.integradora.models.Resumenes;

import mx.edu.utez.integradora.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResumenesDao {

    public int numTienditasRegistradas() {
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(DISTINCT id_tiendita) AS 'TienditasRegistradas' FROM tienditas;");
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                return res.getInt("TienditasRegistradas");
            } else {

                return -1;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public int getTienditasEvaluadas(String idTiendita) {
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("CALL ObtenerTienditasEvaluadas(?);");
            stmt.setString(1,idTiendita);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                return res.getInt("NumeroTienditasEvaluadas");
            } else {

                return -1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public double getPromedioGeneral(String idTiendita) {
        Connection con = new MysqlConector().connect();
        try {
            PreparedStatement stmt = con.prepareStatement("CALL ObtenerPromedioGeneral(?);");
            stmt.setString(1,idTiendita);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                return res.getDouble("PromedioGeneralDeRespuestas");
            } else {

                return -1;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }




}
