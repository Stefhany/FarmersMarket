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
import utilidades.Conectar;

/**
 *
 * @author Sena
 */
public class UsuariosDAO {

    private Connection cnn = null;
    private PreparedStatement pstmt = null;
    String mensaje = " ";
    private int resultado = 0;
    ResultSet resultadoSet = null;

    public UsuariosDAO() {
        cnn = Conectar.getInstance();
    }

    public String ingresarRegistro(UsuariosDTO usuario) {

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
            mensaje = pstmt.toString();
            resultado = pstmt.executeUpdate();
            if (resultado != 0) {
                mensaje = "Se han modificado " + resultado + " registro satisfatoriamente ";
            } else {
                mensaje = "ha ocirrido in error en la creacion ";
            }
        } catch (SQLException sd) {
            mensaje = " ocurrido un error en " + sd.getMessage();
        }
        return mensaje;
    }

    public String modificarUsuario(UsuariosDTO usuario) throws MyException {
        String sal = " ";
        int res = 0;
        try {
            String queryUpDateUser = " UPDATE usuarios SET nombres=?, apellidos=?, cedula=?, telefono=?, "
                    + " direccion=?, correo=?, clave= md5(?), notificaciones=?, "
                    + " ciudad=?, fechaNacimiento=? WHERE idUsuarios=?;";
            pstmt = cnn.prepareStatement(queryUpDateUser);
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
            res = pstmt.executeUpdate();

            if (res != 0) {
                sal = "El campo se ha modificado: " + resultado + " satisfactoriamente.";
            } else {
                sal = "Error";
            }
        } catch (SQLException sqle) {
            throw new MyException("Lo siento, ocurrio lo siguiente: " + sqle.getSQLState() + " y " + sqle.getMessage());
        }
        return sal;
    }

    public String eliminarUsuario(int id) {

        try {
            pstmt = cnn.prepareStatement("delete from usuarios where idUsuarios=?;");
            pstmt.setInt(1, id);
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
                mensaje = "El siguiente campo" + resultado + "se elimino Corretamente";
            } else {
                mensaje = "Ocurrio Un Error";
            }
        } catch (SQLException sqlexception) {
            mensaje = "Ocurrio un error" + sqlexception.getMessage();

        }

        return mensaje;
    }

    public ArrayList<UsuariosDTO> consultarRegistros() {
        ArrayList<UsuariosDTO> listaUsuarios = new ArrayList<UsuariosDTO>();
        try {

            pstmt = cnn.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, direccion, correo, clave, notificaciones, ciudad, fechaNacimiento FROM usuarios;");

            resultadoSet = pstmt.executeQuery();
            if (resultadoSet != null) {
                while (resultadoSet.next()) {
                    UsuariosDTO user = new UsuariosDTO();
                    user.setIdUsuarios(resultadoSet.getInt("idUsuarios"));
                    user.setNombres(resultadoSet.getString("nombres"));
                    user.setApellidos(resultadoSet.getString("apellidos"));
                    user.setCedula(resultadoSet.getInt("cedula"));
                    user.setTelefono(resultadoSet.getInt("telefono"));
                    user.setDireccion(resultadoSet.getString("direccion"));
                    user.setCorreo(resultadoSet.getString("correo"));
                    user.setClave(resultadoSet.getString("clave"));
                    user.setNotificacion(resultadoSet.getBoolean("notificaciones"));
                    user.setCiudad(resultadoSet.getString("ciudad"));
                    user.setFechaNacimiento(resultadoSet.getString("fechaNacimiento"));
                    listaUsuarios.add(user);
                }
            }
        } catch (SQLException sqle) {
            System.out.println("Se ha producido la sig excepción: " + sqle.getMessage());

        }
        return listaUsuarios;
    }

    public UsuariosDTO consultarUnRegistro(int id) {
        UsuariosDTO user = new UsuariosDTO();
        try {
            pstmt = cnn.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, direccion, correo, clave, notificaciones,ciudad, fechanacimiento "
                    + "FROM usuarios WHERE idUsuarios = ?;");
            pstmt.setInt(1, id);
            resultadoSet = pstmt.executeQuery();

            if (resultadoSet != null) {
                while (resultadoSet.next()) {
                    user.setIdUsuarios(resultadoSet.getInt("idUsuarios"));
                    user.setNombres(resultadoSet.getString("nombres"));
                    user.setApellidos(resultadoSet.getString("apellidos"));
                    user.setCedula(resultadoSet.getInt("cedula"));
                    user.setTelefono(resultadoSet.getInt("telefono"));
                    user.setDireccion(resultadoSet.getString("direccion"));
                    user.setCorreo(resultadoSet.getString("correo"));
                    user.setClave(resultadoSet.getString("clave"));
                    user.setNotificacion(resultadoSet.getBoolean("notificaciones"));
                    user.setCiudad(resultadoSet.getString("ciudad"));
                    user.setFechaNacimiento(resultadoSet.getString("Fechanacimiento"));

                }
            }
        } catch (SQLException sqle) {
            System.out.println("eyy " + sqle.getMessage());
        }
        return user;
    }

    public UsuariosDTO validarUsuario(String correo, String pass) {
        UsuariosDTO udto = new UsuariosDTO();
        try {
            String querryValidation = " select idUsuarios as id, nombres, apellidos, cedula, telefono, "
                    + " direccion, correo, clave, notificaciones, ciudad, fechaNacimiento "
                    + " from usuarios where correo =? and clave=md5(?) ";
            pstmt = cnn.prepareStatement(querryValidation);
            pstmt.setString(1, correo);
            pstmt.setString(2, pass);
            resultadoSet = pstmt.executeQuery();

            if (resultadoSet != null) {
                while (resultadoSet.next()) {
                    udto.setIdUsuarios(resultadoSet.getInt("id"));
                    udto.setNombres(resultadoSet.getString("nombres"));
                    udto.setApellidos(resultadoSet.getString("apellidos"));
                    udto.setCedula(resultadoSet.getInt("cedula"));
                    udto.setTelefono(resultadoSet.getInt("telefono"));
                    udto.setDireccion(resultadoSet.getString("direccion"));
                    udto.setCorreo(resultadoSet.getString("correo"));
                    udto.setClave(resultadoSet.getString("clave"));
                    udto.setNotificacion(resultadoSet.getBoolean("notificaciones"));
                    udto.setCiudad(resultadoSet.getString("ciudad"));
                    udto.setFechaNacimiento(resultadoSet.getString("fechaNacimiento"));
                }
            } else {
                udto = null;
            }

        } catch (SQLException ex) {
            System.out.println("Datos errones.. !!reviselos!!" + ex.getSQLState() + " - " + ex.getMessage());
        }
        return udto;
    }

    public ArrayList<UsuariosDTO> mostrarPrueba() {
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        try {
            String querryPrueba = ("SELECT nombres, apellidos, cedula, telefono FROM usuarios;");
            pstmt = cnn.prepareStatement(querryPrueba);
            resultadoSet = pstmt.executeQuery();
            if (resultadoSet != null) {
                while (resultadoSet.next()) {
                    UsuariosDTO user = new UsuariosDTO();
                    user.setNombres(resultadoSet.getString("nombres"));
                    user.setApellidos(resultadoSet.getString("apellidos"));
                    user.setCedula(resultadoSet.getInt("cedula"));
                    user.setTelefono(resultadoSet.getInt("telefono"));
                    usuarios.add(user);
                }
            }
        } catch (SQLException sqle) {
            System.out.println("Ha ocurrido esto ! " + sqle.getMessage());
        }
        return usuarios;
    }

    public HashMap<UsuariosDTO, String> validarUsuarioV2(String correo, String pss) {
        String menu = "<ul>";
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
                    user.setIdUsuarios(resultadoSet.getInt("idUsuarios"));
                    user.setNombres(resultadoSet.getString("nombres"));
                    user.setApellidos(resultadoSet.getString("apellidos"));
                    user.setCedula(resultadoSet.getInt("cedula"));
                    user.setTelefono(resultadoSet.getInt("telefono"));
                    user.setDireccion(resultadoSet.getString("direccion"));
                    user.setCorreo(resultadoSet.getString("correo"));
                    user.setClave(resultadoSet.getString("clave"));
                    user.setNotificacion(resultadoSet.getBoolean("notificaciones"));
                    user.setCiudad(resultadoSet.getString("ciudad"));
                    user.setFechaNacimiento(resultadoSet.getString("Fechanacimiento"));
                    menu += "<li>";
                    // menu+="<a href='"+rs.getString("url")+"'>"+rs.getString("descripcion")+"</a>";
                    menu += rs.getString("nombre");
                    ResultSet rsSub = cnn.prepareStatement(" SELECT p.idPermisos, p.nombre, p.url "
                            + " FROM permisos p INNER JOIN permisosroles pr ON p.idPermisos = pr.permisosId "
                            + " WHERE padre = " + rs.getInt("idPermisos")
                            + " AND ru.rolesId = " + rs.getInt("idRoles")).executeQuery();

                    menu += "<ul>";
                    while (rsSub.next()) {
                        menu += "<li>";
                        menu += "<a href='" + rsSub.getString("url") + "'>" + rsSub.getString("p.`nombre`") + "</a>";
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
