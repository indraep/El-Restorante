<%-- 
    Document   : editprofile
    Created on : 13-May-2013, 10:45:56
    Author     : cLienT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="editprofile">
    <h3>Edit Profile</h3>


    <div id="userdata">
        <table>
            <tr>
                <td>  
                    <div id="photo">
                        <img src="assets/photo.png"/><br />
                        <a href="">Change Profile Picture</a> 
                    </div>
                </td>
                <td>
                    <div id= "userdata">
                        <table>
                            <tr>
                                <td colspan="2"><strong>Biodata</strong></td>
                            </tr>
                            <form action="editprofile.jsp" method="post">
                                <tr>
                                    <td width="250px">Nama:</td>
                                    <td colspan="2"><input type="text" name="name"></td>
                                </tr>
                                <tr>
                                    <td>Usia:</td>
                                    <td colspan="2"><input type="number" name="age"></td>
                                </tr>
                                <tr>
                                    <td>Tanggal Lahir:</td>
                                    <td colspan="2"><input type="date" name="birthdate"></td>
                                </tr>
                                <tr>
                                    <td>Alamat:</td>
                                    <td colspan="2"><input type="text" name="address"></td>
                                </tr>
                                <tr>
                                    <td>Kota:</td>
                                    <td colspan="2"><input type="text" name="city"></td>
                                </tr>
                                <tr>
                                    <td>Hobi:</td>
                                    <td colspan="2"><input type="text" name="hobby"></td>
                                </tr>
                                <tr>
                                    <td>Bio:</td>
                                    <td colspan="2"><textarea rows="4" cols="20" name="bio"></textarea></td>
                                </tr>
                            </form>
                            <br />

                            <form action="editprofile.jsp">
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
                            </form>
                            <br />

                            <tr>
                                <td colspan="2"><strong>Akun</strong></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td colspan="2"><input type="email" name="email"></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td colspan="2"><input type="text" name="username"></td>
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
                                <td><a href="#"><input type="button" value="save"></a></td>
                                <td><a href="#"><input type="button" value="cancel"></a></td>
                            </tr>
                            <br />
                        </table>
                    </div>
                </td>
            </tr>



        </table>

    </div>
</div>