/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.ProductosAsociadosUsuariosDTO;
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
public class ProductosAsociadosUsuariosDAO {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    ProductosAsociadosUsuariosDTO pasodto = new ProductosAsociadosUsuariosDTO();
    ArrayList<ProductosAsociadosUsuariosDTO> asociados = new ArrayList();

    public ProductosAsociadosUsuariosDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarProducto(ProductosAsociadosUsuariosDTO nuevoAsociado) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO productosAsociadosUsuarios VALUES (null, ?,?);");
            pstmt.setInt(1, nuevoAsociado.getUsuariosId());
            pstmt.setInt(2, nuevoAsociado.getProductosId());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "El registro del producto " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }

    public String modificarProducto(ProductosAsociadosUsuariosDTO modAsociado) {
        try {
            pstmt = cnn.prepareStatement("UPDATE productosAsociadosUsuarios SET usuariosId = ?, productosId = ? WHERE idProductosAsociadosUsuarios = ?;");
            pstmt.setInt(1, modAsociado.getUsuariosId());
            pstmt.setInt(2, modAsociado.getProductosId());
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

    public ArrayList<ProductosAsociadosUsuariosDTO> listarProductoresAsociados() {
        try {
            pstmt = cnn.prepareStatement("SELECT idProductosAsociadosUsuarios as id, usuariosId as idUsu, productosId as idPro FROM productosAsociadosUsuarios;");
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    ProductosAsociadosUsuariosDTO psodto = new ProductosAsociadosUsuariosDTO();
                    psodto.setIdProductosAsociadosUsuarios(rs.getInt("id"));
                    psodto.setUsuariosId(rs.getInt("idUsu"));
                    psodto.setProductosId(rs.getInt("idPro"));
                    asociados.add(psodto);
                }
            } else {
                System.out.println("No se encuetran registros de productores asociados.. ");
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido esta excepción.. " + sqle.getMessage());
        }
        return asociados;
    }

    public String eliminarAsociado(int id) {
        try {
            pstmt = cnn.prepareStatement("DELETE FROM productosAsociadosUsuarios WHERE idProductosAsociadosUsuarios = ?;");
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

    public ProductosAsociadosUsuariosDTO consultarById(int id) {
        try {
            pstmt = cnn.prepareStatement("SELECT idProductosAsociadosUsuarios as id, usuariosId as idUsu, productosId as idPro FROM productosAsociadosUsuarios WHERE idProductosAsociadosUsuarios = ?;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    pasodto.setIdProductosAsociadosUsuarios(rs.getInt("id"));
                    pasodto.setUsuariosId(rs.getInt("idUsu"));
                    pasodto.setProductosId(rs.getInt("idPro"));
                }
            } else {
                System.out.println("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            System.out.println("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return pasodto;
    }
}
