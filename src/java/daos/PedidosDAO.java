/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.PedidoDTO;
import java.sql.CallableStatement;
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
public class PedidosDAO {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    PedidoDTO pedto = new PedidoDTO();
    ArrayList<PedidoDTO> pedidos = new ArrayList();
    CallableStatement cllstmt = null;

    public PedidosDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarOferta(PedidoDTO nuevoPedido) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO ofertas VALUES (null, ?,?,?,?,?,?,?);");
            pstmt.setInt(1, nuevoPedido.getCantidadSolicitada());
            pstmt.setDate(2, nuevoPedido.getFechaSolicitada());
            pstmt.setInt(3, nuevoPedido.getEstadosPedidosId());
            pstmt.setInt(4, nuevoPedido.getProductosId());
            pstmt.setInt(5, nuevoPedido.getProductorId());
            pstmt.setInt(6, nuevoPedido.getProductosAsociadosUsuariosId());
            pstmt.setInt(7, nuevoPedido.getDistribuidorId());
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

    public String modificarPedido(PedidoDTO modPedido) {
        try {
            pstmt = cnn.prepareStatement("UPDATE pedidos SET cantidadSolicitada = ?, fechaSolicitud = ?, estadosPedidosId = ?, productosId = ?, productorId = ?, productosAsociadosUsuariosId = ?, distribuidorId = ? WHERE idPedidos = ?;");
            pstmt.setInt(1, modPedido.getCantidadSolicitada());
            pstmt.setDate(2, modPedido.getFechaSolicitada());
            pstmt.setInt(3, modPedido.getEstadosPedidosId());
            pstmt.setInt(4, modPedido.getProductosId());
            pstmt.setInt(5, modPedido.getProductorId());
            pstmt.setInt(6, modPedido.getProductosAsociadosUsuariosId());
            pstmt.setInt(7, modPedido.getDistribuidorId());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "La modificación " + resultado + " se pudo realizar, exitosamente";
            } else {
                salida = "No se pudo realizar la modificación";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido lo siguiente... " + sqle.getMessage();
        }
        return salida;
    }

    public ArrayList<PedidoDTO> listarPedidos() {
        try {
            pstmt = cnn.prepareStatement("SELECT idPedidos as id, cantidadSolicitada, fechaSolicitud, estadosPedidosId, productosId, productorId, productosAsociadosUsuariosId as proAsoId, distribuidorId FROM pedidos;");
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    PedidoDTO peddto = new PedidoDTO();
                    peddto.setPedidosId(rs.getInt("id"));
                    peddto.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    peddto.setFechaSolicitada(rs.getDate("fechaSolicitud"));
                    peddto.setEstadosPedidosId(rs.getInt("estadosPedidosId"));
                    peddto.setProductosId(rs.getInt("productosId"));
                    peddto.setProductorId(rs.getInt("productorId"));
                    peddto.setProductosAsociadosUsuariosId(rs.getInt("proAsoId"));
                    peddto.setDistribuidorId(rs.getInt("distribuidorId"));
                    pedidos.add(peddto);
                }
            } else {
                System.out.println("No se encuetran registros de pedidos");
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido esta excepción.. " + sqle.getMessage());
        }
        return pedidos;
    }

    public String eliminarPedido(int id) {
        try {
            pstmt = cnn.prepareStatement("DELETE FROM pedidos WHERE idPedidos = ?;");
            pstmt.setInt(1, id);
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "Registro " + resultado + " eliminado. Exitosamente";
            }
        } catch (SQLException sqle) {
            salida = "Ocurrio esta excepción " + sqle.getMessage();
        }
        return salida;
    }

    public PedidoDTO consultarByIdPedido(int id) {
        try {
            pstmt = cnn.prepareStatement("SELECT idPedidos as id, cantidadSolicitada, fechaSolicitud, estadosPedidosId, productosId, productorId, productosAsociadosUsuariosId as proAsoId, distribuidorId FROM pedidos WHERE idPedidos = ?;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    pedto.setPedidosId(rs.getInt("id"));
                    pedto.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    pedto.setFechaSolicitada(rs.getDate("fechaSolicitud"));
                    pedto.setEstadosPedidosId(rs.getInt("estadosPedidosId"));
                    pedto.setProductosId(rs.getInt("productosId"));
                    pedto.setProductorId(rs.getInt("productorId"));
                    pedto.setProductosAsociadosUsuariosId(rs.getInt("proAsoId"));
                    pedto.setDistribuidorId(rs.getInt("distribuidorId"));
                }
            } else {
                System.out.println("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            System.out.println("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return pedto;
    }
    
    
    public String registrarPedido(int idProductoAsociado, int productoId, int distribuidorId, int productorId, int cantidadPedida, int idOferta ){
        try{
            cllstmt = cnn.prepareCall("{call ps_registrarPedidov4 (?,?,?,?,?,?,?)}");
            cllstmt.setInt(1, idProductoAsociado);
            cllstmt.setInt(2, productoId);
            cllstmt.setInt(3, distribuidorId);
            cllstmt.setInt(4, productorId);
            cllstmt.setInt(5, cantidadPedida);
            cllstmt.setInt(6, idOferta);
            cllstmt.registerOutParameter(7, java.sql.Types.INTEGER);
            cllstmt.execute();
            resultado = cllstmt.getInt(7);
            if (resultado == 0) {
                salida = "No paso nada";
            }else if(resultado == 1){
                salida = "Paso algo";
            }else{
                salida = "No se que ha ocurrido";
            }
        }catch (SQLException sqle){
            salida = "Ha ocurrido esto... "+sqle.getMessage()+sqle.getSQLState();
        }
        return salida;
    }
}
