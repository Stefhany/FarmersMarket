/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import daos.AportesProductoresDAO;
import daos.Consultas;
import daos.DespachosPedidosDAO;
import daos.MyException;
import daos.OfertasDAO;
import daos.PedidoSobreOfertaDAO;
import daos.PedidosDAO;
import daos.ProductoDAO;
import daos.ProductosAsociadosUsuariosDAO;
import daos.ReportePruebaDAO;
import daos.SolicitudDistribuidorDAO;
import daos.UsuariosDAO;
import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.PedidoDTO;
import dtos.ProductoDTO;
import dtos.ProductosAsociadosUsuariosDTO;
import dtos.ReportePruebaDTO;
import dtos.SolicitudDistribuidorDTO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
//        ReportePruebaDAO pdao = new ReportePruebaDAO();
//        ArrayList<ReportePruebaDTO> pro = new ArrayList();
//        pro =  pdao.mostrarPrueba();
//        for (ReportePruebaDTO p : pro){
//            System.out.println("Nombre: "+p.getNombres()+" apellido "+p.getApellidos());
//        }
////        
//        ProductoDTO udto = new ProductoDTO();
//        ProductoDAO pdao = new ProductoDAO();
//        System.out.println(pdao.consultarByIdProduct(2));
//        CategoriaDTO cdto = new CategoriaDTO();
//        cdto.setIdCategoria(1);
//        udto.setIdProductos(987);
//        udto.setNombre("Yuva llanera");
//        udto.setUnidad("kg");
//        udto.setCategoriaId(cdto);
//        System.out.println(pdao.insertarProducto(udto));
//        OfertasDTO odto = new OfertasDTO();
//        //OfertasDAO pdao = new  OfertasDAO();
//        ProductosAsociadosUsuariosDTO paso = new ProductosAsociadosUsuariosDTO();
//        paso.setIdProductosAsociadosUsuarios(1);
//        odto.setNombre("Super papa!!");
//        odto.setCantidad(23423);
//        odto.setPrecio(2343);
//        odto.setProductosAsociadosUsuariosId(1);
//        System.out.println(pdao.insertarOferta(odto));
//        PedidosDAO edao = new PedidosDAO();
//        System.out.println(edao.insertarPedido(13,6,12,13,500,1));
//        
//        AportesProductoresDAO edao = new AportesProductoresDAO();
//        System.out.println(edao.aplicarSolicitudAsociacion("2015-02-13", 5, 2, 3));
//        OfertasDAO odao = new OfertasDAO();
//        System.out.println(odao.consultByOffer(2));
//        
        //System.out.println(7868);        
//        PedidoSobreOfertaDAO ped = new PedidoSobreOfertaDAO();
//        System.out.println(ped.insertarPedidoSobreOferta(500, 2, "2015/03/05"));
//        SolicitudDistribuidorDTO sdto = new SolicitudDistribuidorDTO();
//        SolicitudDistribuidorDAO sdao = new SolicitudDistribuidorDAO();
//        sdto.setCantidadSolicitada(400);
//        sdto.setFechaSolicitud("2015/03/10");
//        //sdto.setFechaEntregaInterna("2015/03/12");
//        sdto.setProductoId(8);
//        sdto.setDistribuidorId(6);
//        System.out.println(sdao.insertarSolicitudDistribuidor(sdto));
//        SolicitudDistribuidorDAO sol = new SolicitudDistribuidorDAO();
//        LinkedList<SolicitudDistribuidorDTO> listaSalida = new LinkedList();
//        listaSalida = (LinkedList<SolicitudDistribuidorDTO>) sol.listarSolicitudesDistribuidor();
//        System.out.println("Id \t Nombre ");
//        for (SolicitudDistribuidorDTO pro : listaSalida) {
//            System.out.println(pro.getCantidadSolicitada() + " \t" + pro.getFechaSolicitud()+ pro.getUser().getNombres());
//        }
//        SolicitudDistribuidorDAO odao = new SolicitudDistribuidorDAO();
//        System.out.println(odao.byIdRequest(2));
//        AportesProductoresDAO a = new AportesProductoresDAO();
//        System.out.println(a.byIdForAssociation(2));
//        
//        DespachosPedidosDAO sol = new DespachosPedidosDAO();
//        LinkedList<SolicitudDistribuidorDTO> listaSalida = new LinkedList();
//        listaSalida = (LinkedList<SolicitudDistribuidorDTO>) sol.mostrarDespachosPendientes();
//        
//        System.out.println("Id \t Nombre ");
//        for (SolicitudDistribuidorDTO pro : listaSalida) {
//            System.out.println("Id producto: "+pro.getProduct().getIdProductos()+" Direccion: "+pro.getUser().getDireccion()
//                    +" y se debe entregar el: "+pro.getFechaEntregaInterna());
//        }
        Consultas con = new Consultas();
        LinkedList<ProductosAsociadosUsuariosDTO> filtrar = new LinkedList();
        filtrar = (LinkedList<ProductosAsociadosUsuariosDTO>) con.consultarFiltro("s");
        for (ProductosAsociadosUsuariosDTO pro : filtrar) {
            System.out.println("gcvhjvh"+pro.getUsuario().getCiudad());
        }
    }

}
