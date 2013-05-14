<%-- 
    Document   : coti
    Created on : May 14, 2013, 3:00:20 PM
    Author     : indraep
--%>

<%@page import="ModelClass.PesananModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%
    
    
    String username = request.getParameter("username");
    String totalBiaya = request.getParameter("total_biaya");
    String pesanan = request.getParameter("pesanan");
    String addition = request.getParameter("addition");
    String username_paybro = request.getParameter("username_paybro");
    String password_paybro = request.getParameter("password_paybro");
    PesananModel pesananModel = new PesananModel();
    
    out.print(pesananModel.buatPesananDenganPaybro(username, totalBiaya, pesanan, addition, username_paybro, password_paybro));
%>
