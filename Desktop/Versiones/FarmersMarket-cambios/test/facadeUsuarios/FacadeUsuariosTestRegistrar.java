/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeUsuarios;

import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Mona
 */
public class FacadeUsuariosTestRegistrar {
    public FacadeUsuariosTestRegistrar() {
        
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test 
    public void PruebaRegistro(){
        String resultadoes="Se ha registrado satisfatoriamente ";
        
        UsuariosDTO userDto = new UsuariosDTO();
        userDto.setNombres(" Angel");
        userDto.setApellidos("Rortez");
        userDto.setCedula(18763256);
        userDto.setTelefono(898766);
        userDto.setDireccion("Carrera 5 con calle 100");
        userDto.setCorreo("angel34@hotmail.com");
        userDto.setClave("123");
        userDto.setNotificacion(true);
        userDto.setCiudad("Pasto");
        userDto.setFechaNacimiento("1890/11/10");
        
        
        FacadeUsuarios facadeUser = new FacadeUsuarios();
        String msgSalida = facadeUser.ingresarRegistro(userDto);
                
        assertEquals(resultadoes,msgSalida);
    }
}
