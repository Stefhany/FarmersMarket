/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ProductoDTO;
import dtos.SolicitudDistribuidorDTO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import utilidades.Conectar;

/**
 *
 * @author krito
 */
public class SolicitudDistribuidorDAO {

    PreparedStatement pstmt = null;
    Connection cnn = null;
    ResultSet rs = null;
    int resultado = 0;
    String salida = "";

    public SolicitudDistribuidorDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarSolicitudDistribuidor(SolicitudDistribuidorDTO solicitud) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO solicituddistribuidor VALUES (null,?,current_date(),?,null,3,?,?);");
            pstmt.setInt(1, solicitud.getCantidadSolicitada());
            pstmt.setString(2, solicitud.getFechaSolicitud());
            //pstmt.setString(3, solicitud.getFechaEntregaInterna());
            pstmt.setInt(3, solicitud.getProductoId());
            pstmt.setInt(4, solicitud.getDistribuidorId());
            resultado = pstmt.executeUpdate();
            if (resultado != 0) {
                salida = "El registro de la solicitud " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();
        }
        return salida;
    }

    public LinkedList<SolicitudDistribuidorDTO> listarSolicitudesDistribuidor() {
        LinkedList<SolicitudDistribuidorDTO> solicitudes = new LinkedList();
        try {
            String querrySolicitudesDistribuidor = " select idSolicitudDistribuidor, idUsuarios, "
                    + " concat(nombres,' ',apellidos) as Distribuidor, idProductos, "
                    + " nombreProducto, cantidadSolicitada, fechaSolicitud "
                    + " from solicituddistribuidor  s "
                    + " inner join productos p on "
                    + " p.idProductos = s.productosId "
                    + " inner join usuarios u on "
                    + " u.idUsuarios = s.distribuidorId;";
            pstmt = cnn.prepareStatement(querrySolicitudesDistribuidor);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO(rs.getInt("idUsuarios"), rs.getString("Distribuidor"));
                    ProductoDTO pro = new ProductoDTO(rs.getInt("idProductos"), rs.getString("nombreProducto"));
                    SolicitudDistribuidorDTO solicitud = new SolicitudDistribuidorDTO(user, pro);
                    solicitud.setIdSolicitud(rs.getInt("idSolicitudDistribuidor"));
                    solicitud.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    solicitud.setFechaSolicitud(rs.getString("fechaSolicitud"));
                    solicitudes.add(solicitud);
                }
            }
        } catch (SQLException sqle) {
            salida = "Mira lo que ocurrio! " + sqle.getMessage() + " y " + sqle.getSQLState();
        }
        return solicitudes;
    }

    public SolicitudDistribuidorDTO byIdRequest(int id) {
        SolicitudDistribuidorDTO solicitud = null;
        try {
            String querrySolicitudesDistribuidor = " SELECT idSolicitudDistribuidor, idUsuarios,"
                    + " concat(nombres, ' ', apellidos) AS Distribuidor, idProductos, nombreProducto,"
                    + " cantidadSolicitada, fechaSolicitud FROM solicituddistribuidor s"
                    + " INNER JOIN productos p ON (s.productosId = p.idProductos)"
                    + " INNER JOIN usuarios u ON (s.distribuidorId = u.idUsuarios)"
                    + " WHERE  idSolicitudDistribuidor = ?;";
            pstmt = cnn.prepareStatement(querrySolicitudesDistribuidor);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO(rs.getInt("idUsuarios"), rs.getString("Distribuidor"));
                    ProductoDTO pro = new ProductoDTO(rs.getInt("idProductos"), rs.getString("nombreProducto"));
                    solicitud = new SolicitudDistribuidorDTO(user, pro);
                    solicitud.setIdSolicitud(rs.getInt("idSolicitudDistribuidor"));
                    solicitud.setCantidadSolicitada(rs.getInt("cantidadSolicitada"));
                    solicitud.setFechaSolicitud(rs.getString("fechaSolicitud"));
                }
            }

        } catch (SQLException sqle) {
            salida = "Mira lo que ocurrio! " + sqle.getMessage() + " y " + sqle.getSQLState();
        }
        return solicitud;
    }

    public String eliminarSolicitud(int id) {
        try {
            pstmt = cnn.prepareStatement("DELETE FROM solicituddistribuidor WHERE idSolicitudDistribuidor = ?;");
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

    public String modificarSolicitudDistribuidor(SolicitudDistribuidorDTO solicitud) {
        try {
            String querryUpdateSolicitud = "UPDATE `solicituddistribuidor` SET fechaEntregaInterna = ? "
                    + " WHERE `idSolicitudDistribuidor` = ?;";
            pstmt = cnn.prepareStatement(querryUpdateSolicitud);
            pstmt.setString(1, solicitud.getFechaEntregaInterna());
            pstmt.setInt(2, solicitud.getIdSolicitud());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "La base de datos ha tenido cambios sactisfactorios";
            } else {
                salida = "No ocurrio nada!";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido lo siguiente... " + sqle.getMessage();
        }
        return salida;
    }
}
