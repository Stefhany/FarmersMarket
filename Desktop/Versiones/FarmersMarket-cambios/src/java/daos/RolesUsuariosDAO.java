/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RolesUsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Conexion.Conection;

/**
 *
 * @author Mona
 */
public class RolesUsuariosDAO {
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Connection cnn = null;
    
    public String insertarRol(RolesUsuariosDTO rol, Connection cnn) {
        this.cnn = cnn;
        int res = 0;
        String sal = "";
        try {
            String querryInsertRol = " INSERT INTO rolesusuarios VALUES (?,?,1);";
            pstmt = cnn.prepareStatement(querryInsertRol);
            pstmt.setInt(1, rol.getRolesId());
            pstmt.setInt(2, rol.getUsuariosId());
            res = pstmt.executeUpdate();
            if (res != 0) {
               sal = "Cambio exitoso";
            }else{
                sal = "Lo siento, no se logro el cambio";
            }
        } catch (SQLException sqle) {
            sal = "Se ha producido la sig excepción: " + sqle.getMessage();
        }
        return sal;
    }
}
