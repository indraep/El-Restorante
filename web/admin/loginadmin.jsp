<%-- 
    Document   : login_admin
    Created on : 14-May-2013, 09:25:07
    Author     : cLienT
--%>
<%-- <%@page import="Bean.User"%>
<%@page import="ModelClass.UserModel"%>
--%>
<div id ="loginadmin">
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
                <td></td>
                <td>
                    <input type="image" name="logbutton" value="login" src="../assets/login.png" />
                    <input type="hidden" name="logbutton" value="login" />
                </td>
            </tr>
        </table>
    </form>
</div>