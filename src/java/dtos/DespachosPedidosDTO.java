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
public class DespachosPedidosDTO {
    
    private int idDespachos = 0;
    private String direccionDespacho = " ";
    private Date fechaDespacho;
    private String observaciones = " ";
    private int pedidosId = 0;
    private int usuariosId = 0;

    /**
     * @return the idDespachos
     */
    public int getIdDespachos() {
        return idDespachos;
    }

    /**
     * @param idDespachos the idDespachos to set
     */
    public void setIdDespachos(int idDespachos) {
        this.idDespachos = idDespachos;
    }

    /**
     * @return the direccionDespacho
     */
    public String getDireccionDespacho() {
        return direccionDespacho;
    }

    /**
     * @param direccionDespacho the direccionDespacho to set
     */
    public void setDireccionDespacho(String direccionDespacho) {
        this.direccionDespacho = direccionDespacho;
    }

    /**
     * @return the fechaDespacho
     */
    public Date getFechaDespacho() {
        return fechaDespacho;
    }

    /**
     * @param fechaDespacho the fechaDespacho to set
     */
    public void setFechaDespacho(Date fechaDespacho) {
        this.fechaDespacho = fechaDespacho;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

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
    
    @Override
    public String toString() {
        return "DespachosPedidosDTO " + "idDespachos = " + idDespachos + ", direccionDespacho = " + direccionDespacho + ", fechaDespacho = " + fechaDespacho + ", observaciones = "  + observaciones + ", pedidosId = " + pedidosId + ", usuariosId = " + usuariosId;
    }

}
