/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeRolesUsuarios;

import dtos.RolesUsuariosDTO;
import facade.FacadeRolesUsuarios;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Mona
 */
public class FacadeRolesUsuariosTest {
    
    public FacadeRolesUsuariosTest() {
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

    /**
     * Test of registrarRol method, of class FacadeRolesUsuarios.
     */
    @Test
    public void testRegistrarRol() {
        System.out.println("registrarRol");
        RolesUsuariosDTO rol = null;
        FacadeRolesUsuarios instance = new FacadeRolesUsuarios();
        String expResult = "";
        String result = instance.registrarRol(rol);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
