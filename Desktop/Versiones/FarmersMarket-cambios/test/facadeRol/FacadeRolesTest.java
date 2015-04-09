/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeRol;

import dtos.RolesDTO;
import facade.FacadeRoles;
import java.util.ArrayList;
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
public class FacadeRolesTest {
    
    public FacadeRolesTest() {
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
     * Test of listarRoles method, of class FacadeRoles.
     */
    @Test
    public void testListarRoles() {
        System.out.println("listarRoles");
        FacadeRoles instance = new FacadeRoles();
        ArrayList<RolesDTO> expResult = null;
        ArrayList<RolesDTO> result = instance.listarRoles();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
