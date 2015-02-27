/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ReportePruebaDTO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utilidades.Conectar;

/**
 *
 * @author Sena
 */
public class ReportePruebaDAO {
    
    private Connection conexion = null;
    private PreparedStatement statement = null;
    private int resultado = 0;
    ResultSet resultadoSet = null;

    public ReportePruebaDAO() {
        conexion = Conectar.getInstance();
    }
    
    public ArrayList<ReportePruebaDTO> mostrarPrueba(){
        ArrayList<ReportePruebaDTO> usuarios = new ArrayList();
        try {
            String querryPrueba = ("SELECT nombres, apellidos, cedula, telefono FROM usuarios;");
            statement = conexion.prepareStatement(querryPrueba);
            resultadoSet = statement.executeQuery();
            if (resultadoSet != null) {
                while (resultadoSet.next()){
                ReportePruebaDTO user = new ReportePruebaDTO();
                user.setNombres(resultadoSet.getString("nombres"));
                user.setApellidos(resultadoSet.getString("apellidos"));
                user.setCedula(resultadoSet.getInt("cedula"));
                user.setTelefono(resultadoSet.getInt("telefono"));
                usuarios.add(user);
                }
            }
        }catch(SQLException sqle){
            System.out.println("Ha ocurrido esto ! "+sqle.getMessage());
        }return usuarios;
    }
}
