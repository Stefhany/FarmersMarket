/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeSolicitudDistribuidor;

import dtos.SolicitudDistribuidorDTO;
import facade.FacadeSolicitudDistribuidor;
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
public class FacadeSolicitudDistribuidorTest {
    
    public FacadeSolicitudDistribuidorTest() {
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
     * Test of insertarSolicitudDistribuidor method, of class FacadeSolicitudDistribuidor.
     */
    @Test
    public void testInsertarSolicitudDistribuidor() {
        System.out.println("insertarSolicitudDistribuidor");
        SolicitudDistribuidorDTO solicitud = null;
        FacadeSolicitudDistribuidor instance = new FacadeSolicitudDistribuidor();
        String expResult = "";
        String result = instance.insertarSolicitudDistribuidor(solicitud);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarSolicitudesDistribuidor method, of class FacadeSolicitudDistribuidor.
     */
    @Test
    public void testListarSolicitudesDistribuidor() {
        System.out.println("listarSolicitudesDistribuidor");
        FacadeSolicitudDistribuidor instance = new FacadeSolicitudDistribuidor();
        LinkedList<SolicitudDistribuidorDTO> expResult = null;
        LinkedList<SolicitudDistribuidorDTO> result = instance.listarSolicitudesDistribuidor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of byIdRequest method, of class FacadeSolicitudDistribuidor.
     */
    @Test
    public void testByIdRequest() {
        System.out.println("byIdRequest");
        int id = 0;
        FacadeSolicitudDistribuidor instance = new FacadeSolicitudDistribuidor();
        SolicitudDistribuidorDTO expResult = null;
        SolicitudDistribuidorDTO result = instance.byIdRequest(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarSolicitud method, of class FacadeSolicitudDistribuidor.
     */
    @Test
    public void testEliminarSolicitud() {
        System.out.println("eliminarSolicitud");
        int id = 0;
        FacadeSolicitudDistribuidor instance = new FacadeSolicitudDistribuidor();
        String expResult = "";
        String result = instance.eliminarSolicitud(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of modificarSolicitudDistribuidor method, of class FacadeSolicitudDistribuidor.
     */
    @Test
    public void testModificarSolicitudDistribuidor() {
        System.out.println("modificarSolicitudDistribuidor");
        SolicitudDistribuidorDTO solicitud = null;
        FacadeSolicitudDistribuidor instance = new FacadeSolicitudDistribuidor();
        String expResult = "";
        String result = instance.modificarSolicitudDistribuidor(solicitud);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
