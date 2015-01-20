/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dtos;

import java.sql.Date;

/**
 *
 * @author krito
 */
public class PedidoDTO {
    
    private int pedidosId = 0;
    private int cantidadSolicitada = 0;
    private Date fechaSolicitada;
    private int estadosPedidosId = 0;
    private int productosId = 0;
    private int productorId = 0;
    private int productosAsociadosUsuariosId = 0;
    private int distribuidorId = 0;

    /**
     * @return the pedidosId
     */
    public int getPedidosId() {
        return pedidosId;
    }

    /**
     * @param pedidosId the pedidosId to set
     */
    public void setPedidosId(int pedidosId) {
        this.pedidosId = pedidosId;
    }

    /**
     * @return the cantidadSolicitada
     */
    public int getCantidadSolicitada() {
        return cantidadSolicitada;
    }

    /**
     * @param cantidadSolicitada the cantidadSolicitada to set
     */
    public void setCantidadSolicitada(int cantidadSolicitada) {
        this.cantidadSolicitada = cantidadSolicitada;
    }

    /**
     * @return the fechaSolicitada
     */
    public Date getFechaSolicitada() {
        return fechaSolicitada;
    }

    /**
     * @param fechaSolicitada the fechaSolicitada to set
     */
    public void setFechaSolicitada(Date fechaSolicitada) {
        this.fechaSolicitada = fechaSolicitada;
    }

    /**
     * @return the estadosPedidosId
     */
    public int getEstadosPedidosId() {
        return estadosPedidosId;
    }

    /**
     * @param estadosPedidosId the estadosPedidosId to set
     */
    public void setEstadosPedidosId(int estadosPedidosId) {
        this.estadosPedidosId = estadosPedidosId;
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

    /**
     * @return the productorId
     */
    public int getProductorId() {
        return productorId;
    }

    /**
     * @param productorId the productorId to set
     */
    public void setProductorId(int productorId) {
        this.productorId = productorId;
    }

    /**
     * @return the productosAsociadosUsuariosId
     */
    public int getProductosAsociadosUsuariosId() {
        return productosAsociadosUsuariosId;
    }

    /**
     * @param productosAsociadosUsuariosId the productosAsociadosUsuariosId to
     * set
     */
    public void setProductosAsociadosUsuariosId(int productosAsociadosUsuariosId) {
        this.productosAsociadosUsuariosId = productosAsociadosUsuariosId;
    }

    /**
     * @return the distribuidorId
     */
    public int getDistribuidorId() {
        return distribuidorId;
    }

    /**
     * @param distribuidorId the distribuidorId to set
     */
    public void setDistribuidorId(int distribuidorId) {
        this.distribuidorId = distribuidorId;
    }

    @Override
    public String toString() {
        return "PedidoDTO " + " pedidosId = " + pedidosId + ", cantidadSolicitada = " + cantidadSolicitada + ", fechaSolicitada = " + fechaSolicitada + ", estadosPedidosId = " + estadosPedidosId + ", productosId = " + productosId + ", productorId = " + productorId + ", productosAsociadosUsuariosId = " + productosAsociadosUsuariosId + ", distribuidorId = " + distribuidorId;
    }
}
