<%-- 
    Document   : coti
    Created on : May 14, 2013, 8:49:04 PM
    Author     : indraep
--%>

<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.DataBufferByte"%>
<%@page import="java.awt.image.WritableRaster"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%> 
<%@page import="java.awt.Image"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File fnew=new File("/assets/photo.png");
            BufferedImage originalImage=ImageIO.read(fnew);
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            ImageIO.write(originalImage, "png", baos );
            byte[] b=baos.toByteArray();
            out.print(b.toString());
        %>
    </body>
</html>
