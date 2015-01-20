/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utilidades;

import daos.MyException;
import daos.OfertasDAO;
import daos.ProductoDAO;
import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.ProductoDTO;
import dtos.ProductosAsociadosUsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author krito
 */
public class VerificarConexion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws MyException {
        Connection cnn = Conectar.getInstance();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

//        try {
//
//            pstmt = cnn.prepareStatement("SELECT idProductos as id, nombre, unidad, categoriasId FROM productos;");
//            rs = pstmt.executeQuery();
//
//            System.out.println("ID   " + "Nombre   " + "Unidad  ");
//
//            if (rs != null) {
//                while (rs.next()) {
//                    System.out.println(rs.getString("nombre") + "  " + rs.getString("unidad"));
//                }
//            } else {
//                System.out.println("No se encuetran registros de productos.. ");
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error de MYSQL" + ex);
//
//        } catch (Exception e) {
//            System.out.println("Error en la ejecución e:"
//                    + " " + e.getMessage());
//        } finally {
//
//        }
//        
////        OfertasDAO ofdao = new OfertasDAO();
////        ofdao.listarProductosAsociado(3);
////        
////        ArrayList<ProductoDTO> listaSalida = new ArrayList<>();
////        listaSalida = (ArrayList<ProductoDTO>) ofdao.listarProductosAsociado(1);
////        System.out.println("Id \t Nombre ");
////        for (ProductoDTO pro : listaSalida) {
////            System.out.println(pro.getIdProductos() + " \t" + pro.getNombre());
////        }
//        
////        OfertasDAO ofdao = new OfertasDAO();
////        ofdao.consultarOfertas();
////        
////        ArrayList<OfertasDTO> listaSalida = new ArrayList<>();
////        listaSalida = (ArrayList<OfertasDTO>) ofdao.consultarOfertas();
////        System.out.println("Id \t Nombre ");
////        for (OfertasDTO pro : listaSalida) {
////            System.out.println(pro.getIdOfertas() + " \t" + pro.getNombre());
////        }
//        
////        OfertasDAO ofdao1 = new OfertasDAO();
////        ofdao1.listarOfertas();
////        
////        ArrayList<OfertasDTO> listaSalida1 = new ArrayList<>();
////        listaSalida1 = (ArrayList<OfertasDTO>) ofdao1.listarOfertas();
////        System.out.println("Id \t Nombre ");
////        for (OfertasDTO pro : listaSalida1) {
////            System.out.println(pro.getIdOfertas() + " \t" + pro.getNombre());
////        }
//        Scanner in = new Scanner(System.in);
//        ProductoDTO pdto = new ProductoDTO();
//        ProductoDAO pdao = new ProductoDAO();
////        pdto.setNombre("Yuca");
////        pdto.setUnidad("mm");
////        pdto.setCategoriasId(0);
////        System.out.println(pdao.modificarProducto(pdto));
//        System.out.println("Id      Name");
//        System.out.println(pdao.consultarById(7));
//        
        
//        ProductoDAO pdao = new ProductoDAO();
//        LinkedList<ProductoDTO> pro = new LinkedList<>();
//        pro = (LinkedList<ProductoDTO>) pdao.listarAllProductos();
//        for (ProductoDTO p : pro){
//            System.out.println("Prducto: "+p.getNombre()+" tiene la categoría "+p.getCategoriaId().getNombre());
//        }
//        
        ProductoDTO udto = new ProductoDTO();
        ProductoDAO pdao = new ProductoDAO();
        System.out.println(pdao.consultarByIdProduct(2));
//        CategoriaDTO cdto = new CategoriaDTO();
//        cdto.setIdCategoria(1);
//        udto.setIdProductos(987);
//        udto.setNombre("Yuva llanera");
//        udto.setUnidad("kg");
//        udto.setCategoriaId(cdto);
//        System.out.println(pdao.insertarProducto(udto));
//        OfertasDTO odto = new OfertasDTO();
//        OfertasDAO pdao = new  OfertasDAO();
//        //ProductosAsociadosUsuariosDTO paso = new ProductosAsociadosUsuariosDTO();
//        //paso.setIdProductosAsociadosUsuarios(1);
//        odto.setNombre("Super papa!!");
//        odto.setCantidad(23423);
//        odto.setPrecio(2343);
//        odto.setProductosAsociadosUsuariosId(1);
//        System.out.println(pdao.insertarOferta(odto));
        
        
    }
    
}
