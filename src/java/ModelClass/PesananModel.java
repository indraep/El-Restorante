/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelClass;

import Bean.Pesanan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author indraep
 */
public class PesananModel {
    private Statement statement;
    
    public String buatPesanan(String username, String totalBiaya, String pesanan, String addition) throws Exception {
        connectToDB();
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String curTime = dateFormat.format(date);
        String sdate = curTime.split(" ")[0];
        String stime = curTime.split(" ")[1];
        
        String query = "insert into order_list(date, time, username, total_biaya, addition) values ('" + sdate + "', '" + stime + "', '" + username + "', '" + totalBiaya + "', '" + addition + "')";
        statement.executeUpdate(query);
        
        query = "select max(id) from order_list";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        String id = "";
        while (resultSet.next()) {
            id = resultSet.getObject(1).toString();
        }
        
        query = "UPDATE order_list SET kode_pesanan=md5('" + id + "') WHERE id='" + id + "'";
        statement.executeUpdate(query);
        
        String kodePesanan = "";
        query = "select kode_pesanan from order_list where id = '" + id + "'";
        resultSet = statement.executeQuery(query);
        metaData = resultSet.getMetaData();
        while (resultSet.next()) {
            kodePesanan = resultSet.getObject(1).toString();
        }
        
        String[] temp = pesanan.split("-");
        String orderDetail = "";
        for (int i = 0; i < temp.length; i++) {
            String[] t = (temp[i].substring(1, temp[i].length() - 1)).split(",");
            if (orderDetail.length() > 0) orderDetail += ",";

            orderDetail += "('" + id + "', '" + t[0] + "', '" + (i + 1) + "', '" + t[3] + "')";   
        }
        
        query = "insert into order_detail(id_order, id_menu, no, quantity) values " + orderDetail;
        System.out.println(query);
        statement.executeUpdate(query);
        
        return kodePesanan;
    }
    
    public ArrayList<Pesanan> history(String username, String param) throws Exception {
        connectToDB();
        
        String query = "SELECT * FROM `order_list` WHERE username='" + username+"' ORDER BY " + param;
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        ArrayList<Pesanan> ret = new ArrayList<Pesanan>();
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            String kode = resultSet.getObject(2).toString();
            String date = resultSet.getObject(3).toString();
            String time = resultSet.getObject(4).toString();
            int total = Integer.parseInt(resultSet.getObject(6).toString());
            String add = "";
            if (resultSet.getObject(7) != null)
                add = resultSet.getObject(7).toString();
            ret.add(new Pesanan(id, kode, date, time, username, total, add));
        }
        return ret;
    }
    
    public ArrayList<Pesanan> cari(String param) throws Exception {
        connectToDB();
        String query = "SELECT * FROM `order_list` ORDER BY " + param;
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        ArrayList<Pesanan> ret = new ArrayList<Pesanan>();
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            String kode = resultSet.getObject(2).toString();
            String date = resultSet.getObject(3).toString();
            String time = resultSet.getObject(4).toString();
            String username = resultSet.getObject(5).toString();
            int total = Integer.parseInt(resultSet.getObject(6).toString());
            String add = "";
            if (resultSet.getObject(7) != null)
                add = resultSet.getObject(7).toString();
            ret.add(new Pesanan(id, kode, date, time, username, total, add));
        }
        return ret;
    }
    
    private void connectToDB() throws Exception {
        if (statement != null) {
            return;
        }

        Class.forName("com.mysql.jdbc.Driver");
        String userName = "root";
        String password = "";
        String url = "jdbc:mysql://localhost/el restorante";
        Connection connection = DriverManager.getConnection(url, userName, password);
        statement = connection.createStatement();
    }
}
