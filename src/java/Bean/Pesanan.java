/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author indraep
 */
public class Pesanan {
    private int id;
    private String kodepesanan;
    private String date;
    private String time;
    private String username;
    private int totalbiaya;
    private String addition;
    
    public Pesanan() {}
    
    public Pesanan(int id, String kodepesanan, String date, String time, String username, int totalbiaya, String addition) {
        this.id = id;
        this.kodepesanan = kodepesanan;
        this.date = date;
        this.time = time;
        this.username = username;
        this.totalbiaya = totalbiaya;
        this.addition = addition;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }
    
    public int getTotalBiaya() {
        return totalbiaya;
    }
    
    public String getDate() {
        return date;
    }
    
    public String getUsername() {
        return username;
    }
}
