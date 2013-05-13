/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelClass;

import Bean.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author indraep
 */
public class UserModel {
    private Statement statement;
    
    public User getUserByUsername(String uname) throws SQLException {
        String query = "select * from user where username = '" + uname + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        User ret = null;
        while (resultSet.next()) {
            String[] data = new String[metaData.getColumnCount()];
            for (int i = 1; i <= data.length; i++)
                data[i - 1] = resultSet.getObject(i).toString();
            ret = new User(data);
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
