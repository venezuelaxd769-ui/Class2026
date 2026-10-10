/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;

/**
 *
 * @author cymaniatico
 */
public class Usuarios {
    
    private String user;
    private String pass;
    private int idRole;

    public Usuarios(String user, String pass, int idRole) {
        this.user = user;
        this.pass = pass;
        this.idRole = idRole;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }

    public int getIdRole() {
        return idRole;
    }
    
    
    
}
