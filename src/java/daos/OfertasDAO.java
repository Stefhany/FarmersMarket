/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.UsuariosDTO;
import java.lang.Class;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilidades.Conectar;

/**
 *
 * @author krito
 */
public class OfertasDAO {

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    OfertasDTO ofdto = new OfertasDTO();

    public OfertasDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarOferta(OfertasDTO nuevaOferta) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO ofertas VALUES (null, ?,?,?,?);");
            pstmt.setString(1, nuevaOferta.getNombre());
            pstmt.setInt(2, nuevaOferta.getCantidad());
            pstmt.setFloat(3, nuevaOferta.getPrecio());
            pstmt.setInt(4, nuevaOferta.getUser().getIdUsuarios());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "El registro de la oferta " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }


    public String modificarOferta(OfertasDTO modOferta) {
        try {
            pstmt = cnn.prepareStatement("UPDATE ofertas SET nombre = ?, cantidad = ?, precio = ?, productosAsociadosUsuariosId = ? WHERE idOfertas = ?;");
            pstmt.setString(1, modOferta.getNombre());
            pstmt.setInt(2, modOferta.getCantidad());
            pstmt.setFloat(3, modOferta.getPrecio());
            pstmt.setInt(4, modOferta.getProductosAsociadosUsuariosId());
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

    public ArrayList<OfertasDTO> listarOfertas() {
        ArrayList<OfertasDTO> ofertas = new ArrayList();
        try {
            pstmt = cnn.prepareStatement("SELECT idOfertas as id, nombre, cantidad, precio, productosAsociadosUsuariosId as idAso FROM ofertas;");
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    OfertasDTO ofedto = new OfertasDTO();
                    ofedto.setIdOfertas(rs.getInt("id"));
                    ofedto.setNombre(rs.getString("nombre"));
                    ofedto.setCantidad(rs.getInt("cantidad"));
                    ofedto.setPrecio(rs.getFloat("precio"));
                    ofedto.setProductosAsociadosUsuariosId(rs.getInt("idAso"));
                    ofertas.add(ofedto);
                }
            } else {
                System.out.println("No se encuetran registros de ofertas");
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido esta excepción.. " + sqle.getMessage());
        }
        return ofertas;
    }

    public String eliminarOferta(int id) {
        try {
            pstmt = cnn.prepareStatement("DELETE FROM ofertas WHERE idOfertas = ?;");
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

    public OfertasDTO consultarById(int id) {
        try {
            pstmt = cnn.prepareStatement("SELECT idOfertas as id, nombre, cantidad, precio, productosAsociadosUsuariosId as idAso FROM ofertas WHERE idOfertas = ?;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ofdto.setIdOfertas(rs.getInt("id"));
                    ofdto.setNombre(rs.getString("nombre"));
                    ofdto.setCantidad(rs.getInt("cantidad"));
                    ofdto.setPrecio(rs.getFloat("precio"));
                    ofdto.setProductosAsociadosUsuariosId(rs.getInt("idAso"));
                }
            } else {
                System.out.println("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            System.out.println("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return ofdto;

    }

//    public List<ProductoDTO> listarProductosAsociado(int id) {
//        ArrayList<ProductoDTO> productosAso = new ArrayList<ProductoDTO>();
//        try {
//
//            pstmt = cnn.prepareStatement("SELECT u.idUsuarios as 'Id_productor', paso.idProductosAsociadosUsuarios as 'Id_productoAsociado', p.nombre as 'Nombre' "
//                    + " FROM usuarios u "
//                    + " INNER JOIN productosasociadosusuarios paso on u.idUsuarios = paso.usuariosId "
//                    + " INNER JOIN productos p on paso.productosId = p.idProductos "
//                    + " WHERE u.idUsuarios = ?;");
//            pstmt.setInt(1, id);
//            rs = pstmt.executeQuery();
//            if (rs != null) {
//                while (rs.next()) {
//                    ProductoDTO pdto = new ProductoDTO();
//                    pdto.setIdProductos(rs.getInt("Id_productoAsociado"));
//                    pdto.setNombre(rs.getString("Nombre"));
//                    productosAso.add(pdto);
//                }
//            }
//
//        } catch (SQLException sqle) {
//            System.out.println("Ha ocurrido esto" + sqle.getSQLState() + " - " + sqle.getMessage());
//        }
//        return productosAso;
//    }
    public List<ProductoDTO> listarProductosAsociado(int id) {
        ArrayList<ProductoDTO> productosAso = new ArrayList<ProductoDTO>();
        try {
            String queryAllProductsAso = " SELECT idUsuarios as 'Id_productor', paso.idProductosAsociadosUsuarios as 'Id_productoAsociado', p.nombreProducto as 'Nombre' "
                    + " FROM usuarios u "
                    + " INNER JOIN productosasociadosusuarios paso on u.idUsuarios = paso.usuariosId "
                    + " INNER JOIN productos p on paso.productosId = p.idProductos "
                    + " WHERE u.idUsuarios = ?;";
            pstmt = cnn.prepareStatement(queryAllProductsAso);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ProductoDTO pdto = new ProductoDTO();
                    pdto.setIdProductos(rs.getInt("Id_productoAsociado"));
                    pdto.setNombre(rs.getString("Nombre"));
                    productosAso.add(pdto);
                }
            }

        } catch (SQLException sqle) {
            System.out.println("Ha ocurrido esto" + sqle.getSQLState() + " - " + sqle.getMessage());
        }
        return productosAso;
    }

    public List<OfertasDTO> consultarOfertas() {
        LinkedList<OfertasDTO> ofer = new LinkedList();

        try {
            String queryAllOfertas = " select idCategorias, nombreCategoria, concat(u.nombres,' ',u.apellidos) as NombreProductor, idProductos "
                    + "  as idPro, nombreProducto, unidad, cantidad, precio "
                    + "  from ofertas o "
                    + "  inner join productosasociadosusuarios pro on o.productosAsociadosUsuariosId = pro.idProductosAsociadosUsuarios "
                    + "  inner join productos p on pro.productosId = p.idProductos "
                    + "  inner join usuarios u on pro.usuariosId = u.idUsuarios "
                    + "  inner join categorias c on p.categoriasId = c.idCategorias ";
            pstmt = cnn.prepareStatement(queryAllOfertas);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoriaDTO cdto = new CategoriaDTO(rs.getInt("idCategorias"), rs.getString("nombreCategoria"));
                UsuariosDTO udto = new UsuariosDTO(rs.getString("NombreProductor"));
                ProductoDTO pdto = new ProductoDTO(rs.getInt("idPro"), rs.getString("nombreProducto"), rs.getString("unidad"), cdto);
                OfertasDTO ofdto = new OfertasDTO(pdto, udto);
                ofdto.setCantidad(rs.getInt("cantidad"));
                ofdto.setPrecio(rs.getFloat("precio"));
                ofer.add(ofdto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OfertasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ofer;
    }

    public OfertasDTO consultarUnaOferta(int id) {
        OfertasDTO onlyoffer = new OfertasDTO();
        try {
            String querryById = " select  idOfertas,idCategorias, nombreCategoria, concat(u.nombres,' ',u.apellidos) as NombreProductor, idProductos "
                    + " as idPro, nombreProducto, unidad, cantidad, precio "
                    + " from ofertas o "
                    + " inner join productosasociadosusuarios pro on o.productosAsociadosUsuariosId = pro.idProductosAsociadosUsuarios "
                    + " inner join productos p on pro.productosId = p.idProductos "
                    + " inner join usuarios u on pro.usuariosId = u.idUsuarios "
                    + " inner join categorias c on p.categoriasId = c.idCategorias "
                    + " where idOfertas = 4;";
            pstmt = cnn.prepareStatement(querryById);
            pstmt.setInt(1, id);
            pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    //onlyoffer.setUser(rs.getObject(Class < UsuariosDTO >, "NombreProductor"));
                }
            } else {
                System.out.println("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            System.out.println("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return onlyoffer;
    }
}
