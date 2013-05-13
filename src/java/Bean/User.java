/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author indraep
 */
public class User {
    private String nama;
    private String username;
    private String password;
    private String alamat;
    private String email;
    private String birthDate;
    private String bio;
    
    public User() {}
    public User(String nama, String username, String password, String alamat, String email, String birthDate, String bio) {
        this.nama = nama;
        this.username = username;
        this.password = password;
        this.alamat = alamat;
        this.email = email;
        this.birthDate = birthDate;
        this.bio = bio;
    }
    
    public User(String[] data ) {
        this.nama = data[0];
        this.username = data[1];
        this.password = data[2];
        this.alamat = data[3];
        this.email = data[4];
        this.birthDate = data[5];
        this.bio = data[6];
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public String getNama() {
        return nama;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }
    
    public String getAlamat() {
        return alamat;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
    
    public String getBirthDate() {
        return birthDate;
    }
    
    public void setBio(String bio) {
        this.bio = bio;
    }
    
    public String getBio() {
        return bio;
    }
}
