<%-- 
    Document   : index
    Created on : May 4, 2013, 8:59:52 AM
    Author     : indraep
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
                <td colspan="2">
                    <jsp:include page = 'banner.jsp' flush = 'true' />
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <jsp:include page = 'sidebar.jsp' flush = 'true' />
                </td>
                <td></td>
            </tr>
        </table>
    </body>
</html>