/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Conexion.Conection;
import daos.PedidoSobreOfertaDAO;
import dtos.PedidoSobreOfertaDTO;
import java.sql.Connection;
import utilidades.Conectar;

/**
 *
 * @author Mona
 */
public class FacadePedidoSobreOferta {
    private Connection cnn = null;
    private PedidoSobreOfertaDTO pedidoDto = null;
    private PedidoSobreOfertaDAO pedidoDao = null;
    
    public FacadePedidoSobreOferta(){
//        cnn = Conection.getConnection2();
        pedidoDto = new PedidoSobreOfertaDTO();
        pedidoDao = new PedidoSobreOfertaDAO();
        cnn = Conectar.getInstance();
    }
    
    public String registrarPedidoSobreOferta(int cantidadPedida, int idOferta, String fechaSolicitud){
        return pedidoDao.insertarPedidoSobreOferta(cantidadPedida, idOferta, fechaSolicitud, cnn);
    }
}
