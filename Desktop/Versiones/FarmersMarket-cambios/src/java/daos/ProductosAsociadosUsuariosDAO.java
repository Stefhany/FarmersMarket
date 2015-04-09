/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.ProductosAsociadosUsuariosDTO;
import dtos.UsuariosDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Conexion.Conection;
import utilidades.MyException;

/**
 *
 * @author krito
 */
public class ProductosAsociadosUsuariosDAO {

    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Connection cnn = null;
    private CallableStatement cllstmt = null;

    public ArrayList<ProductosAsociadosUsuariosDTO> listarProductosByUser(int idUser, Connection cnn) {
        this.cnn = cnn;
        ArrayList<ProductosAsociadosUsuariosDTO> asociados = new ArrayList();
        try {
            pstmt = cnn.prepareStatement(" SELECT idProductosAsociadosUsuarios as id, usuariosId as idUsu, productosId as idPro, u.*, p.*, c.* "
                    + " FROM productosAsociadosUsuarios pa inner join usuarios u ON pa.usuariosid= u.idusuarios "
                    + " INNER JOIN productos p ON pa.productosId = p.idproductos "
                    + " INNER JOIN categorias c ON p.categoriasId = c.idCategorias "
                    + " WHERE usuariosId = ? "
                    + " order by p.idproductos;");
            pstmt.setInt(1, idUser);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO nUser = new UsuariosDTO();
                    nUser.setIdUsuarios(rs.getInt("u.idUsuarios"));
                    nUser.setCedula(rs.getInt("u.cedula"));
                    nUser.setNombres(rs.getString("u.nombres"));
                    CategoriaDTO c = new CategoriaDTO(rs.getInt("c.idCategorias"), rs.getString("nombreCategoria"));
                    ProductoDTO nProduct = new ProductoDTO(c);
                    nProduct.setIdProductos(rs.getInt("p.idproductos"));
                    nProduct.setNombre(rs.getString("p.nombreproducto"));
                    ProductosAsociadosUsuariosDTO psodto = new ProductosAsociadosUsuariosDTO(nUser, nProduct);
                    psodto.setIdProductosAsociadosUsuarios(rs.getInt("id"));
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

    public ArrayList<ProductosAsociadosUsuariosDTO> consultarMisProductos(int idUser, Connection cnn) {
        this.cnn = cnn;
        ArrayList<ProductosAsociadosUsuariosDTO> misProductos = new ArrayList();
        try {
            pstmt = cnn.prepareStatement("SELECT idProductosAsociadosUsuarios as id, usuariosId as idUsu, "
                    + " productosId as idPro, u.*, p.*, c.* "
                    + " FROM productosAsociadosUsuarios pa inner join usuarios u ON pa.usuariosid= u.idusuarios "
                    + " INNER JOIN productos p ON pa.productosId = p.idproductos "
                    + " INNER JOIN categorias c on c.idCategorias = p.categoriasId "
                    + " WHERE usuariosId = ?;");
            pstmt.setInt(1, idUser);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO nUser = new UsuariosDTO();
                    nUser.setCedula(rs.getInt("u.cedula"));
                    nUser.setNombres(rs.getString("u.nombres"));
                    CategoriaDTO c = new CategoriaDTO();
                    c.setIdCategoria(rs.getInt("c.idCategorias"));
                    c.setNombre(rs.getString("c.nombreCategoria"));
                    ProductoDTO nProduct = new ProductoDTO(c);
                    nProduct.setIdProductos(rs.getInt("p.idproductos"));
                    nProduct.setNombre(rs.getString("p.nombreproducto"));
                    ProductosAsociadosUsuariosDTO psodto = new ProductosAsociadosUsuariosDTO(nUser, nProduct);
                    psodto.setIdProductosAsociadosUsuarios(rs.getInt("id"));
                    misProductos.add(psodto);
                }
            } else {
                System.out.println("No se encuetran registros de productores asociados.. ");
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido esta excepción.. " + sqle.getMessage());
        }
        return misProductos;
    }
    
    public String eliminarProAso(int id, Connection cnn) {
        this.cnn = cnn;
        int rtdo = 0;
        String msgSalida = "";
        try {
            pstmt = cnn.prepareStatement("DELETE FROM productosasociadosusuarios WHERE idProductosAsociadosUsuarios = ?;");
            pstmt.setInt(1, id);
            rtdo = pstmt.executeUpdate();

            if (rtdo != 0) {
                msgSalida = "Registro " + rtdo + " eliminado. Exitosamente";
            }else{
                msgSalida = "No se pudo eliminar. ";
            }
        } catch (SQLException sqle) {
            msgSalida = "Ocurrio esta excepción " + sqle.getMessage();
        }
        return msgSalida;
    }
    
    public String insertarProductoAsociado(String nomProducto, int categoria,int idUsuario, Connection cnn) {
        this.cnn = cnn;
        int sal = 0;
        String msgSalida = "";
        try {
            cllstmt = cnn.prepareCall("{call ps_registrarProductoV5 (?,?,?,?)}");
            cllstmt.setString(1, nomProducto);
            cllstmt.setInt(2, categoria);
            cllstmt.setInt(3, idUsuario);
            cllstmt.registerOutParameter(4, java.sql.Types.INTEGER);
            cllstmt.execute();
            sal = cllstmt.getInt(4);

            if (sal == 1) {
                msgSalida = "Registro exitoso";
            }  else {
                msgSalida = "No se pudo registrar el producto!!!";
            }
        } catch (SQLException sqle) {
            msgSalida = "Pilas! Ocurrio la siguiente excepción " + sqle.getMessage();
        }
        return msgSalida;
    }
}
