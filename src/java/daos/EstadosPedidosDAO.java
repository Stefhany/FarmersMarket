/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.EstadosPedidosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utilidades.Conectar;

/**
 *
 * @author krito
 */
public class EstadosPedidosDAO {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    EstadosPedidosDTO epdto = new EstadosPedidosDTO();
    ArrayList <EstadosPedidosDTO> estados = new ArrayList<>();
    
    public EstadosPedidosDAO (){
        cnn = Conectar.getInstance();
    }
    
    public String insertarEstadoPedido(EstadosPedidosDTO nuevoEstado) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO estadospedidos VALUES (null, ?, ?);");
            pstmt.setString(1, nuevoEstado.getNombre());
            pstmt.setString(2, nuevoEstado.getObservaciones());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "El registro del estado del pedido " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }

    public String modificarEstadoPedido(EstadosPedidosDTO modEstado) {
        try{
        pstmt = cnn.prepareStatement("UPDATE estadospedidos SET nombre = ?, observaciones = ? WHERE idEstadosPedidos = ?;");
        pstmt.setString(1, modEstado.getNombre());
        pstmt.setString(2, modEstado.getObservaciones());
        resultado =  pstmt.executeUpdate();
        
        if (resultado != 0) {
            salida = "La modificación "+ resultado +  " se pudo realizar exitosamente";
        }else{
            salida = "No se pudo realizar la modificación";
        }
        }catch(SQLException sqle){
            salida = "Ha ocurrido lo siguiente... "+sqle.getMessage();
        }       
        return salida;
    }
    
    public ArrayList<EstadosPedidosDTO> listarEstadosPedidos(){
        try{
        pstmt = cnn.prepareStatement("SELECT idEstadosPedidos as id, nombre, observaciones FROM estadospedidos;");
        rs = pstmt.executeQuery();
        
        if (rs != null) {
            while (rs.next()){
                EstadosPedidosDTO espdto = new EstadosPedidosDTO();
                espdto.setIdEstadoPedidos(rs.getInt("id"));
                espdto.setNombre(rs.getString("nombre"));
                espdto.setObservaciones(rs.getString("observaciones"));
                estados.add(espdto);
            }
        }else{
            System.out.println("No se encuetran estados de pedidos");
        }
        }catch(SQLException sqle){
            System.out.println("Se ha producido esta excepción.. "+sqle.getMessage());
        }
        return estados;
    }
    
    public String eliminarEstadoPedido(int id){
        try{
            pstmt = cnn.prepareStatement("DELETE FROM estadospedidos WHERE idEstadosPedidos = ?;");
            pstmt.setInt(1, id);
            resultado = pstmt.executeUpdate();
            
            if (resultado != 0) {
                salida = "El registro " + resultado + " ha sido eliminado. Exitosamente";
            }
        }catch (SQLException sqle){
            salida = "Ocurrio esta excepción "+sqle.getMessage();
        }
        return salida;
    }
    
    public EstadosPedidosDTO consultarByIdEstadoPedido(int id){
        try{
            pstmt = cnn.prepareStatement("SELECT idEstadosPedidos as id, nombre, observaciones FROM estadospedidos WHERE idEstadosPedidos = ?;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while(rs.next()){
                    epdto.setIdEstadoPedidos(rs.getInt("id"));
                    epdto.setNombre(rs.getString("nombre"));
                    epdto.setObservaciones(rs.getString("observaciones"));
                }
            }else{
                System.out.println("No hay registros... ");
            }
        }catch (SQLException sqle){
            System.out.println("Ups! Mira lo ocurrido... "+sqle.getMessage());
        }
        return epdto;
    }
}
