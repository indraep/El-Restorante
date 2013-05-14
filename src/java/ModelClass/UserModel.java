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

    public User login(String uname, String pass, int role) throws Exception {
        connectToDB();

        String query = "select * from user where username = '" + uname + "' AND password = md5('" + pass + "') AND role = " + role;
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();

        User ret = null;
        while (resultSet.next()) {
            String nama = resultSet.getObject(1).toString();
            String username = uname;
            String password = resultSet.getObject(3).toString();
            String alamat = resultSet.getObject(4).toString();
            String email = resultSet.getObject(5).toString();
            String birthDate = resultSet.getObject(6).toString();
            String bio = resultSet.getObject(7).toString();
            ret = new User(nama, username, password, alamat, email, birthDate, bio);
        }

        return ret;
    }

    public boolean register(String nama, String username, String password, String email, String alamat, String birth, String status) throws Exception {
        connectToDB();
        String query = "select * from user where username = '" + username + "'";
        ResultSet resultSet = statement.executeQuery(query);
        ResultSetMetaData metaData = resultSet.getMetaData();

        while (resultSet.next()) {
            return false;
        }
        String que = "INSERT INTO `user`(`nama`, `username`, `password`, `alamat`, `email`, `birth_date`, `bio`) VALUES ('" + nama + "','" + username + "',md5('" + password + "'),'" + alamat + "','" + email + "','" + birth + "','" + status + "')";
        
        int res = statement.executeUpdate(que);
        return true;
    }
    
    @SuppressWarnings("empty-statement")
     public boolean update(String nama, String username, String password, String email, String alamat, String birth, String status, int ubah) throws Exception {
        connectToDB();
       
        String que = "";
        if (ubah == 0)
            que = "UPDATE `user` set `nama`= '" + nama + "',`username`='" + username + "',`alamat`='" + alamat + "',`email`='" + email + "',`birth_date`='" + birth + "',`bio`='" + status + "' where username='"+ username + "'";
        else 
            que = "UPDATE `user` set `nama`= '" + nama + "',`username`='" + username + "',`password`=md5('"+password+"'), `alamat`='" + alamat + "',`email`='" + email + "',`birth_date`='" + birth + "',`bio`='" + status + "' where username='"+ username + "'";
        
        int res = statement.executeUpdate(que);
        
        return res > 0;
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
            String password = resultSet.getObject(3).toString();
            String alamat = resultSet.getObject(4).toString();
            String email = resultSet.getObject(5).toString();
            String birthDate = resultSet.getObject(6).toString();
            String bio = resultSet.getObject(7).toString();
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
