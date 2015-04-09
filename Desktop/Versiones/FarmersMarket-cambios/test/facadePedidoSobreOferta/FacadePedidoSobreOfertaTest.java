/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadePedidoSobreOferta;

import facade.FacadePedidoSobreOferta;
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
public class FacadePedidoSobreOfertaTest {
    
    public FacadePedidoSobreOfertaTest() {
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
     * Test of registrarPedidoSobreOferta method, of class FacadePedidoSobreOferta.
     */
    @Test
    public void testRegistrarPedidoSobreOferta() {
        System.out.println("registrarPedidoSobreOferta");
        int cantidadPedida = 0;
        int idOferta = 0;
        String fechaSolicitud = "";
        FacadePedidoSobreOferta instance = new FacadePedidoSobreOferta();
        String expResult = "";
        String result = instance.registrarPedidoSobreOferta(cantidadPedida, idOferta, fechaSolicitud);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
