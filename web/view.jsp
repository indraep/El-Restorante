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
                <td width="150px">
                    <jsp:include page = 'sidebar.jsp' flush = 'true' />
                </td>
                <td>
                   
                        <jsp:include page = 'viewprofile.jsp' flush = 'true' />
                 
                </td>
                <td width="150px">
                    <jsp:include page = 'sidebar.jsp' flush = 'true' />
                </td>
            </tr>
        </table>
    </body>
</html>
