<%-- 
    Document   : loginregister
    Created on : 13 Mei 13, 11:05:58
    Author     : Berty Tobing
--%>

<%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>


<div id ="loginregister">
    Login
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
                    <input type="submit" value="login"/>
                    <img src ="assets/login.png" id ="logbutton"/>
                </td>
            </tr>
        </table>
    </form>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    Tidak punya account?
    <br>
    Silahkan register!
    <br>
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
                <input type="text" name="emailreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
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
                <input type="text" name="passwordreg" style="border: 1px solid #fb8200; background: #ffffdf; color: #111111; font-size: 1em;" />
            </td>
        </tr>
        <tr>
            <td>
                <img src ="assets/register.png" id ="regbutton"/>
            </td>
        </tr>
    </table>
</div>