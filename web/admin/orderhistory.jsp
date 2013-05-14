<%-- 
    Document   : orderhistory
    Created on : 13-May-2013, 14:59:07
    Author     : cLienT
--%>

<%@page import="java.util.*"%>
<%@page import="ModelClass.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../style/el_restorante_style.css">
        <title>Sejarah Pembelian</title>
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
                   
                    <jsp:include page = 'history.jsp' flush = 'true' />
                   
                </td>
                <td width="150px">
                    <jsp:include page = 'right_sidebar.jsp' flush = 'true' />
                </td>
            </tr>
        </table>
    </body>
</html>
