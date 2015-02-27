/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.ProductosAsociadosUsuariosDTO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import utilidades.Conectar;

/**
 *
 * @author Mona
 */
public class Consultas {

    ResultSet rs = null;
    PreparedStatement pstmt = null;
    Connection cnn = null;

    public Consultas() {
        cnn = Conectar.getInstance();
    }
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String salida = "";
    public LinkedList<ProductosAsociadosUsuariosDTO> consultarFiltro(String filtro) {
        LinkedList<ProductosAsociadosUsuariosDTO> listaFiltro = new LinkedList();
        try {
            String querryFiltro = " select idProductosAsociadosUsuarios, usuariosId, "
                    + " concat(nombres,' ',apellidos) as Productor, productosId,"
                    + " nombreProducto, FechaFin "
                    + " from `usuarios` u inner join "
                    + " `productosasociadosusuarios` s on u.`idUsuarios` = s.`usuariosId` "
                    + " inner join `productos` p on s.`productosId` = p.`idProductos` "
                    + " inner join `ofertas` o on s.`idProductosAsociadosUsuarios` = o.`productosAsociadosUsuariosId` "+filtro ;
            pstmt = cnn.prepareStatement(querryFiltro);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    
                    UsuariosDTO user = new UsuariosDTO(rs.getInt("usuariosId"), rs.getString("Productor"));
                    ProductoDTO pro = new ProductoDTO(rs.getInt("productosId"), rs.getString("nombreProducto"));
                    ProductosAsociadosUsuariosDTO proAso = new ProductosAsociadosUsuariosDTO(user, pro);
                    proAso.setIdProductosAsociadosUsuarios(rs.getInt("idProductosAsociadosUsuarios"));
                    listaFiltro.add(proAso);
                }
            }
        } catch (SQLException sqle) {
            salida = "Mira lo que ocurrio! " + sqle.getMessage() + " y " + sqle.getSQLState();
        }
        return listaFiltro;
    }
}
