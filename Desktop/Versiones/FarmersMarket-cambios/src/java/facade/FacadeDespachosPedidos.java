/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Conexion.Conection;
import daos.DespachosPedidosDAO;
import dtos.DespachosPedidosDTO;
import dtos.SolicitudDistribuidorDTO;
import java.sql.Connection;
import java.util.LinkedList;
import utilidades.Conectar;
import utilidades.MyException;

/**
 *
 * @author Mona
 */
public class FacadeDespachosPedidos {
    private Connection cnn = null;
    private DespachosPedidosDAO despachoDao = null;
    private DespachosPedidosDTO despachoDto = null;
    
    public FacadeDespachosPedidos(){
        despachoDao = new DespachosPedidosDAO();
        despachoDto = new DespachosPedidosDTO();
//        cnn = Conection.getConnection2();
        cnn = Conectar.getInstance();
    }
    
    public String insertarDespacho(DespachosPedidosDTO despachoDto){
        return despachoDao.insertarDespacho(despachoDto, cnn);
    }
    
    public LinkedList<SolicitudDistribuidorDTO> mostrarDespachosPendientes() throws MyException{
        return despachoDao.mostrarDespachosPendientes(cnn);
    }
    
    public SolicitudDistribuidorDTO consultarSolicitud(int id){
        return despachoDao.consultarSolicitud(id, cnn);
    }
}
