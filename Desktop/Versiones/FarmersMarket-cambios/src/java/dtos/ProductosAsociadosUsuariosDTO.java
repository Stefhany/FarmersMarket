/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dtos;

/**
 *
 * @author krito
 */
public class ProductosAsociadosUsuariosDTO {
    
    private int idProductosAsociadosUsuarios = 0;
    private UsuariosDTO usuario = null;
    private ProductoDTO producto= null;
    private int estado = 1;     //se toma habilitad por defecto

    public ProductosAsociadosUsuariosDTO(UsuariosDTO u, ProductoDTO p) {
        this.usuario=u;
        this.producto=p;
    }
    
    public ProductosAsociadosUsuariosDTO(){
        
    }    

    /**
     * @return the idProductosAsociadosUsuarios
     */
    public int getIdProductosAsociadosUsuarios() {
        return idProductosAsociadosUsuarios;
    }

    /**
     * @param idProductosAsociadosUsuarios the idProductosAsociadosUsuarios to set
     */
    public void setIdProductosAsociadosUsuarios(int idProductosAsociadosUsuarios) {
        this.idProductosAsociadosUsuarios = idProductosAsociadosUsuarios;
    }

   

    
        @Override
    public String toString() {
        return "ProductosAsociadosUsuariosDTO " + " idProductosAsociadosUsuarios = " + idProductosAsociadosUsuarios + ", usuariosId = "   + ", productosId = " + getProducto();
    }

    /**
     * @return the usuario
     */
    public UsuariosDTO getUsuario() {
        return usuario;
    }

    /**
     * @return the producto
     */
    public ProductoDTO getProducto() {
        return producto;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(UsuariosDTO usuario) {
        this.usuario = usuario;
    }

    /**
     * @param producto the producto to set
     */
    public void setProducto(ProductoDTO producto) {
        this.producto = producto;
    }

}
