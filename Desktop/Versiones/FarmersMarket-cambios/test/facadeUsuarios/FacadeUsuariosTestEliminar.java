/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeUsuarios;

import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import java.util.ArrayList;
import java.util.HashMap;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Mona
 */
public class FacadeUsuariosTestEliminar {
      
    public FacadeUsuariosTestEliminar() {
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

    @Test 
    public void testEliminarUser(){
        String resultadoes="El registro se elimino corretamente";
        UsuariosDTO userDto = new UsuariosDTO();
        userDto.setIdUsuarios(24);
        
        FacadeUsuarios facadeUser = new FacadeUsuarios();
        String resultado = facadeUser.eliminarUsuario(userDto.getIdUsuarios());

        assertEquals(resultado, resultadoes);
    
    }

}
