/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author Mona
 */
public class RolesUsuariosDTO {
    private int rolesId = 0;
    private int usuariosId = 0;

    /**
     * @return the rolesId
     */
    public int getRolesId() {
        return rolesId;
    }

    /**
     * @param rolesId the rolesId to set
     */
    public void setRolesId(int rolesId) {
        this.rolesId = rolesId;
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
        return "RolesUsuariosDTO " + "rolesId=" + rolesId
                + ", usuariosId=" + usuariosId;
    }
    
    
}
