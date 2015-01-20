/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.DespachosPedidosDTO;
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
public class DespachosPedidosDAO {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    
    ArrayList <DespachosPedidosDTO> despachos = new ArrayList();

    public DespachosPedidosDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarDespacho(DespachosPedidosDTO nuevoDespacho) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO despachospedidos VALUES (null, ?,?,?,?,?);");
            pstmt.setString(1, nuevoDespacho.getDireccionDespacho());
            pstmt.setDate(2, nuevoDespacho.getFechaDespacho());
            pstmt.setString(3, nuevoDespacho.getObservaciones());
            pstmt.setInt(4, nuevoDespacho.getPedidosId());
            pstmt.setInt(5, nuevoDespacho.getUsuariosId());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "El registro del pedido " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }

    public String modificarDespacho(DespachosPedidosDTO modDespacho) {
        try{
        pstmt = cnn.prepareStatement("UPDATE despachospedidos SET direccionEntrega = ?, fechaEntrega = ?, observaciones = ?, pedidosId = ?, usuariosId = ?  WHERE idDespachosPedidos = ?;");
        pstmt.setString(1, modDespacho.getDireccionDespacho());
        pstmt.setDate(2, modDespacho.getFechaDespacho());
        pstmt.setString(3, modDespacho.getObservaciones());
        pstmt.setInt(4, modDespacho.getPedidosId());
        pstmt.setInt(5, modDespacho.getUsuariosId());
        resultado =  pstmt.executeUpdate();
        
        if (resultado != 0) {
            salida = "La modificación se pudo realizar "+ resultado + "exitosamente";
        }else{
            salida = "No se pudo realizar la modificación";
        }
        }catch(SQLException sqle){
            salida = "Ha ocurrido lo siguiente... "+sqle.getMessage();
        }       
        return salida;
    }
    
    public ArrayList<DespachosPedidosDTO> listarDespachos(){
        try{
        pstmt = cnn.prepareStatement("SELECT idDespachosPedidos as id, direccionEntrega, fechaEntrega, observaciones, pedidosId, usuariosId FROM despachospedidos;");
        rs = pstmt.executeQuery();
        
        if (rs != null) {
            while (rs.next()){
                DespachosPedidosDTO dpdto = new DespachosPedidosDTO();
                dpdto.setIdDespachos(rs.getInt("id"));
                dpdto.setDireccionDespacho(rs.getString("direccionEntrega"));
                dpdto.setFechaDespacho(rs.getDate("fechaEntrega"));
                dpdto.setObservaciones(rs.getString("observaciones"));
                dpdto.setPedidosId(rs.getInt("pedidosId"));
                despachos.add(dpdto);
            }
        }else{
            System.out.println("No se encuetran registros de categorias");
        }
        }catch(SQLException sqle){
            System.out.println("Se ha producido esta excepción.. "+sqle.getMessage());
        }
        return despachos;
    }
    
    public String eliminarDespacho(int id){
        try{
            pstmt = cnn.prepareStatement("DELETE FROM despachospedidos WHERE idDespachosPedidos = ?;");
            pstmt.setInt(1, id);
            resultado = pstmt.executeUpdate();
            
            if (resultado != 0) {
                salida = "Registro " + resultado + " eliminado. Exitosamente";
            }
        }catch (SQLException sqle){
            salida = "Ocurrio esta excepción "+sqle.getMessage();
        }
        return salida;
    }
    
    public DespachosPedidosDTO consultarById(int id){
        DespachosPedidosDTO depdto = new DespachosPedidosDTO();
        try{
            pstmt = cnn.prepareStatement("SELECT idDespachosPedidos as id, direccionEntrega, fechaEntrega, observaciones, pedidosId, usuariosId FROM despachospedidos WHERE idDespachosPedidos = ?;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while(rs.next()){
                    depdto.setIdDespachos(rs.getInt("id"));
                    depdto.setDireccionDespacho(rs.getString("direccionEntrega"));
                    depdto.setFechaDespacho(rs.getDate("fechaEntrega"));
                    depdto.setObservaciones(rs.getString("observaciones"));
                    depdto.setPedidosId(rs.getInt("pedidosId"));
                    depdto.setUsuariosId(rs.getInt("usuariosId"));
                }
            }else{
                System.out.println("No hay registros, por esa busqueda... ");
            }
        }catch (SQLException sqle){
            System.out.println("Ups! Mira lo ocurrido... "+sqle.getMessage());
        }
        return depdto;
    }
}
