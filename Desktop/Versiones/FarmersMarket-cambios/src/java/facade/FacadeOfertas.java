/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import daos.OfertasDAO;
import dtos.OfertasDTO;
import java.sql.Connection;
import Conexion.Conection;

/**
 *
 * @author Mona
 */
public class FacadeOfertas {

    private Connection cnn = null;
    private OfertasDTO offerDto = null;
    private OfertasDAO offerDao = null;

    public FacadeOfertas(){
        cnn = Conection.getConection();
        offerDto = new OfertasDTO();
        offerDao = new OfertasDAO();
    }
    
    public String insertarOferta(offerDto, cnn) {}
}
