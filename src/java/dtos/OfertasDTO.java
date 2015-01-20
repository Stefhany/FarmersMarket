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
public class OfertasDTO {

    private int idOfertas = 0;
    private String nombre = " ";
    private int cantidad = 0;
    private float precio = 0;
    private int productosAsociadosUsuariosId;    
    private ProductoDTO products = null;
    private UsuariosDTO user = null;
    
    public OfertasDTO(){
        
    }
    
    public OfertasDTO(ProductoDTO nombre, UsuariosDTO nameUser){
        this.products = nombre;
        this.user = nameUser;
    }
    
    /**
     * @return the idOfertas
     */
    public int getIdOfertas() {
        return idOfertas;
    }

    /**
     * @param idOfertas the idOfertas to set
     */
    public void setIdOfertas(int idOfertas) {
        this.idOfertas = idOfertas;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the precio
     */
    public float getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(float precio) {
        this.precio = precio;
    }

    /**
     * @return the products
     */
    public ProductoDTO getProducts() {
        return products;
    }

    /**
     * @param products the products to set
     */
    public void setProducts(ProductoDTO products) {
        this.products = products;
    }

    /**
     * @return the user
     */
    public UsuariosDTO getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(UsuariosDTO user) {
        this.user = user;
    }

    /**
     * @return the productosAsociadosUsuariosId
     */
    public int getProductosAsociadosUsuariosId() {
        return productosAsociadosUsuariosId;
    }

    /**
     * @param productosAsociadosUsuariosId the productosAsociadosUsuariosId to set
     */
    public void setProductosAsociadosUsuariosId(int productosAsociadosUsuariosId) {
        this.productosAsociadosUsuariosId = productosAsociadosUsuariosId;
    }
    
    
    @Override
    public String toString() {
        return "OfertasDTO " + "idOfertas = " + idOfertas + ", nombre = " + nombre + ", cantidad = " + cantidad + ", precio = " + precio + ", productosAsociadosUsuariosId = " + productosAsociadosUsuariosId + ", products = " + products + ", user = " + user;
    }
}
