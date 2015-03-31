/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.DespachosPedidosDTO;
import dtos.ProductoDTO;
import dtos.SolicitudDistribuidorDTO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Conexion.Conection;
import utilidades.MyException;

/**
 *
 * @author krito
 */
public class DespachosPedidosDAO {

    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Connection cnn = null;    

    public String insertarDespacho(DespachosPedidosDTO nuevoDespacho, Connection cnn) {
        this.cnn = cnn;
        String salida = "";
        int resultado = 0;
        try {
            pstmt = cnn.prepareStatement("INSERT INTO despachospedidos VALUES (null, ?,?,?,?,?);");
            pstmt.setString(1, nuevoDespacho.getDireccionDespacho());
            pstmt.setString(2, nuevoDespacho.getFechaDespacho());
            pstmt.setString(3, nuevoDespacho.getObservaciones());
            pstmt.setInt(4, nuevoDespacho.getUsuariosId());
            pstmt.setInt(5, nuevoDespacho.getSolicitudId());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "Despacho registrado satisfactorio. ";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }

    public LinkedList<SolicitudDistribuidorDTO> mostrarDespachosPendientes() throws MyException {
        LinkedList<SolicitudDistribuidorDTO> solicitudes = new LinkedList();
        try {
            String querryAllDespachos = " select idSolicitudDistribuidor, idUsuarios,"
                    + " CONCAT(u.nombres,' ',u.apellidos) as Solicitante, "
                    + " direccion as direccion, telefono as telefono, idProductos, nombreProducto,"
                    + " cantidadSolicitada, fechaSolicitud, fechaEntregaInterna from usuarios u inner join "
                    + " solicituddistribuidor s on u.idUsuarios = s.distribuidorId "
                    + " inner join productos p on s.productosId = p.idProductos "
                    + " where s.estadosPedidosId = 5;";
            pstmt = cnn.prepareStatement(querryAllDespachos);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO(rs.getInt("idUsuarios"), rs.getString("Solicitante"),
                            rs.getInt("telefono"), rs.getString("direccion"));
                    ProductoDTO pro = new ProductoDTO(rs.getInt("idProductos"), rs.getString("nombreProducto"));
                    SolicitudDistribuidorDTO solicitud = new SolicitudDistribuidorDTO(user, pro);
                    solicitud.setIdSolicitud(rs.getInt("idSolicitudDistribuidor"));
                    solicitud.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    solicitud.setFechaSolicitud(rs.getString("fechaSolicitud"));
                    solicitud.setFechaEntregaInterna(rs.getString("fechaEntregaInterna"));
                    solicitudes.add(solicitud);
                }
            } else {
                throw new MyException("No hay registros en la base de datos");
            }
        } catch (SQLException sqle) {
            throw new MyException("Ha pasado esta excepción!! " + sqle.getMessage());
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DespachosPedidosDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }
        return solicitudes;
    }

    public SolicitudDistribuidorDTO consultarSolicitud(int id) {
        SolicitudDistribuidorDTO solicitud = null;
        String salida = "";
        try {
            String querrySolicitudesDistribuidor = " select idSolicitudDistribuidor, idUsuarios, "
                    + " CONCAT(u.nombres,' ',u.apellidos) as Solicitante, "
                    + " direccion,idProductos, nombreProducto, "
                    + " fechaSolicitud from usuarios u inner join "
                    + " solicituddistribuidor s on u.idUsuarios = s.distribuidorId "
                    + " inner join productos p on s.productosId = p.idProductos "
                    + " WHERE  idSolicitudDistribuidor = ?;";
            pstmt = cnn.prepareStatement(querrySolicitudesDistribuidor);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO(rs.getInt("idUsuarios"), rs.getString("Solicitante"),rs.getString("direccion"));
                    ProductoDTO pro = new ProductoDTO(rs.getInt("idProductos"), rs.getString("nombreProducto"));
                    solicitud = new SolicitudDistribuidorDTO(user, pro);
                    solicitud.setIdSolicitud(rs.getInt("idSolicitudDistribuidor"));
                    solicitud.setFechaSolicitud(rs.getString("fechaSolicitud"));
                }
            }

        } catch (SQLException sqle) {
            salida = "Mira lo que ocurrio! " + sqle.getMessage() + " y " + sqle.getSQLState();
        }
        return solicitud;
    }
}
