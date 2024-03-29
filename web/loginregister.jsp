<%-- 
    Document   : loginregister
    Created on : 13 Mei 13, 11:05:58
    Author     : Berty Tobing
--%>

<%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>


<div id ="loginregister">
    <img src ="assets/company.png"/>
    <br/>
    <h3>Login</h3>
    <form action="login.jsp" method="post">
        <table>
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <input type="text" name="username" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input type="password" name="password" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="image" name="logbutton" value="login" src="assets/login.png" id="order"/>
                    <input type="hidden" name="logbutton" value="login" />
                </td>
            </tr>
        </table>
    </form>
    <br/>
    <h3>Tidak punya account?</h3>
    <h4>Silahkan register!</h4>
    <form action="login.jsp" method="post">
        <input type="hidden" name="register" value="true" />
        <table>    
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    <input type="text" name="namereg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
                </td>
            </tr>
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <input type="email" name="emailreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
                </td>
            </tr>
            <tr>
                <td>
                    Alamat:
                </td>
                <td>
                    <input type="text" name="alamatreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
                </td>
            </tr>
            <tr>
                <td>
                    Username:
                </td>
            <td>
                <input type="text" name="usernamereg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <input type="password" name="passwordreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
            </td>
        </tr>
        <tr>
            <td>
                Tanggal lahir:
            </td>
            <td>
                <input type="date" name="birthdatereg">
            </td>
        </tr>
        <tr>
            <td>
                Status:
            </td>
            <td>
                <input type="text" name="statusreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="image" name="regbutton" value="register" src="assets/register.png" id="order" />
                <input type="hidden" name="regbutton" value="register" />
            </td>
        </tr>
    </table>
</form>
</div>