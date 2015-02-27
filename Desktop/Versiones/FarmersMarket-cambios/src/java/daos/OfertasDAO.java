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

    /**
     * Insertar oferta nueva version
     *
     * @param nuevaOferta
     * @return
     */
    public String insertarOferta(OfertasDTO nuevaOferta) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO ofertas VALUES (null, ?,?,?,current_date(), date_add(curdate(), interval 15 day),1);");
            pstmt.setInt(1, nuevaOferta.getProductosAsociadosUsuariosId());
            pstmt.setInt(3, nuevaOferta.getCantidad());
            pstmt.setFloat(2, nuevaOferta.getPrecio());
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
            pstmt = cnn.prepareStatement("UPDATE ofertas SET cantidad = ? WHERE idOfertas = ?;");
            pstmt.setInt(1, modOferta.getCantidad());
            pstmt.setInt(2, modOferta.getIdOfertas());
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
            String queryAllOfertas = " select idOfertas,idCategorias, nombreCategoria, concat(u.nombres,' ',u.apellidos) as NombreProductor, idProductos "
                    + "  as idPro, nombreProducto, unidad, cantidad, precio "
                    + "  from ofertas o "
                    + "  inner join productosasociadosusuarios pro on o.productosAsociadosUsuariosId = pro.idProductosAsociadosUsuarios "
                    + "  inner join productos p on pro.productosId = p.idProductos "
                    + "  inner join usuarios u on pro.usuariosId = u.idUsuarios "
                    + "  inner join categorias c on p.categoriasId = c.idCategorias "
                    + "  order by idOfertas asc";
            pstmt = cnn.prepareStatement(queryAllOfertas);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoriaDTO cdto = new CategoriaDTO(rs.getInt("idCategorias"), rs.getString("nombreCategoria"));
                UsuariosDTO udto = new UsuariosDTO(rs.getString("NombreProductor"));
                ProductoDTO pdto = new ProductoDTO(rs.getInt("idPro"), rs.getString("nombreProducto"), rs.getString("unidad"), cdto);
                OfertasDTO ofdto = new OfertasDTO(pdto, udto);
                ofdto.setIdOfertas(rs.getInt("idOfertas"));
                ofdto.setCantidad(rs.getInt("cantidad"));
                ofdto.setPrecio(rs.getFloat("precio"));
                ofer.add(ofdto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OfertasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ofer;
    }

    public OfertasDTO consultByOffer(int id) throws MyException {
        OfertasDTO onlyoffer = null;
        String msj = " ";
        try {
            String querryByIdOffer = " select idCategorias, nombreCategoria, idOfertas,idProductosAsociadosUsuarios, "
                    + " idUsuarios, concat(u.nombres,' ',u.apellidos) as Productor, "
                    + " idProductos, nombreProducto, cantidad, precio "
                    + " from ofertas as o "
                    + " inner join productosasociadosusuarios as apor on "
                    + " o.productosAsociadosUsuariosId = apor.idProductosAsociadosUsuarios "
                    + " inner join usuarios as u on apor.usuariosId = u.idUsuarios "
                    + " inner join productos as p on apor.productosId = p.idProductos "
                    + " inner join categorias as c on p.categoriasId = c.idCategorias "
                    + " where idOfertas = ?";
            pstmt = cnn.prepareStatement(querryByIdOffer);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO udto = new UsuariosDTO();
                    udto.setIdUsuarios(rs.getInt("idUsuarios"));
                    udto.setNombres(rs.getString("Productor"));
                    CategoriaDTO cdto = new CategoriaDTO();
                    cdto.setIdCategoria(rs.getInt("idCategorias"));
                    cdto.setNombre(rs.getString("nombreCategoria"));
                    ProductoDTO pdto = new ProductoDTO(cdto);
                    pdto.setIdProductos(rs.getInt("idProductos"));
                    pdto.setNombre(rs.getString("nombreProducto"));
                    ProductosAsociadosUsuariosDTO proAso = new ProductosAsociadosUsuariosDTO(udto, pdto);
                    proAso.setIdProductosAsociadosUsuarios(rs.getInt("idProductosAsociadosUsuarios"));
                    onlyoffer = new OfertasDTO(proAso);
                    onlyoffer.setIdOfertas(rs.getInt("idOfertas"));
                    onlyoffer.setCantidad(rs.getInt("cantidad"));
                    onlyoffer.setPrecio(rs.getInt("precio"));
                }
            } else {
                throw new MyException("No se encuentran registros por este id.");
            }
        } catch (SQLException sqle) {
            throw new MyException("Ups! Mira lo ocurrido... " + sqle.getMessage());
        }
        return onlyoffer;
    }
}
