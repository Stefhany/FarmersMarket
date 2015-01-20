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
public class ProductoDTO {

    private int idProductos = 0;
    private String nombre = " "; 
    private String unidad = " ";
    private CategoriaDTO categoriaId = null;

    public ProductoDTO() {
    }
    
    public ProductoDTO(int idp, String nomPro, String unidad, CategoriaDTO cdto) {
        this.idProductos = idp;
        this.nombre = nomPro;
        this.unidad = unidad;
        this.categoriaId = cdto;
    }

    /**
     * @return the idProductos
     */
    public int getIdProductos() {
        return idProductos;
    }

    /**
     * @param idProductos the idProductos to set
     */
    public void setIdProductos(int idProductos) {
        this.idProductos = idProductos;
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
     * @return the unidad
     */
    public String getUnidad() {
        return unidad;
    }

    /**
     * @param unidad the unidad to set
     */
    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    /**
     * @return the categoriaId
     */
    public CategoriaDTO getCategoriaId() {
        return categoriaId;
    }

    /**
     * @param categoriaId the categoriaId to set
     */
    public void setCategoriaId(CategoriaDTO categoriaId) {
        this.categoriaId = categoriaId;
    }

    @Override
    public String toString() {
        return "ProductoDTO " + " idProductos = " + idProductos + ", nombre = " + nombre + ", unidad = " + unidad + ", categoriaId=  " + categoriaId;
    }

}
