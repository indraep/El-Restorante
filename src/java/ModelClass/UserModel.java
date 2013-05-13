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
import org.apache.catalina.connector.Request;

/**
 *
 * @author indraep
 */
public class UserModel {
    private Statement statement;

    public User login(String uname, String pass) throws Exception{
        connectToDB();
        
        String query = "select * from user where username = '" + uname + "' AND password = md5('" + pass + "')";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        User ret = null;
        while (resultSet.next()) {
            String nama = resultSet.getObject(1).toString();
            String username = uname;
            String password = resultSet.getObject(2).toString();
            String alamat= resultSet.getObject(4).toString();
            String email = resultSet.getObject(5).toString();
            String birthDate = "";
            String bio = "";
            ret = new User(nama, username, password, alamat, email, birthDate, bio);
        }
        
        return ret;
    }
    
    public User getUserByUsername(String uname) throws Exception {
        connectToDB();
        
        String query = "select * from user where username = '" + uname + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();
        
        User ret = null;
        while (resultSet.next()) {
            String nama = resultSet.getObject(1).toString();
            String username = uname;
            String password = resultSet.getObject(2).toString();
            String alamat= resultSet.getObject(4).toString();
            String email = resultSet.getObject(5).toString();
            String birthDate = "";
            String bio = "";
            ret = new User(nama, username, password, alamat, email, birthDate, bio);
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
