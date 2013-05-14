<%@ page import="java.sql.*" %>   
<%@ page import="org.apache.commons.fileupload.*"%>   
<%@ page import="org.apache.commons.io.output.*"%>   
<%@ page import="org.apache.commons.fileupload.servlet.*"%>   
<%@ page import="org.apache.commons.fileupload.disk.*"%>   
<%@ page import="java.io.*"%>   
<%@ page import="java.util.*"%>   
<%   
    String kategori = null;
    String nama = null;
    String harga = null;
    String deskripsi = null;
    byte[] b = null;
    
    Connection conn=null;   
    Class.forName("com.mysql.jdbc.Driver").newInstance();   
    conn = DriverManager.getConnection("jdbc:mysql://localhost/el restorante","root", "");  
   
    PreparedStatement psImageInsertDatabase = null;
    boolean error = false;
    try{   
        String sqlImageInsertDatabase="INSERT INTO `menu`(`category_id`, `name`, `description`, `price`, `image`) VALUES (?, ?, ?, ?, ?)";
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
                if (item != null && item.getFieldName() != null && item.getFieldName().equals("kategori")) {
                    kategori = item.getString();
                }
                else if (item != null && item.getFieldName() != null && item.getFieldName().equals("food_name")) {
                    nama = item.getString();
                }
                else if (item != null && item.getFieldName() != null && item.getFieldName().equals("food_price")) {
                    harga = item.getString();
                }
                else if (item != null && item.getFieldName() != null && item.getFieldName().equals("food_description")) {
                    deskripsi = item.getString();
                }
            }
        }   
         
        psImageInsertDatabase.setString(1, kategori);
        psImageInsertDatabase.setString(2, nama);
        psImageInsertDatabase.setString(3, deskripsi);
        psImageInsertDatabase.setString(4, harga);
        psImageInsertDatabase.setBytes(5, b);   
        psImageInsertDatabase.executeUpdate();   
    }   
    catch(Exception e) {   
        out.print("ERROR = " + e.getMessage());
        error = true;
    }
    
    if (!error)
        response.sendRedirect("../viewaddmenu.jsp");
%>   
