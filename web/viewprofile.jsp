<%-- 
    Document   : editprofile
    Created on : 13-May-2013, 10:45:56
    Author     : cLienT
--%>

<%@page import="ModelClass.UserModel"%>
<%@page import="Bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    UserModel userModel = new UserModel();
    Cookie[] cookies = request.getCookies();
    String username = null;
    if (cookies != null && cookies.length != 0) {
        for (int i = 0; i < cookies.length; i++)
            if (cookies[i].getName().equals("username"))
                username = cookies[i].getValue();
    }
    System.out.println("username = " + username);
    User user = userModel.getUserByUsername(username);
%>
<div id="editprofile">
    <h3>Edit Profile</h3>
    <div id="userdata">
        <table>
            <tr>
                <td>  
                    <div id="photo">
                        <img src="assets/photo.png"/><br />
                    </div>
                </td>
                <td>
                    <div id= "userdata">
                        <table>
                            <tr>
                                <td colspan="2"><strong>Biodata</strong></td>
                            </tr>
                                <tr>
                                    <td width="250px">Nama:</td>
                                    <td colspan="2"><%= user.getNama() %></td>
                                </tr>
                                <tr>
                                    <td>Usia:</td>
                                    <td colspan="2">Usia</td>
                                </tr>
                                <tr>
                                    <td>Tanggal Lahir:</td>
                                    <td colspan="2"> Birth Date</td>
                                </tr>
                                <tr>
                                    <td>Alamat:</td>
                                    <td colspan="2"><%= user.getAlamat()%></td>
                                </tr>
                                <tr>
                                    <td>Kota:</td>
                                    <td colspan="2">kota</td>
                                </tr>
                                <tr>
                                    <td>Bio:</td>
                                    <td colspan="2">Bio</td>
                                </tr>
                            <br />

                                <tr>
                                    <td colspan="2"><strong>Favorit</strong></td>
                                </tr>
                                <tr>
                                    <td>Makanan Favorit</td>
                                    <td colspan="2">makanan</td>
                                </tr>
                                <tr>
                                    <td>Minuman Favorit:</td>
                                    <td colspan="2">minuman</td>
                                </tr>
                                <tr>
                                    <td>Lainnya:</td>
                                    <td colspan="2">lainnya</td>
                                </tr>
                            <br />

                            <tr>
                                <td colspan="2"><strong>Akun</strong></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td colspan="2"><%= user.getEmail() %></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td colspan="2"><%= user.getUsername() %></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td colspan="2">Password</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><a href="edit.jsp?edit=true"><img src ="assets/edit.png" id ="logbutton"/></a></td>
                            </tr>
                            <br />
                        </table>
                    </div>
                </td>
            </tr>

        </table>

    </div>
</div>