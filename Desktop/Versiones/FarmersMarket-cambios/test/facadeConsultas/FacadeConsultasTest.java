/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeConsultas;

import dtos.ConsultasDTO;
import dtos.OfertasDTO;
import facade.FacadeConsultas;
import java.util.LinkedList;
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
public class FacadeConsultasTest {
    
    public FacadeConsultasTest() {
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
     * Test of consultarFiltro method, of class FacadeConsultas.
     */
    @Test
    public void testConsultarFiltro() {
        System.out.println("consultarFiltro");
        String filtro = "";
        FacadeConsultas instance = new FacadeConsultas();
        LinkedList<OfertasDTO> expResult = null;
        LinkedList<OfertasDTO> result = instance.consultarFiltro(filtro);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarFecha method, of class FacadeConsultas.
     */
    @Test
    public void testConsultarFecha() {
        System.out.println("consultarFecha");
        FacadeConsultas instance = new FacadeConsultas();
        ConsultasDTO expResult = null;
        ConsultasDTO result = instance.consultarFecha();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
