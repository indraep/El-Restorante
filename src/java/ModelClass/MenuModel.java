/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelClass;

import Bean.Menu;
import Bean.Utilities;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

/**
 *
 * @author indraep
 */
public class MenuModel {
    private Statement statement;
    
    public void setImageName(String imageName, String id) throws Exception {
        connectToDB();
        
        String query = "update menu set image='" + imageName + "' where id = '" + id + "'";
        statement.executeUpdate(query);
    }
    
    public String getImageName(String id) throws Exception {
        connectToDB();
        
        String query = "select image from menu where id = '" + id + "'";
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            return resultSet.getObject(1).toString();
        }
        return "";
    }
    
    public Menu getMenuById(int idMenu) throws Exception {
        connectToDB();
        
        String query = "select * from menu where id = '" + idMenu + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        Menu ret = null;
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            int categoryId = Integer.parseInt(resultSet.getObject(2).toString());
            String name = resultSet.getObject(3).toString();
            String description = resultSet.getObject(4).toString();
            int price = Integer.parseInt(resultSet.getObject(5).toString());
            ret = new Menu(id, categoryId, name, description, price);
        }
        return ret;
    }
    
    public boolean addMenu(String kategori, String nama, String harga, String deskripsi, String image) throws Exception {
        connectToDB();
        String query = "INSERT INTO `menu`(`category_id`, `name`, `description`, `price`, `image`) VALUES ('" + kategori + "','" + nama + "','" + deskripsi + "','" + harga + "', '" + image + "')";
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    public boolean addMenu(String kategori, String nama, String harga, String deskripsi) throws Exception {
        connectToDB();
        String query = "INSERT INTO `menu`(`category_id`, `name`, `description`, `price`) VALUES ('" + kategori + "','" + nama + "','" + deskripsi + "','" + harga + "')";
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    public boolean updateMenu(String kategori, String nama, String harga, String deskripsi, int id) throws Exception {
        connectToDB();
        
        String query = "UPDATE `menu` SET `category_id`='" + kategori + "',`name`= '" + nama + "',`description`='" + deskripsi + "',`price`=" + harga + " WHERE id = " + id;
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    public boolean updateMenu(String kategori, String nama, String harga, String deskripsi, int id, String image) throws Exception {
        connectToDB();
        
        String query = "UPDATE `menu` SET `category_id`='" + kategori + "',`name`= '" + nama + "',`description`='" + deskripsi + "',`price`=" + harga + ", image='" + image + "' WHERE id = " + id;
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    public boolean deleteMenu(String id) throws Exception {
        connectToDB();
        String query = "DELETE FROM `menu` WHERE id=" + id;
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    private void connectToDB() throws Exception {
        if (statement != null) {
            return;
        }

        Class.forName("com.mysql.jdbc.Driver");
        String userName = Utilities.username;
        String password = Utilities.password;
        String url = Utilities.url;
        Connection connection = DriverManager.getConnection(url, userName, password);
        statement = connection.createStatement();
    }
}
