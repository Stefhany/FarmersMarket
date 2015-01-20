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
import utilidades.Conectar;

/**
 *
 * @author Sena
 */
public class UsuariosDAO {

    private Connection conexion = null;
    private PreparedStatement statement = null;
    String mensaje = " ";
    private int resultado = 0;
    ResultSet resultadoSet = null;

    public UsuariosDAO() {
        conexion = Conectar.getInstance();
    }

    public String ingresarRegistro(UsuariosDTO usuario) {

        try {
            statement = conexion.prepareStatement("INSERT INTO usuarios VALUES (null,?, ?, ?, ?, ?, ?, md5(?), ?, ?, ?)");
            statement.setString(1, usuario.getNombres());
            statement.setString(2, usuario.getApellidos());
            statement.setInt(3, usuario.getCedula());
            statement.setInt(4, usuario.getTelefono());
            statement.setString(5, usuario.getDireccion());
            statement.setString(6, usuario.getCorreo());
            statement.setString(7, usuario.getClave());
            statement.setBoolean(8, usuario.isNotificacion());
            statement.setString(9, usuario.getCiudad());
            statement.setString(10, usuario.getFechaNacimiento());
            mensaje = statement.toString();
            resultado = statement.executeUpdate();
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

    public String modificarUsuario(UsuariosDTO usuario) {
        try {

            statement = conexion.prepareStatement("UPDATE usuarios SET nombres=?, apellidos=?, cedula=?, telefono=?, direccion=?, correo=?, clave= md5(?), notificaciones=?, ciudad=?, fechaNacimiento=? FROM usuarios WHERE idUsuarios=?");
            statement.setString(1, usuario.getNombres());
            statement.setString(2, usuario.getApellidos());
            statement.setInt(3, usuario.getCedula());
            statement.setInt(4, usuario.getTelefono());
            statement.setString(5, usuario.getDireccion());
            statement.setString(6, usuario.getCorreo());
            statement.setString(7, usuario.getClave());
            statement.setBoolean(8, usuario.isNotificacion());
            statement.setString(9, usuario.getCiudad());
            statement.setString(10, usuario.getFechaNacimiento());

//el resulset trae el numero de rows afectadas
            resultado = statement.executeUpdate();
            if (resultado != 0) {

                System.out.println("El Campo Se a modificado:" + resultado + "saludes");

            } else {
                mensaje = "Error";
            }
        } catch (SQLException sqlexception) {
            System.out.println("Ocurrio Un Error" + sqlexception.getMessage());

        }

        return mensaje;

    }

    public String eliminarUSuario(UsuariosDTO usuario) {

        try {
            statement = conexion.prepareStatement("Delete from usuarios where idUsuarios=?;");
            //obtenemos el id del item a eliminar del dto
            statement.setInt(1, usuario.getIdUsuarios());
            resultado = statement.executeUpdate();

            if (resultado != 0) {
                System.out.println("El siguiente campo" + resultado + "se elimino Corretamente");
            } else {
                mensaje = "Ocurrio Un Error";
            }
        } catch (SQLException sqlexception) {
            System.out.println("Ocurrio un error" + sqlexception.getMessage());

        }

        return mensaje;
    }

    public ArrayList<UsuariosDTO> consultarRegistros() {
        ArrayList<UsuariosDTO> listaUsuarios = new ArrayList<UsuariosDTO>();
        try {

            statement = conexion.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, direccion, correo, clave, notificaciones, ciudad, fechaNacimiento FROM usuarios;");

            resultadoSet = statement.executeQuery();
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
            statement = conexion.prepareStatement("SELECT idUsuarios, nombres, apellidos, cedula, telefono, direccion, correo, clave, notificaciones,ciudad, fechanacimiento "
                    + "FROM usuarios WHERE idUsuarios = ?;");
            statement.setInt(1, id);
            resultadoSet = statement.executeQuery();

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
            statement = conexion.prepareStatement(querryValidation);
            statement.setString(1, correo);
            statement.setString(2, pass);
            resultadoSet = statement.executeQuery();

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

}
