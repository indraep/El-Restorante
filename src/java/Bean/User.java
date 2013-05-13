/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    public User() {
    }

    public User(String nama, String username, String password, String alamat, String email, String birthDate, String bio) {
        this.nama = nama;
        this.username = username;
        this.password = password;
        this.alamat = alamat;
        this.email = email;
        this.birthDate = birthDate;
        this.bio = bio;
    }

    public User(String[] data) {
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

    public String getUsia() {
        String[] splited = getBirthDate().split("-");
        int tahun = Integer.parseInt(splited[0]);
        int bulan = Integer.parseInt(splited[1]);
        int tanggal = Integer.parseInt(splited[2]);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String[] splited2 = dateFormat.format(date).split("-");
        int tahun2 = Integer.parseInt(splited2[0]);
        int bulan2 = Integer.parseInt(splited2[1]);
        int tanggal2 = Integer.parseInt(splited2[2]);
        
        int selisih = tahun2 - tahun;
        
        if (bulan2 > bulan) selisih++;
        if (bulan2 == bulan && tanggal2 >= tanggal) selisih++;
        return "" + selisih;
    }
}
