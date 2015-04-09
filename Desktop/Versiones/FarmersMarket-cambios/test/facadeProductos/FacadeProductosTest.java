/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeProductos;

import dtos.ProductoDTO;
import facade.FacadeProductos;
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
public class FacadeProductosTest {
    
    public FacadeProductosTest() {
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
     * Test of registrarProducto method, of class FacadeProductos.
     */
    @Test
    public void testRegistrarProducto() {
        System.out.println("registrarProducto");
        ProductoDTO productDto = null;
        FacadeProductos instance = new FacadeProductos();
        String expResult = "";
        String result = instance.registrarProducto(productDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of actualizarProducto method, of class FacadeProductos.
     */
    @Test
    public void testActualizarProducto() {
        System.out.println("actualizarProducto");
        ProductoDTO productDto = null;
        FacadeProductos instance = new FacadeProductos();
        String expResult = "";
        String result = instance.actualizarProducto(productDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarProducto method, of class FacadeProductos.
     */
    @Test
    public void testEliminarProducto() {
        System.out.println("eliminarProducto");
        int id = 0;
        FacadeProductos instance = new FacadeProductos();
        String expResult = "";
        String result = instance.eliminarProducto(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarAllProducts method, of class FacadeProductos.
     */
    @Test
    public void testListarAllProducts() throws Exception {
        System.out.println("listarAllProducts");
        FacadeProductos instance = new FacadeProductos();
        List<ProductoDTO> expResult = null;
        List<ProductoDTO> result = instance.listarAllProducts();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarByIdProduct method, of class FacadeProductos.
     */
    @Test
    public void testConsultarByIdProduct() throws Exception {
        System.out.println("consultarByIdProduct");
        int id = 0;
        FacadeProductos instance = new FacadeProductos();
        ProductoDTO expResult = null;
        ProductoDTO result = instance.consultarByIdProduct(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
