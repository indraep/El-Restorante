<%@page import="javax.swing.plaf.metal.MetalIconFactory.FileIcon16"%>
<%@ page import="java.sql.*" %>   
<%@ page import="org.apache.commons.fileupload.*"%>   
<%@ page import="org.apache.commons.io.output.*"%>   
<%@ page import="org.apache.commons.fileupload.servlet.*"%>   
<%@ page import="org.apache.commons.fileupload.disk.*"%>   
<%@ page import="java.io.*"%>   
<%@ page import="java.util.*"%>   
<%   
    String username = null;
    byte[] b = null;
    
    Connection conn=null;   
    Class.forName("com.mysql.jdbc.Driver").newInstance();   
    conn = DriverManager.getConnection("jdbc:mysql://localhost/el restorante","root", "");  
   
    PreparedStatement psImageInsertDatabase = null;
    boolean error = false;
    try{   
        String sqlImageInsertDatabase="update `user` set image=? where username=?";
        psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);   
         
        DiskFileItemFactory factory = new DiskFileItemFactory();   
  
        ServletFileUpload sfu = new ServletFileUpload(factory);   
        List items = sfu.parseRequest(request);
        
        Iterator iter = items.iterator();   
         
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();   
            if (!item.isFormField()) {
                b = item.get();   
            }
            else {
                if (item != null && item.getFieldName() != null && item.getFieldName().equals("username")) {
                    username = item.getString();
                }
            }
        }   
         
        psImageInsertDatabase.setBytes(1, b);
        psImageInsertDatabase.setString(2, username);
        psImageInsertDatabase.executeUpdate();   
    }   
    catch(Exception e) {   
        out.print("ERROR = " + e.getMessage());
        error = true;
    }
    
    if (!error)
        response.sendRedirect("../../view.jsp");
%>   
