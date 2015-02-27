/*

 * To change this license header, choose License Headers in Project Properties.

 * To change this template file, choose Tools | Templates

 * and open the template in the editor.

 */
package daos;

import dtos.CategoriaDTO;
import dtos.ProductoDTO;
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
 *
 *
 * @author krito
 *
 */
public class ProductoDAO {

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;

    public ProductoDAO() {

        cnn = Conectar.getInstance();

    }

    public String insertarProducto(ProductoDTO nuevoProducto) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO productos VALUES (null, ?,?,?);");
            pstmt.setString(1, nuevoProducto.getNombre());
            pstmt.setString(2, nuevoProducto.getUnidad());
            pstmt.setInt(3, nuevoProducto.getCategoriaId().getIdCategoria());
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

    public String modificarProducto(ProductoDTO modProducto) {
        try {
            pstmt = cnn.prepareStatement("UPDATE productos SET nombre = ?, unidad = ?, categoriasId =  ? WHERE  idProductos =  ?;");
            pstmt.setString(1, modProducto.getNombre());
            pstmt.setString(2, modProducto.getUnidad());
            pstmt.setFloat(3, modProducto.getCategoriaId().getIdCategoria());
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

    public String eliminarProducto(int id) {
        try {
            pstmt = cnn.prepareStatement("DELETE FROM productos WHERE idProductos = ?;");
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

    public List<ProductoDTO> listarAllProductos() throws MyException {
        LinkedList<ProductoDTO> products = new LinkedList();
        try {
            String queryAllPro = " select idproductos, nombreProducto, unidad, idcategorias, nombreCategoria "
                    + " from productos p inner join categorias c on p.categoriasid=c.idcategorias"
                    + " order by idProductos asc";
            pstmt = cnn.prepareStatement(queryAllPro);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CategoriaDTO cdto = new CategoriaDTO(rs.getInt("idcategorias"), rs.getString("nombreCategoria"));
                ProductoDTO prodto = new ProductoDTO(rs.getInt("idproductos"), rs.getString("nombreProducto"), rs.getString("unidad"), cdto);
                products.add(prodto);
            }
        } catch (SQLException sqle) {
            throw new MyException("Ocurrio este error al listar los elementos: " + sqle.getSQLState() + " - " + sqle.getMessage());
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public ProductoDTO consultarByIdProduct(int id) throws MyException{
        ProductoDTO onlyProduct = null;
        try {
            String querryByIdProduct = "select idProductos as id,nombreProducto, unidad, "
                    + " categoriasId, nombreCategoria "
                    + " from productos p "
                    + " inner join categorias c on p.categoriasId = c.idCategorias "
                    + " WHERE idProductos = ?;";
            pstmt = cnn.prepareStatement(querryByIdProduct);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    CategoriaDTO cto = new CategoriaDTO();
                    cto.setIdCategoria(rs.getInt("categoriasId"));
                    cto.setNombre(rs.getString("nombreCategoria"));
                    onlyProduct = new ProductoDTO(cto);
                    onlyProduct.setIdProductos(rs.getInt("id"));
                    onlyProduct.setNombre(rs.getString("nombreProducto"));
                    onlyProduct.setUnidad(rs.getString("unidad"));
                }
            } else {
                throw new MyException("No hay registros, por esa busqueda... ");
            }
        } catch (SQLException sqle) {
            throw  new MyException("Ups! Mira lo ocurrido... " + sqle.getMessage()+" y "+sqle.getSQLState());
        }
        return onlyProduct;
    }
}
