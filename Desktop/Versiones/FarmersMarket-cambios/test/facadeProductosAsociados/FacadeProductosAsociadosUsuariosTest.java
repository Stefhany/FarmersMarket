/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeProductosAsociados;

import dtos.ProductosAsociadosUsuariosDTO;
import facade.FacadeProductosAsociadosUsuarios;
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
public class FacadeProductosAsociadosUsuariosTest {
    
    public FacadeProductosAsociadosUsuariosTest() {
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
     * Test of listarProductosByUser method, of class FacadeProductosAsociadosUsuarios.
     */
    @Test
    public void testListarProductosByUser() {
        System.out.println("listarProductosByUser");
        int idUser = 0;
        FacadeProductosAsociadosUsuarios instance = new FacadeProductosAsociadosUsuarios();
        ArrayList<ProductosAsociadosUsuariosDTO> expResult = null;
        ArrayList<ProductosAsociadosUsuariosDTO> result = instance.listarProductosByUser(idUser);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarMisProductos method, of class FacadeProductosAsociadosUsuarios.
     */
    @Test
    public void testConsultarMisProductos() {
        System.out.println("consultarMisProductos");
        int idUser = 0;
        FacadeProductosAsociadosUsuarios instance = new FacadeProductosAsociadosUsuarios();
        ArrayList<ProductosAsociadosUsuariosDTO> expResult = null;
        ArrayList<ProductosAsociadosUsuariosDTO> result = instance.consultarMisProductos(idUser);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarProAso method, of class FacadeProductosAsociadosUsuarios.
     */
    @Test
    public void testEliminarProAso() {
        System.out.println("eliminarProAso");
        int id = 0;
        FacadeProductosAsociadosUsuarios instance = new FacadeProductosAsociadosUsuarios();
        String expResult = "";
        String result = instance.eliminarProAso(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertarProductoAsociado method, of class FacadeProductosAsociadosUsuarios.
     */
    @Test
    public void testInsertarProductoAsociado() {
        System.out.println("insertarProductoAsociado");
        String nomProducto = "";
        int categoria = 0;
        int idUsuario = 0;
        FacadeProductosAsociadosUsuarios instance = new FacadeProductosAsociadosUsuarios();
        String expResult = "";
        String result = instance.insertarProductoAsociado(nomProducto, categoria, idUsuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
