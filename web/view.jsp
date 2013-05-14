<%-- 
    Document   : view
    Created on : 14 Mei 13, 9:34:26
    Author     : Berty Tobing
--%>

<%@page import="java.util.*"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/el_restorante_style.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.cookie.js"></script>
        <script type="text/javascript" src="js/cart.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <table id="mainTable">
            <tr>
                <td colspan="3">
                    <jsp:include page = 'banner.jsp' flush = 'true' />
                </td>
            </tr>
            <tr>
                <td width="170px">
                    <jsp:include page = 'sidebar.jsp' flush = 'true' />
                </td>
                <td>
                   
                        <jsp:include page = 'viewprofile.jsp' flush = 'true' />
                 
                </td>
                <td width="170px">
                    <jsp:include page = 'right_sidebar.jsp' flush = 'true' />
                </td>
            </tr>
        </table>
    </body>
</html>
