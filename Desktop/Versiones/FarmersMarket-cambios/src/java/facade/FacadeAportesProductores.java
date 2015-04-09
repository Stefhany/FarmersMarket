/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Conexion.Conection;
import daos.AportesProductoresDAO;
import dtos.AportesProductoresDTO;
import dtos.SolicitudDistribuidorDTO;
import java.sql.Connection;
import java.util.LinkedList;
import utilidades.Conectar;

/**
 *
 * @author Mona
 */
public class FacadeAportesProductores {
    private Connection cnn = null;
    private AportesProductoresDAO aporteDao = null;
    private AportesProductoresDTO aporteDto = null;
    
    public FacadeAportesProductores(){
//        cnn = Conection.getConnection2();
        aporteDao = new AportesProductoresDAO();
        aporteDto = new AportesProductoresDTO();
        cnn = Conectar.getInstance();
    }
    
    public LinkedList<SolicitudDistribuidorDTO> listarSolicitudesDeAsociacion(){
        return aporteDao.listarSolicitudesDeAsociacion(cnn);
    }
    
    public SolicitudDistribuidorDTO buscarIdAsociacion(int id){
        return aporteDao.byIdForAssociation(id, cnn);
    }
    
    public String participarASolicitudAsociacion(String fechaEntrega, int cantidadAportar, 
            int proAsoId, int idSolicitud){
        return aporteDao.aplicarSolicitudAsociacion(fechaEntrega, cantidadAportar, proAsoId, idSolicitud, cnn);
    }
}
