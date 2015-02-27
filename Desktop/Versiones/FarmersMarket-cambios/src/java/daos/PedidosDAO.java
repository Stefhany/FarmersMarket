/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoriaDTO;
import dtos.PedidoDTO;
import dtos.ProductoDTO;
import dtos.UsuariosDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
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
    String res = " ";

    public PedidosDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertar(PedidoDTO nuevoPedido) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO ofertas VALUES (null, ?,?,?,?,?,?,?);");
            pstmt.setInt(1, nuevoPedido.getCantidadSolicitada());
            pstmt.setString(2, nuevoPedido.getFechaSolicitada());
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
            pstmt.setString(2, modPedido.getFechaSolicitada());
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
                    peddto.setFechaSolicitada(rs.getString("fechaSolicitud"));
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
        PedidoDTO ped = null;
        try {
            String queryByPedido = " select idPedidos,idCategorias, nombreCategoria, idUsuarios, concat(nombres,' ',apellidos) as Distribuidor, "
                    + " idProductos, nombreProducto, cantidadSolicitada, fechaSolicitud "
                    + " from usuarios u "
                    + " inner join pedidos p on "
                    + " u.idUsuarios = p.distribuidorId "
                    + " inner join productos pro on "
                    + " p.productosId = pro.idProductos "
                    + " inner join categorias c on "
                    + " pro.categoriasId = c.idCategorias "
                    + " where idPedidos=?;";
            pstmt = cnn.prepareStatement(queryByPedido);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO(rs.getString("Distribuidor"));
                    CategoriaDTO categoria = new CategoriaDTO();
                    categoria.setNombre(rs.getString("nombreCategoria"));
                    ProductoDTO producto = new ProductoDTO(categoria);
                    ped = new PedidoDTO(user, producto);
                    ped.setPedidosId(rs.getInt("idPedidos"));
                    ped.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    ped.setFechaSolicitada(rs.getString("fechaSolicitud"));
                }
            } else {
                System.out.println("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            System.out.println("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return ped;
    }

    public String insertarPedido(int idProductoAsociado, int productoId,
            int distribuidorId, int productorId, int cantidadPedida,
            int idOferta, String fechaSolicitud) {
        int sal = 0;
        try {
            cllstmt = cnn.prepareCall("{call ps_registrarPedidov4 (?,?,?,?,?,?,?,?)}");
            cllstmt.setInt(1, idProductoAsociado);
            cllstmt.setInt(2, productoId);
            cllstmt.setInt(3, distribuidorId);
            cllstmt.setInt(4, productorId);
            cllstmt.setInt(5, cantidadPedida);
            cllstmt.setInt(6, idOferta);
            cllstmt.setString(7, fechaSolicitud);
            cllstmt.registerOutParameter(8, java.sql.Types.INTEGER);
            cllstmt.execute();
            sal = cllstmt.getInt(8);

            if (sal == -1) {
                res = "No ha tenido modificación la base de datos";
            } else if (sal == 1) {
                res = "Bien. Revisa la base de datos";
            } else if (sal == 2) {
                res = "Bien.";
            } else {
                res = "something was wrong!!!";
            }
        } catch (SQLException sqle) {
            res = "Pilas! Ocurrio la siguiente excepción " + sqle.getMessage();
        }
        return res;
    }

    public LinkedList<PedidoDTO> consultarSolicitudesDistribuidor() {
        LinkedList<PedidoDTO> solicitudesDistribuidores = new LinkedList<>();
        PedidoDTO pedido = null;
        try {
            String querySolicitudes = "select idPedidos, idUsuarios, concat(nombres,' ',apellidos) as Distribuidor, "
                    + " idproductos, nombreProducto, cantidadSolicitada, fechaSolicitud, "
                    + " idPedidos "
                    + " from productos pro "
                    + " inner join pedidos pe on "
                    + " pro.idProductos = pe.productosId "
                    + " inner join usuarios u on "
                    + " pe.distribuidorId = u.idUsuarios"
                    + " order by idPedidos asc;";
            pstmt = cnn.prepareStatement(querySolicitudes);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO();
                    user.setNombres(rs.getString("Distribuidor"));
                    ProductoDTO pdto = new ProductoDTO();
                    pdto.setNombre(rs.getString("nombreProducto"));
                    pedido = new PedidoDTO(user, pdto);
                    pedido.setPedidosId(rs.getInt("idPedidos"));
                    pedido.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    pedido.setFechaSolicitada(rs.getString("fechaSolicitud"));
                    solicitudesDistribuidores.add(pedido);
                }
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido lo siguiente: " + sqle.getMessage() + " y revisa esto tambien: " + sqle.getSQLState();
        }
        return solicitudesDistribuidores;
    }
}
