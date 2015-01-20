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
    private int usuariosId = 0;
    private int productosId = 0;

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

    /**
     * @return the usuariosId
     */
    public int getUsuariosId() {
        return usuariosId;
    }

    /**
     * @param usuariosId the usuariosId to set
     */
    public void setUsuariosId(int usuariosId) {
        this.usuariosId = usuariosId;
    }

    /**
     * @return the productosId
     */
    public int getProductosId() {
        return productosId;
    }

    /**
     * @param productosId the productosId to set
     */
    public void setProductosId(int productosId) {
        this.productosId = productosId;
    }
    
        @Override
    public String toString() {
        return "ProductosAsociadosUsuariosDTO " + " idProductosAsociadosUsuarios = " + idProductosAsociadosUsuarios + ", usuariosId = " + usuariosId + ", productosId = " + productosId;
    }

}
