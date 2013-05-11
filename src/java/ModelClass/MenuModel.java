/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelClass;

import Bean.Menu;
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
