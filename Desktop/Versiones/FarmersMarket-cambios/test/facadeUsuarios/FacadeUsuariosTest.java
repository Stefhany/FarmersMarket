/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeUsuarios;

import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import java.util.ArrayList;
import java.util.HashMap;
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
public class FacadeUsuariosTest {
    
    public FacadeUsuariosTest() {
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
     * Test of ingresarRegistro method, of class FacadeUsuarios.
     */
    @Test
    public void testIngresarRegistro() {
        System.out.println("ingresarRegistro");
        UsuariosDTO usuario = null;
        FacadeUsuarios instance = new FacadeUsuarios();
        String expResult = "";
        String result = instance.ingresarRegistro(usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of modificarUsuario method, of class FacadeUsuarios.
     */
    @Test
    public void testModificarUsuario() throws Exception {
        System.out.println("modificarUsuario");
        UsuariosDTO usuario = null;
        FacadeUsuarios instance = new FacadeUsuarios();
        String expResult = "";
        String result = instance.modificarUsuario(usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of eliminarUsuario method, of class FacadeUsuarios.
     */
    @Test
    public void testEliminarUsuario() {
        System.out.println("eliminarUsuario");
        int idUser = 15;
        FacadeUsuarios instance = new FacadeUsuarios();
        String resultadoString = "El registro se elimino corretamente";
        String resultadoActual = instance.eliminarUsuario(idUser);
        assertEquals(resultadoString, resultadoActual);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }    
    @Test 
    public void testEliminarUser(){
        String resultadoes="El registro se elimino corretamente";
        UsuariosDTO userDto = new UsuariosDTO();
        userDto.setIdUsuarios(20);
        
        FacadeUsuarios facadeUser = new FacadeUsuarios();
        String resultado = facadeUser.eliminarUsuario(userDto.getIdUsuarios());

        assertEquals(resultadoes, resultado);
    
    }

    /**
     * Test of consultarRegistros method, of class FacadeUsuarios.
     */
    @Test
    public void testConsultarRegistros() {
        System.out.println("consultarRegistros");
        FacadeUsuarios instance = new FacadeUsuarios();
        ArrayList<UsuariosDTO> expResult = null;
        ArrayList<UsuariosDTO> result = instance.consultarRegistros();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of consultarUnRegistro method, of class FacadeUsuarios.
     */
    @Test
    public void testConsultarUnRegistro() {
        System.out.println("consultarUnRegistro");
        int id = 20;
        FacadeUsuarios instance = new FacadeUsuarios();
        UsuariosDTO expResult = null;
        UsuariosDTO result = instance.consultarUnRegistro(id);
        assertEquals(expResult, result);
//         TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of validarUsuario method, of class FacadeUsuarios.
     */
    @Test
    public void testValidarUsuario() {
        System.out.println("validarUsuario");
        String correo = "";
        String pass = "";
        FacadeUsuarios instance = new FacadeUsuarios();
        UsuariosDTO expResult = null;
        UsuariosDTO result = instance.validarUsuario(correo, pass);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of mostrarPrueba method, of class FacadeUsuarios.
     */
    @Test
    public void testMostrarPrueba() {
        System.out.println("mostrarPrueba");
        FacadeUsuarios instance = new FacadeUsuarios();
        ArrayList<UsuariosDTO> expResult = null;
        ArrayList<UsuariosDTO> result = instance.mostrarPrueba();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of validarUsuarioV2 method, of class FacadeUsuarios.
     */
    @Test
    public void testValidarUsuarioV2() {
        System.out.println("validarUsuarioV2");
        String correo = "";
        String pss = "";
        String url = "";
        FacadeUsuarios instance = new FacadeUsuarios();
        HashMap<UsuariosDTO, String> expResult = null;
        HashMap<UsuariosDTO, String> result = instance.validarUsuarioV2(correo, pss);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
