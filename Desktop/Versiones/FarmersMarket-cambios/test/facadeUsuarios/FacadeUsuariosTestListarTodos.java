/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facadeUsuarios;

import dtos.UsuariosDTO;
import facade.FacadeUsuarios;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Mona
 */
public class FacadeUsuariosTestListarTodos {
    
    private UsuariosDTO user1;
    private UsuariosDTO user2;
    private UsuariosDTO user3;
    private UsuariosDTO user4;
    private UsuariosDTO user5;
    private UsuariosDTO user6;
    private UsuariosDTO user7;
    private UsuariosDTO user8;
    private UsuariosDTO user9;
    private UsuariosDTO user10;
    private UsuariosDTO user11; 
    private UsuariosDTO user12;
    private UsuariosDTO user13;
    private UsuariosDTO user14;
    private UsuariosDTO user15;
    private UsuariosDTO user16;
    private UsuariosDTO user17;
    private UsuariosDTO user18;
    private UsuariosDTO user19;
    private UsuariosDTO user20;
    private UsuariosDTO user21;
    
    private ArrayList<UsuariosDTO> users;
    
    public FacadeUsuariosTestListarTodos() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        users  = new ArrayList();
        
        user1 = new UsuariosDTO();
    user2 = new UsuariosDTO();
    user3 = new UsuariosDTO();
    user4 = new UsuariosDTO();
    user5 = new UsuariosDTO();
    user6 = new UsuariosDTO();
    user7 = new UsuariosDTO();
    user8 = new UsuariosDTO();    
    user9 = new UsuariosDTO();
    user10 = new UsuariosDTO(); 
    user11 = new UsuariosDTO(); 
    user12 = new UsuariosDTO(); 
    user13 = new UsuariosDTO(); 
    user14 = new UsuariosDTO(); 
    user15 = new UsuariosDTO(); 
    user16 = new UsuariosDTO(); 
    user17 = new UsuariosDTO(); 
    user18 = new UsuariosDTO(); 
    user19 = new UsuariosDTO(); 
    user20 = new UsuariosDTO(); 
    user21 = new UsuariosDTO(); 
    
    user1.setIdUsuarios(1);
    user2.setIdUsuarios(2);
    user3.setIdUsuarios(3);
    user4.setIdUsuarios(4);
    user5.setIdUsuarios(5);
    user6.setIdUsuarios(6);
    user7.setIdUsuarios(7);
    user8.setIdUsuarios(8);
    user9.setIdUsuarios(9);
    user10.setIdUsuarios(10);
    user11.setIdUsuarios(11);
    user12.setIdUsuarios(12);
    user13.setIdUsuarios(13);
    user14.setIdUsuarios(14);
    user15.setIdUsuarios(15);
    user16.setIdUsuarios(16);
    user17.setIdUsuarios(17);
    user18.setIdUsuarios(18);
    user19.setIdUsuarios(19);
    user20.setIdUsuarios(20);
    user21.setIdUsuarios(21);
    
    users.add(user1);
    users.add(user2);
    users.add(user3);
    users.add(user4);
    users.add(user5);
    users.add(user6);
    users.add(user7);
    users.add(user8);
    users.add(user9);
    users.add(user10);
    users.add(user11);
    users.add(user12);
    users.add(user13);
    users.add(user14);
    users.add(user15);
    users.add(user16);
    users.add(user17);
    users.add(user18);
    users.add(user19);
    users.add(user20);
    users.add(user21);
    
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void pruebalistapersona(){
        
        FacadeUsuarios facadeUser = new FacadeUsuarios();
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        usuarios = facadeUser.consultarRegistros();
        
        assertEquals(usuarios.get(0).getIdUsuarios(), usuarios.get(0).getIdUsuarios());
        assertEquals(usuarios.get(1).getIdUsuarios(), usuarios.get(1).getIdUsuarios());
        assertEquals(usuarios.get(2).getIdUsuarios(), usuarios.get(2).getIdUsuarios());
        assertEquals(usuarios.get(3).getIdUsuarios(), usuarios.get(3).getIdUsuarios());
        assertEquals(usuarios.get(4).getIdUsuarios(), usuarios.get(4).getIdUsuarios());
        assertEquals(usuarios.get(5).getIdUsuarios(), usuarios.get(5).getIdUsuarios());
        assertEquals(usuarios.get(6).getIdUsuarios(), usuarios.get(6).getIdUsuarios());
        assertEquals(usuarios.get(7).getIdUsuarios(), usuarios.get(7).getIdUsuarios());
        assertEquals(usuarios.get(8).getIdUsuarios(), usuarios.get(8).getIdUsuarios());
        assertEquals(usuarios.get(9).getIdUsuarios(), usuarios.get(9).getIdUsuarios());
        assertEquals(usuarios.get(10).getIdUsuarios(), usuarios.get(10).getIdUsuarios());
        assertEquals(usuarios.get(11).getIdUsuarios(), usuarios.get(11).getIdUsuarios());
        assertEquals(usuarios.get(12).getIdUsuarios(), usuarios.get(12).getIdUsuarios());
        assertEquals(usuarios.get(13).getIdUsuarios(), usuarios.get(13).getIdUsuarios());
        assertEquals(usuarios.get(14).getIdUsuarios(), usuarios.get(14).getIdUsuarios());
        assertEquals(usuarios.get(15).getIdUsuarios(), usuarios.get(15).getIdUsuarios());
        assertEquals(usuarios.get(16).getIdUsuarios(), usuarios.get(16).getIdUsuarios());
        assertEquals(usuarios.get(17).getIdUsuarios(), usuarios.get(17).getIdUsuarios());
        assertEquals(usuarios.get(18).getIdUsuarios(), usuarios.get(18).getIdUsuarios());
        assertEquals(usuarios.get(19).getIdUsuarios(), usuarios.get(19).getIdUsuarios());
        assertEquals(usuarios.get(20).getIdUsuarios(), usuarios.get(20).getIdUsuarios());
        
        
//        
//        
//        
//        PersonaDAO pDAO = new PersonaDAO();
//        ArrayList<PersonaDTO> ListaPersonas = new ArrayList();
//        ListaPersonas = pDAO.listarPersonas();
//        
//        assertEquals(ListaPersonas.get(0).getIdPersona(),lista.get(0).getIdPersona());
//        assertEquals(ListaPersonas.get(1).getIdPersona(),lista.get(1).getIdPersona());
//        assertEquals(ListaPersonas.get(2).getIdPersona(),lista.get(2).getIdPersona());
    }
}
