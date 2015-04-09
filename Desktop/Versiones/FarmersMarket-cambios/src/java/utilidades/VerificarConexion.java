/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import Conexion.Conection;
import daos.PedidoSobreOfertaDAO;
import dtos.CategoriaDTO;
import dtos.OfertasDTO;
import dtos.SolicitudDistribuidorDTO;
import dtos.UsuariosDTO;
import facade.FacadeCategorias;
import facade.FacadeDespachosPedidos;
import facade.FacadeOfertas;
import facade.FacadeUsuarios;
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
    public static void main(String[] args) throws MyException, SQLException {
        FacadeDespachosPedidos f = new FacadeDespachosPedidos();
        
        
//        Llamando al metodo de consultar todos
//        LinkedList<SolicitudDistribuidorDTO> listaSalida = new LinkedList();
//        listaSalida = (LinkedList<SolicitudDistribuidorDTO>) f.mostrarDespachosPendientes();
//        System.out.println("Cantidad");
//        for (SolicitudDistribuidorDTO user : listaSalida) {
//            System.out.println("-------------------");
//            System.out.println(user.getCantidadSolicitada());
//        }
//        
////        UsuariosDTO userDto = new UsuariosDTO();
////        userDto.setIdUsuarios(15);
//        
//        OfertasDTO offerdto = new OfertasDTO();
//        FacadeOfertas facadeOffer = new FacadeOfertas();
//                System.out.println(facadeOffer.consultByOffer(2));
                
//        UsuariosDTO userDto = new UsuariosDTO();
//        userDto.setNombres("vfrv");
//        userDto.setApellidos("vfb");
//        userDto.setCedula(18765456);
//        userDto.setTelefono(8755678);
//        userDto.setDireccion("Calle x con Av y");
//        userDto.setCorreo("miguelangel72@hotmail.com");
//        userDto.setClave("123");
//        userDto.setNotificacion(true);
//        userDto.setCiudad("vrfb");
//        userDto.setFechaNacimiento("11/10/1989");
//        
//        
//        FacadeUsuarios facadeUser = new FacadeUsuarios();
//        String msgSalida = facadeUser.ingresarRegistro(userDto);
//        System.out.println(msgSalida);
                
                
                PedidoSobreOfertaDAO p = new PedidoSobreOfertaDAO();
                p.calcularCantidad(3, 100);
    }
}
