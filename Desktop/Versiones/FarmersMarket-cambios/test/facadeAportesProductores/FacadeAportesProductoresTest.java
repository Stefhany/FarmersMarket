/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeAportesProductores;

import dtos.SolicitudDistribuidorDTO;
import facade.FacadeAportesProductores;
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
public class FacadeAportesProductoresTest {
    
    public FacadeAportesProductoresTest() {
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
     * Test of listarSolicitudesDeAsociacion method, of class FacadeAportesProductores.
     */
    @Test
    public void testListarSolicitudesDeAsociacion() {
        System.out.println("listarSolicitudesDeAsociacion");
        FacadeAportesProductores instance = new FacadeAportesProductores();
        LinkedList<SolicitudDistribuidorDTO> expResult = null;
        LinkedList<SolicitudDistribuidorDTO> result = instance.listarSolicitudesDeAsociacion();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of buscarIdAsociacion method, of class FacadeAportesProductores.
     */
    @Test
    public void testBuscarIdAsociacion() {
        System.out.println("buscarIdAsociacion");
        int id = 0;
        FacadeAportesProductores instance = new FacadeAportesProductores();
        SolicitudDistribuidorDTO expResult = null;
        SolicitudDistribuidorDTO result = instance.buscarIdAsociacion(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of participarASolicitudAsociacion method, of class FacadeAportesProductores.
     */
    @Test
    public void testParticiparASolicitudAsociacion() {
        System.out.println("participarASolicitudAsociacion");
        String fechaEntrega = "";
        int cantidadAportar = 0;
        int proAsoId = 0;
        int idSolicitud = 0;
        FacadeAportesProductores instance = new FacadeAportesProductores();
        String expResult = "";
        String result = instance.participarASolicitudAsociacion(fechaEntrega, cantidadAportar, proAsoId, idSolicitud);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
