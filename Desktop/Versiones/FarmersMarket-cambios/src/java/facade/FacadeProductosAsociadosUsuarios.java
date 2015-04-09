/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Conexion.Conection;
import daos.ProductosAsociadosUsuariosDAO;
import dtos.ProductosAsociadosUsuariosDTO;
import java.sql.Connection;
import java.util.ArrayList;
import utilidades.Conectar;

/**
 *
 * @author Mona
 */
public class FacadeProductosAsociadosUsuarios {
    private Connection cnn = null;
    private ProductosAsociadosUsuariosDAO proAsoDao = null;
    private ProductosAsociadosUsuariosDTO proAsoDto = null;
    
    public FacadeProductosAsociadosUsuarios(){
//        cnn = Conection.getConnection2();
        proAsoDao = new ProductosAsociadosUsuariosDAO();
        proAsoDto = new ProductosAsociadosUsuariosDTO();
        cnn = Conectar.getInstance();
    }
    
    public ArrayList<ProductosAsociadosUsuariosDTO> listarProductosByUser(int idUser){
        return proAsoDao.listarProductosByUser(idUser, cnn);
    }
    
    public ArrayList<ProductosAsociadosUsuariosDTO> consultarMisProductos(int idUser){
        return proAsoDao.consultarMisProductos(idUser, cnn);
    }
    
    public String eliminarProAso(int id){
        return proAsoDao.eliminarProAso(id, cnn);
    }
    
    public String insertarProductoAsociado(String nomProducto, int categoria,int idUsuario){
        return proAsoDao.insertarProductoAsociado(nomProducto, categoria, idUsuario, cnn);
    }
}
