/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.CategoriaDTO;
import dtos.ProductoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import utilidades.Conectar;

/**
 *
 * @author krito
 */
public class CategoriaDAO {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn = null;
    String salida = " ";
    int resultado = 0;
    CategoriaDTO cdto = new CategoriaDTO();
    ArrayList <CategoriaDTO> categorias = new ArrayList<>();

    public CategoriaDAO() {
        cnn = Conectar.getInstance();
    }

    public String insertarCategoria(CategoriaDTO nuevaCategoria) {
        try {
            pstmt = cnn.prepareStatement("INSERT INTO categorias VALUES (null, ?);");
            pstmt.setString(1, nuevaCategoria.getNombre());
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                salida = "El registro de la categoria " + resultado + " ha sido exitoso";
            } else {
                salida = "No se pudo realizar el registro";
            }
        } catch (SQLException sqle) {
            salida = "Ha ocurrido la siguiente exepción.. " + sqle.getMessage();

        }
        return salida;
    }

    public String modificarCategoria(CategoriaDTO modCategoria) {
        try{
        pstmt = cnn.prepareStatement("UPDATE categorias SET nombre = ? WHERE idcategorias = ?;");
        pstmt.setString(1, modCategoria.getNombre());
        resultado =  pstmt.executeUpdate();
        
        if (resultado != 0) {
            salida = "La modificación se pudo realizar "+ resultado + "exitosamente";
        }else{
            salida = "No se pudo realizar la modificación";
        }
        }catch(SQLException sqle){
            salida = "Ha ocurrido lo siguiente... "+sqle.getMessage();
        }       
        return salida;
    }
    
    public ArrayList<CategoriaDTO> listarCategorias(){
        try{
        pstmt = cnn.prepareStatement("SELECT idCategorias as id, nombreCategoria FROM categorias;");
        rs = pstmt.executeQuery();
        
        if (rs != null) {
            while (rs.next()){
                CategoriaDTO cadto =new CategoriaDTO();
                cadto.setIdCategoria(rs.getInt("id"));
                cadto.setNombre(rs.getString("nombreCategoria"));
                categorias.add(cadto);
            }
        }else{
            System.out.println("No se encuetran registros de categorias");
        }
        }catch(SQLException sqle){
            System.out.println("Se ha producido esta excepción.. "+sqle.getMessage());
        }
        return categorias;
    }
    
    public String eliminarCategoria(int id){
        try{
            pstmt = cnn.prepareStatement("DELETE FROM categorias WHERE idCategorias = ?;");
            pstmt.setInt(1, id);
            resultado = pstmt.executeUpdate();
            
            if (resultado != 0) {
                salida = "Registro " + resultado + " eliminado. Exitosamente";
            }
        }catch (SQLException sqle){
            salida = "Ocurrio esta excepción "+sqle.getMessage();
        }
        return salida;
    }
    
    public CategoriaDTO consultarById(int id){
        try{
            pstmt = cnn.prepareStatement("SELECT idCategorias as id, nombre FROM categorias WHERE idCategorias = ?;");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while(rs.next()){
                    cdto.setIdCategoria(rs.getInt("id"));
                    cdto.setNombre(rs.getString("nombre"));
                }
            }else{
                System.out.println("No hay registros... ");
            }
        }catch (SQLException sqle){
            System.out.println("Ups! Mira lo ocurrido... "+sqle.getMessage());
        }
        return cdto;
    }
    
    /*
    * Listar las categorías que se encuentran en el sistema.
    */
    public LinkedList<CategoriaDTO> listarCategorias2() throws MyException, SQLException {
        LinkedList<CategoriaDTO> listaCategory = new LinkedList<>();
        try {
            String query = "SELECT  idcategorias as id, nombreCategoria "                    
                    + " FROM categorias ";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CategoriaDTO newCategory = new CategoriaDTO();
                newCategory.setIdCategoria(rs.getInt("id"));
                newCategory.setNombre(rs.getString("nombreCategoria"));                
                listaCategory.add(newCategory);
            }
        } catch (SQLException ex) {
            throw new MyException("Error al listar los elementos " + ex.getSQLState() + " - " + ex.getMessage());
        } finally {
            pstmt.close();
        }
        return listaCategory;
    }
    /**
     * 
     * Este metodo se hace para realzar la lista dependiente
     * de acuerdo a la categoria que escojio y de inmediato se cargan 
     * los productos encontrados en la misma.
     * */
    public LinkedList<ProductoDTO> listarSubCategorias(int idCategoria) throws MyException, SQLException{
        LinkedList<ProductoDTO> productos = new LinkedList<>();
        try {
            pstmt = cnn.prepareStatement("SELECT idProductos as id, nombreproducto, categoriasId "
                    + " FROM productos "
                    + " WHERE categoriasId = ?;");
            pstmt.setInt(1, idCategoria);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ProductoDTO onlyProduct = new ProductoDTO();
                    onlyProduct.setIdProductos(rs.getInt("id"));
                    onlyProduct.setNombre(rs.getString("nombreproducto"));
                    
                    //para esta parte creo que ni la categoria se necesita
                    //onlyProduct.setCategoriaId((CategoriaDTO)rs.getObject("categoriasId"));
                    onlyProduct.setCategoriaId2(rs.getInt("categoriasId")); //porque 2, porque el otro es de asociacion y este es de int
                    //onlyProduct.setCategoriaId() probemos primro asi. pero no tiene sentido que coloque un objeto y luefo un atributo
                    productos.add(onlyProduct);
                    
                }
            } else {}
        } catch (SQLException sqle) {
            throw new MyException("Ha ocurrido lo siguiente. Revise! "+ sqle.getMessage() + sqle.getSQLState());
        }finally{
            pstmt.close();
        }
        return productos;
    }
}
