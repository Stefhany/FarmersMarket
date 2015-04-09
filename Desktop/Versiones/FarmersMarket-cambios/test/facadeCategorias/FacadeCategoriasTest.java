/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeCategorias;

import dtos.CategoriaDTO;
import dtos.ProductoDTO;
import facade.FacadeCategorias;
import java.util.ArrayList;
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
public class FacadeCategoriasTest {
    
    public FacadeCategoriasTest() {
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
     * Test of insertarCategoria method, of class FacadeCategorias.
     */
    @Test
    public void testInsertarCategoria() throws Exception {
        System.out.println("insertarCategoria");
        CategoriaDTO categoryDto = null;
        FacadeCategorias instance = new FacadeCategorias();
        String expResult = "";
        String result = instance.insertarCategoria(categoryDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of actualizarCategoria method, of class FacadeCategorias.
     */
    @Test
    public void testActualizarCategoria() {
        System.out.println("actualizarCategoria");
        CategoriaDTO categoryDto = null;
        FacadeCategorias instance = new FacadeCategorias();
        String expResult = "";
        String result = instance.actualizarCategoria(categoryDto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarCategoria method, of class FacadeCategorias.
     */
    @Test
    public void testEliminarCategoria() {
        System.out.println("eliminarCategoria");
        int id = 0;
        FacadeCategorias instance = new FacadeCategorias();
        String expResult = "";
        String result = instance.eliminarCategoria(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultByIdCategoory method, of class FacadeCategorias.
     */
    @Test
    public void testConsultByIdCategoory() {
        System.out.println("consultByIdCategoory");
        int id = 0;
        FacadeCategorias instance = new FacadeCategorias();
        CategoriaDTO expResult = null;
        CategoriaDTO result = instance.consultByIdCategoory(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarCategorias method, of class FacadeCategorias.
     */
    @Test
    public void testListarCategorias() {
        System.out.println("listarCategorias");
        FacadeCategorias instance = new FacadeCategorias();
        ArrayList<CategoriaDTO> expResult = null;
        ArrayList<CategoriaDTO> result = instance.listarCategorias();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarTodasCategorias method, of class FacadeCategorias.
     */
    @Test
    public void testListarTodasCategorias() throws Exception {
        System.out.println("listarTodasCategorias");
        FacadeCategorias instance = new FacadeCategorias();
        LinkedList<CategoriaDTO> expResult = null;
        LinkedList<CategoriaDTO> result = instance.listarTodasCategorias();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarSubCategorias method, of class FacadeCategorias.
     */
    @Test
    public void testListarSubCategorias() throws Exception {
        System.out.println("listarSubCategorias");
        int idCategoria = 0;
        FacadeCategorias instance = new FacadeCategorias();
        LinkedList<ProductoDTO> expResult = null;
        LinkedList<ProductoDTO> result = instance.listarSubCategorias(idCategoria);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
