/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import Conexion.Conection;
import daos.UsuariosDAO;
import dtos.UsuariosDTO;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import utilidades.Conectar;
import utilidades.MyException;

/**
 *
 * @author Mona
 */
public class FacadeUsuarios {
    private Connection cnn = null;
    private UsuariosDAO userDao = null;
    private UsuariosDTO userDto = null;
    
    public FacadeUsuarios(){
//        cnn = Conection.getConnection2();
        
        userDao = new UsuariosDAO();
        userDto = new UsuariosDTO();
        cnn = Conectar.getInstance();
    }
    
    public String ingresarRegistro(UsuariosDTO usuario){
        return userDao.ingresarRegistro(usuario, cnn);
    }
    
    public String modificarUsuario(UsuariosDTO usuario) throws MyException{
        return userDao.modificarUsuario(usuario, cnn);
    }
    
    public String eliminarUsuario(int id){
        return userDao.eliminarUsuario(id, cnn);
    }
    
    public ArrayList<UsuariosDTO> consultarRegistros(){
        return userDao.consultarRegistros(cnn);
    }
    
    public UsuariosDTO consultarUnRegistro(int id){
        return userDao.consultarUnRegistro(id, cnn);
    }
    
    public UsuariosDTO validarUsuario(String correo, String pass){
        return userDao.validarUsuario(correo, pass, cnn);
    }
    
    public ArrayList<UsuariosDTO> mostrarPrueba(){
        return userDao.mostrarPrueba(cnn);
    }
    
    public HashMap<UsuariosDTO, String> validarUsuarioV2(String correo, String pss){
        return userDao.validarUsuarioV2(correo, pss, cnn);
    }
}

