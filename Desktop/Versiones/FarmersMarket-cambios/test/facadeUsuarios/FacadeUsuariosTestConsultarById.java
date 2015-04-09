/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeUsuarios;

import daos.UsuariosDAO;
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
public class FacadeUsuariosTestConsultarById {

    UsuariosDTO userDto = null;
    
    public FacadeUsuariosTestConsultarById() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        userDto = new UsuariosDTO();
        userDto.setIdUsuarios(20);
    }

    @After
    public void tearDown() {
    }

    // @Test
    // public void hello() {}
    @Test
    public void PruebaListarId() {
        UsuariosDTO user;
        FacadeUsuarios facadeUser = new FacadeUsuarios();
                        
        user = facadeUser.consultarUnRegistro(20);
        
        assertEquals(user.getIdUsuarios(), userDto.getIdUsuarios());
    }
}
