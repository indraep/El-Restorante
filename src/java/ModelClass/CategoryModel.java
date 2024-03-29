/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelClass;

import Bean.Category;
import Bean.Menu;
import Bean.Utilities;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author indraep
 */
public class CategoryModel {

    private Statement statement;
    
    public String getCategoryName(int id) throws Exception {
        connectToDB();
        
        String query = "select name from category where id = '" + id + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        String ret = "";
        while (resultSet.next()) {
            ret = resultSet.getObject(1).toString();
        }
        
        return ret;
    }
    
    public ArrayList<Menu> getMenuByCategory(int catId, int page) throws Exception  {
        connectToDB();
        
        int limit = 9;
        int offset = limit * (page - 1);
        
        String query = "select * from menu where category_id = '" + catId + "' limit " + (limit + 1) + " offset " + offset ;
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        ArrayList<Menu> ret = new ArrayList<Menu>();
        
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            int categoryId = Integer.parseInt(resultSet.getObject(2).toString());
            String name = resultSet.getObject(3).toString();
            String description = resultSet.getObject(4).toString();
            int price = Integer.parseInt(resultSet.getObject(5).toString());
            
            ret.add(new Menu(id, categoryId, name, description, price));
        }
            
        return ret;
    }

    public ArrayList<Category> getCategory() throws Exception {
        connectToDB();

        String query = "select * from category";
        
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        ArrayList<Category> ret = new ArrayList<Category>();
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            String name = resultSet.getObject(2).toString();
            ret.add(new Category(id, name));
        }
        
        return ret;
    }

    public ArrayList<Menu> getMenuByName(String catId, int page) throws Exception  {
        connectToDB();
        
        int limit = 9;
        int offset = limit * (page - 1);
        
        String query = "select * from menu where name like '%" + catId + "%' limit " + (limit + 1) + " offset " + offset ;
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        ArrayList<Menu> ret = new ArrayList<Menu>();
        
        while (resultSet.next()) {
            int id = Integer.parseInt(resultSet.getObject(1).toString());
            int categoryId = Integer.parseInt(resultSet.getObject(2).toString());
            String name = resultSet.getObject(3).toString();
            String description = resultSet.getObject(4).toString();
            int price = Integer.parseInt(resultSet.getObject(5).toString());
            
            ret.add(new Menu(id, categoryId, name, description, price));
        }
            
        return ret;
    }
    
    public boolean addKategori(String nama) throws Exception  {
        connectToDB();
        String query = "INSERT INTO `category`(`name`) VALUES ('" + nama + "')";
        int ans = statement.executeUpdate(query);
        
        return ans > 0;
    }
    
    public boolean deleteKategori(int id) throws Exception  {
        connectToDB();
        String query = "DELETE FROM `category` WHERE id =" + id;
        int ans = statement.executeUpdate(query);
        return ans > 0;
    }
    
    public boolean updateKategori(int id, String nama) throws Exception  {
        connectToDB();
        String query = "UPDATE `category` SET `name`='" + nama + "'  WHERE id=" + id;
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
