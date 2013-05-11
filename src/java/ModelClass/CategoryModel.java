package ModelClass;

import Bean.Menu;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author indraep
 */
public class CategoryModel {

    private Statement statement;
    
    public ArrayList<Menu> getMenuByCategory(int categoryId) throws Exception {
        connectToDB();
        
        String query = "select * from menu where category_id = '" + categoryId + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        ArrayList<Menu> ret = new ArrayList<Menu>();
        
        while (resultSet.next()) {
            ret.add(new Menu(Integer.parseInt((String)resultSet.getObject(1)), Integer.parseInt((String)resultSet.getObject(2)), 
                    (String)resultSet.getObject(3), (String)resultSet.getObject(4), Integer.parseInt((String)resultSet.getObject(5))));
        }
        
        return ret;
    }

    public ArrayList<String> getCategory() throws Exception {
        connectToDB();

        String query = "select name from category";
        
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        ArrayList<String> ret = new ArrayList<String>();
        while (resultSet.next()) {
            ret.add((String)resultSet.getObject(1) + "<br />");
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
