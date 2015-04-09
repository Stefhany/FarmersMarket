/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeDespachosPedidos;

import dtos.DespachosPedidosDTO;
import dtos.SolicitudDistribuidorDTO;
import facade.FacadeDespachosPedidos;
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
public class FacadeDespachosPedidosTest {
    
    public FacadeDespachosPedidosTest() {
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
     * Test of insertarDespacho method, of class FacadeDespachosPedidos.
     */
    @Test
    public void testInsertarDespacho() {
        System.out.println("insertarDespacho");
        DespachosPedidosDTO despachoDto = null;
        FacadeDespachosPedidos instance = new FacadeDespachosPedidos();
        String expResult = "";
        String result = instance.insertarDespacho(despachoDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of mostrarDespachosPendientes method, of class FacadeDespachosPedidos.
     */
    @Test
    public void testMostrarDespachosPendientes() throws Exception {
        System.out.println("mostrarDespachosPendientes");
        FacadeDespachosPedidos instance = new FacadeDespachosPedidos();
        LinkedList<SolicitudDistribuidorDTO> expResult = null;
        LinkedList<SolicitudDistribuidorDTO> result = instance.mostrarDespachosPendientes();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarSolicitud method, of class FacadeDespachosPedidos.
     */
    @Test
    public void testConsultarSolicitud() {
        System.out.println("consultarSolicitud");
        int id = 0;
        FacadeDespachosPedidos instance = new FacadeDespachosPedidos();
        SolicitudDistribuidorDTO expResult = null;
        SolicitudDistribuidorDTO result = instance.consultarSolicitud(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
