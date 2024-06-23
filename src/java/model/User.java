/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NGHIA
 */
public class User {
     private int idUser;
    private String username;
    private String password;
    private boolean isAdmin;
    private int maKh;

    public User(int idUser, String username, String password, boolean isAdmin, int maKh) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.maKh = maKh;
    }

    // Các phương thức getter và setter
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getMaKh() {
        return maKh;
    }

    public void setMaKh(int maKh) {
        this.maKh = maKh;
    }
    
}
