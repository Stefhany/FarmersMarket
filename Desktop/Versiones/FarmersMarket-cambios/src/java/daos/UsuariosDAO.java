/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import Conexion.Conection;
import utilidades.MyException;

/**
 *
 * @author Sena
 */
public class UsuariosDAO {

    private Connection cnn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    public String ingresarRegistro(UsuariosDTO usuario, Connection cnn) {
        this.cnn = cnn;
        int rtdo = 0;
        String msgSalida = "";
        try {
            pstmt = cnn.prepareStatement("INSERT INTO usuarios VALUES (null,?, ?, ?, ?, ?, ?, md5(?), ?, ?, ?)");
            pstmt.setString(1, usuario.getNombres());
            pstmt.setString(2, usuario.getApellidos());
            pstmt.setInt(3, usuario.getCedula());
            pstmt.setInt(4, usuario.getTelefono());
            pstmt.setString(5, usuario.getDireccion());
            pstmt.setString(6, usuario.getCorreo());
            pstmt.setString(7, usuario.getClave());
            pstmt.setBoolean(8, usuario.isNotificacion());
            pstmt.setString(9, usuario.getCiudad());
            pstmt.setString(10, usuario.getFechaNacimiento());
            //mensaje = pstmt.toString();
            rtdo = pstmt.executeUpdate();
            if (rtdo != 0) {
                msgSalida = "Se han modificado " + rtdo + " registro satisfatoriamente ";
            } else {
                msgSalida = "ha ocirrido in error en la creacion ";
            }
        } catch (SQLException sd) {
            msgSalida = " ocurrido un error en " + sd.getMessage();
        }
        return msgSalida;
    }

    public String modificarUsuario(UsuariosDTO usuario, Connection cnn) throws MyException {
        this.cnn = cnn;
        String sal = "";
        int res = 0;
        try {
            String queryUpDateUser = " UPDATE usuarios SET telefono=?, "
                    + " direccion=?, correo=?, "
                    + " ciudad=? WHERE idUsuarios=?;";
            pstmt = cnn.prepareStatement(queryUpDateUser);
            pstmt.setInt(1, usuario.getTelefono());
            pstmt.setString(2, usuario.getDireccion());
            pstmt.setString(3, usuario.getCorreo());
            pstmt.setString(4, usuario.getCiudad());
            pstmt.setInt(5, usuario.getIdUsuarios());
            res = pstmt.executeUpdate();

            if (res != 0) {
                sal = "El campo se ha modificado: " + res + " satisfactoriamente.";
            } else {
                sal = "Error";
            }
        } catch (SQLException sqle) {
            throw new MyException("Lo siento, ocurrio lo siguiente: " + sqle.getSQLState() + " y " + sqle.getMessage());
        }
        return sal;
    }

    public String eliminarUsuario(int id, Connection cnn) {
        this.cnn = cnn;
        int rtdo = 0;
        String msgSalida = "";
        try {
            pstmt = cnn.prepareStatement("delete from usuarios where idUsuarios=?;");
            pstmt.setInt(1, id);
            rtdo = pstmt.executeUpdate();

            if (rtdo != 0) {
                msgSalida = "El siguiente campo" + rtdo + "se elimino Corretamente";
            } else {
                msgSalida = "Ocurrio Un Error";
            }
        } catch (SQLException sqlexception) {
            msgSalida = "Ocurrio un error" + sqlexception.getMessage();
        }
        return msgSalida;
    }

    public ArrayList<UsuariosDTO> consultarRegistros(Connection cnn) {
        this.cnn = cnn;
        ArrayList<UsuariosDTO> listaUsuarios = new ArrayList<UsuariosDTO>();
        try {
            pstmt = cnn.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, direccion, "
                    + " correo, clave, notificaciones, ciudad, fechaNacimiento FROM usuarios;");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO();
                    user.setIdUsuarios(rs.getInt("idUsuarios"));
                    user.setNombres(rs.getString("nombres"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setCedula(rs.getInt("cedula"));
                    user.setTelefono(rs.getInt("telefono"));
                    user.setDireccion(rs.getString("direccion"));
                    user.setCorreo(rs.getString("correo"));
                    user.setClave(rs.getString("clave"));
                    user.setNotificacion(rs.getBoolean("notificaciones"));
                    user.setCiudad(rs.getString("ciudad"));
                    user.setFechaNacimiento(rs.getString("fechaNacimiento"));
                    listaUsuarios.add(user);
                }
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido la sig excepción: " + sqle.getMessage());
        }
        return listaUsuarios;
    }

    public UsuariosDTO consultarUnRegistro(int id, Connection cnn) {
        this.cnn = cnn;
        UsuariosDTO user = new UsuariosDTO();
        try {
            pstmt = cnn.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, "
                    + " direccion, correo, clave, notificaciones,ciudad, fechanacimiento "
                    + " FROM usuarios WHERE idUsuarios = ?;");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    user.setIdUsuarios(rs.getInt("idUsuarios"));
                    user.setNombres(rs.getString("nombres"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setCedula(rs.getInt("cedula"));
                    user.setTelefono(rs.getInt("telefono"));
                    user.setDireccion(rs.getString("direccion"));
                    user.setCorreo(rs.getString("correo"));
                    user.setClave(rs.getString("clave"));
                    user.setNotificacion(rs.getBoolean("notificaciones"));
                    user.setCiudad(rs.getString("ciudad"));
                    user.setFechaNacimiento(rs.getString("Fechanacimiento"));
                }
            }
        } catch (SQLException sqle) {
            System.out.println("eyy " + sqle.getMessage());
        }
        return user;
    }

    public UsuariosDTO validarUsuario(String correo, String pass, Connection cnn) {
        this.cnn = cnn;
        UsuariosDTO udto = new UsuariosDTO();
        try {
            String querryValidation = " select idUsuarios as id, nombres, apellidos, cedula, telefono, "
                    + " direccion, correo, clave, notificaciones, ciudad, fechaNacimiento "
                    + " from usuarios where correo =? and clave=md5(?) ";
            pstmt = cnn.prepareStatement(querryValidation);
            pstmt.setString(1, correo);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    udto.setIdUsuarios(rs.getInt("id"));
                    udto.setNombres(rs.getString("nombres"));
                    udto.setApellidos(rs.getString("apellidos"));
                    udto.setCedula(rs.getInt("cedula"));
                    udto.setTelefono(rs.getInt("telefono"));
                    udto.setDireccion(rs.getString("direccion"));
                    udto.setCorreo(rs.getString("correo"));
                    udto.setClave(rs.getString("clave"));
                    udto.setNotificacion(rs.getBoolean("notificaciones"));
                    udto.setCiudad(rs.getString("ciudad"));
                    udto.setFechaNacimiento(rs.getString("fechaNacimiento"));
                }
            } else {
                udto = null;
            }
        } catch (SQLException ex) {
            System.out.println("Datos errones.. !!reviselos!!" + ex.getSQLState() + " - " + ex.getMessage());
        }
        return udto;
    }

    public ArrayList<UsuariosDTO> mostrarPrueba(Connection cnn) {
        this.cnn = cnn;
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        try {
            String querryPrueba = ("SELECT nombres, apellidos, cedula, telefono FROM usuarios;");
            pstmt = cnn.prepareStatement(querryPrueba);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO user = new UsuariosDTO();
                    user.setNombres(rs.getString("nombres"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setCedula(rs.getInt("cedula"));
                    user.setTelefono(rs.getInt("telefono"));
                    usuarios.add(user);
                }
            }
        } catch (SQLException sqle) {
            System.out.println("Ha ocurrido esto ! " + sqle.getMessage());
        }
        return usuarios;
    }

    public HashMap<UsuariosDTO, String> validarUsuarioV2(String correo, String pss, Connection cnn) {
        this.cnn = cnn;
        String menu = "<ul >";
        HashMap<UsuariosDTO, String> usuarioValidado = new HashMap<UsuariosDTO, String>();
        UsuariosDTO user = new UsuariosDTO();
        ResultSet rs = null;
        try {
            pstmt = cnn.prepareStatement(" SELECT u.idUsuarios, u.nombres,u.apellidos, u.cedula, u.telefono, "
                    + " u.direccion, u.correo, u.clave, u.notificaciones, u.ciudad, u.fechaNacimiento, "
                    + " r.idRoles, p.nombre, p.url, p.idPermisos "
                    + " FROM usuarios u "
                    + " INNER JOIN rolesusuarios ru on u.idUsuarios = ru.usuariosId "
                    + " INNER JOIN roles r on ru.rolesId = r.idRoles "
                    + " INNER JOIN permisosroles pr on r.idRoles = pr.rolesId "
                    + " INNER JOIN permisos p on pr.permisosId = p.idPermisos "
                    + " WHERE u.correo = ? "
                    + " AND u.clave = MD5(?)"
                    + " AND p.padre = 0;");

            pstmt.setString(1, correo);
            pstmt.setString(2, pss);

            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    user.setIdUsuarios(rs.getInt("idUsuarios"));
                    user.setNombres(rs.getString("nombres"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setCedula(rs.getInt("cedula"));
                    user.setTelefono(rs.getInt("telefono"));
                    user.setDireccion(rs.getString("direccion"));
                    user.setCorreo(rs.getString("correo"));
                    user.setClave(rs.getString("clave"));
                    user.setNotificacion(rs.getBoolean("notificaciones"));
                    user.setCiudad(rs.getString("ciudad"));
                    user.setFechaNacimiento(rs.getString("Fechanacimiento"));
                    menu += "<li>";
                    // menu+="<a href='"+rs.getString("url")+"'>"+rs.getString("descripcion")+"</a>";
                    menu += rs.getString("nombre");
                    ResultSet rsSub = cnn.prepareStatement(" SELECT p.idPermisos, p.nombre, p.url "
                            + " FROM permisos p INNER JOIN permisosroles pr ON p.idPermisos = pr.permisosId "
                            + " WHERE padre = " + rs.getInt("idPermisos")
                            + " AND pr.rolesId = " + rs.getInt("idRoles")).executeQuery();

                    menu += "<ul class=\"panel-body\">";
                    while (rsSub.next()) {
                        menu += "<li>";
                        menu += "<a href='" + rsSub.getString("url") + "'>" + rsSub.getString("p.nombre") + "</a>";
                        menu += "</li>";
                    }

                    menu += "</ul>";
                    menu += "</li>";

                }
                menu += "</ul>";
            } else {
                menu = "";
            }
        } catch (SQLException sqle) {

            menu = " error " + sqle.getMessage();

        } finally {
        }
        usuarioValidado.put(user, menu);

        return usuarioValidado;
    }
}
