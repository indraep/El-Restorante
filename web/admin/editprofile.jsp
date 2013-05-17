<%-- 
    Document   : editprofile
    Created on : 13-May-2013, 10:45:56
    Author     : cLienT
--%>

<%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="editprofile">
    <h3>Edit Profile</h3>

    <%
        String pencet = request.getParameter("hi");
        if (pencet != null) {
            String nama = request.getParameter("name");
            String birthdate = request.getParameter("hidbirt");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String bio = request.getParameter("bio");
            String username = request.getParameter("hidd");
            String password = request.getParameter("password");
            String confirmpass = request.getParameter("confirmpass");

            UserModel model = new UserModel();

            if ((confirmpass == null || confirmpass.length() == 0) && (password != null && password.length() > 0)) {
                out.println("<script>alert('Password tidak sesuai!');</script>");
                response.sendRedirect("edit.jsp");
            } else if ((password == null || password.length() == 0) && (confirmpass != null && confirmpass.length() > 0)) {
                out.println("<script>alert('Password tidak sesuai!');</script>");
                response.sendRedirect("edit.jsp");
            } else {
                out.println(nama + " " + username + " " + password + " " + email + " " + address + " " + birthdate + " " + bio);
                boolean udah = false;
                if ((password == null || password.length() == 0)) {
                    udah = model.update(nama, username, password, email, address, birthdate, bio, 0);
                } else {
                    if (password.equals(confirmpass)) {
                        udah = model.update(nama, username, password, email, address, birthdate, bio, 1);
                    }

                }

                if (!udah) {
                    out.println("<script>alert('Password tidak sesuai!');</script>");
                    response.sendRedirect("edit.jsp");
                } else {
                    response.sendRedirect("view.jsp");
                }
            }
        }

        Cookie[] cookies = request.getCookies();
        String name = null;
        if (cookies != null && cookies.length != 0) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("usernameadmin")) {
                    name = cookies[i].getValue();
                }
            }
        }

        UserModel usermodel = new UserModel();
        User a = usermodel.getUserByUsername(name);
    %>
    <div id="userdata">
        <table>
            <tr>
                <td>  
                    <div id="photo">
                        <% String src = "../uploaded-image/user/" + usermodel.getImageName(a.getUsername()); %>
                        <img src="<%= src %>" width="203px" height="226px" alt="photo"/><br />
                        Change Profile Picture
                        <br/>
                        <form action="../uploadUserImage" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="username" value="<%= a.getUsername()%>" />
                            <input type="file" name="file" size="15" />
                            <br />
                            <input type="image" src="../assets/upload.png"/></a>
                        </form>
                    </div>
                </td>
                <td style="padding-left: 30px">
                    <div id= "userdata">
                        <form action="editprofile.jsp" method="post">
                            <table>
                                <tr>
                                    <td colspan="2"><strong>Biodata</strong></td>
                                </tr>
                                <tr>
                                    <td width="250px">Nama:</td>
                                    <td colspan="2"><input type="text" name="name" value ="<% out.println(a.getNama());%>"></td>
                                </tr>
                                <tr>
                                    <td>Usia:</td>
                                    <td colspan="2"><input type="text" name="age" value ="<% out.println(a.getUsia());%>"></td>
                                </tr>
                                <tr>
                                    <td>Tanggal Lahir:</td>
                                    <td colspan="2"><input type="date" name="birthdate" value ="<%= a.getBirthDate()%>">
                                        <input type="hidden" name="hidbirt" value="<%= a.getBirthDate()%>"/>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Alamat:</td>
                                    <td colspan="2"><input type="text" name="address" value ="<% out.println(a.getAlamat());%>"></td>
                                </tr>
                                <tr>
                                    <td>Hobi:</td>
                                    <td colspan="2"><input type="text" name="hobby"></td>
                                </tr>
                                <tr>
                                    <td>Bio:</td>
                                    <td colspan="2"><input type="text" name="bio" value ="<% out.println(a.getBio());%>"></textarea></td>
                                </tr>
                                <br />

                                <tr>
                                    <td colspan="2"><strong>Favorit</strong></td>
                                </tr>
                                <tr>
                                    <td>Makanan Favorit</td>
                                    <td colspan="2"><input type="text" name="fav_food"></td>
                                </tr>
                                <tr>
                                    <td>Minuman Favorit:</td>
                                    <td colspan="2"><input type="text" name="fav_drink"></td>
                                </tr>
                                <tr>
                                    <td>Lainnya:</td>
                                    <td colspan="2"><input type="text" name="fav_other"></td>
                                </tr>
                                <br />

                                <tr>
                                    <td colspan="2"><strong>Akun</strong></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td colspan="2"><input type="email" name="email" value ="<% out.println(a.getEmail());%>"></td>
                                </tr>
                                <tr>
                                    <td>Username:</td>
                                    <td colspan="2"><input type="text" name="username" value ="<%= a.getUsername()%>" disabled="true"/>
                                        <input type="hidden" name="hidd" value="<%= a.getUsername()%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>New Password:</td>
                                    <td colspan="2"><input type="password" name="password"></td>
                                </tr>
                                <tr>
                                    <td>Confirm New Password:</td>
                                    <td colspan="2"><input type="password" name ="confirmpass"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td  style="padding-top: 20px">
                                        <input type="image" name="ganti" value="login" src="../assets/savechanges.png" id ="logbutton" />
                                        <input type="hidden" name="hi" value="hii"/>
                                    <td style="padding-top: 20px"><a href="view.jsp"><img src="../assets/cancel.png" id ="logbutton"/></a></td>
                                </tr>
                                <br />
                            </table>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>