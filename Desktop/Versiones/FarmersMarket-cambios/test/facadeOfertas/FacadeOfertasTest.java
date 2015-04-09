/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeOfertas;

import dtos.OfertasDTO;
import dtos.ProductoDTO;
import facade.FacadeOfertas;
import java.util.ArrayList;
import java.util.List;
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
public class FacadeOfertasTest {
    
    public FacadeOfertasTest() {
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
     * Test of registrarOferta method, of class FacadeOfertas.
     */
    @Test
    public void testRegistrarOferta() {
        System.out.println("registrarOferta");
        OfertasDTO offerDto = null;
        FacadeOfertas instance = new FacadeOfertas();
        String expResult = "";
        String result = instance.registrarOferta(offerDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of actualizarOferta method, of class FacadeOfertas.
     */
    @Test
    public void testActualizarOferta() {
        System.out.println("actualizarOferta");
        OfertasDTO offerDto = null;
        FacadeOfertas instance = new FacadeOfertas();
        String expResult = "";
        String result = instance.actualizarOferta(offerDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarOferta method, of class FacadeOfertas.
     */
    @Test
    public void testEliminarOferta() {
        System.out.println("eliminarOferta");
        int id = 0;
        FacadeOfertas instance = new FacadeOfertas();
        String expResult = "";
        String result = instance.eliminarOferta(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarProductoAsociado method, of class FacadeOfertas.
     */
    @Test
    public void testListarProductoAsociado() {
        System.out.println("listarProductoAsociado");
        int id = 0;
        FacadeOfertas instance = new FacadeOfertas();
        List<ProductoDTO> expResult = null;
        List<ProductoDTO> result = instance.listarProductoAsociado(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarOfertas method, of class FacadeOfertas.
     */
    @Test
    public void testConsultarOfertas() {
        System.out.println("consultarOfertas");
        FacadeOfertas instance = new FacadeOfertas();
        List<OfertasDTO> expResult = null;
        List<OfertasDTO> result = instance.consultarOfertas();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultByOffer method, of class FacadeOfertas.
     */
    @Test
    public void testConsultByOffer() throws Exception {
        System.out.println("consultByOffer");
        int id = 0;
        FacadeOfertas instance = new FacadeOfertas();
        OfertasDTO expResult = null;
        OfertasDTO result = instance.consultByOffer(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarMisOfertas method, of class FacadeOfertas.
     */
    @Test
    public void testConsultarMisOfertas() {
        System.out.println("consultarMisOfertas");
        int idUser = 0;
        FacadeOfertas instance = new FacadeOfertas();
        ArrayList<OfertasDTO> expResult = null;
        ArrayList<OfertasDTO> result = instance.consultarMisOfertas(idUser);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultMyOffer method, of class FacadeOfertas.
     */
    @Test
    public void testConsultMyOffer() throws Exception {
        System.out.println("consultMyOffer");
        int id = 0;
        FacadeOfertas instance = new FacadeOfertas();
        OfertasDTO expResult = null;
        OfertasDTO result = instance.consultMyOffer(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of actualizarMiOferta method, of class FacadeOfertas.
     */
    @Test
    public void testActualizarMiOferta() {
        System.out.println("actualizarMiOferta");
        OfertasDTO offerDto = null;
        FacadeOfertas instance = new FacadeOfertas();
        String expResult = "";
        String result = instance.actualizarMiOferta(offerDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
