/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import ModelClass.UserModel;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author indraep
 */
@WebServlet(name = "uploadUserImage", urlPatterns = {"/uploadUserImage"})
public class uploadUserImage extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            MultipartRequest multipartRequest = new MultipartRequest(request, 
                    getServletContext().getRealPath("/uploaded-image/"), /* 5MB */ 5 * 1024 * 1024, new DefaultFileRenamePolicy());
            
            upload(request, response, multipartRequest, multipartRequest.getParameter("username"));
        } 
        catch(Exception e) {
            out.print("Error " + e.getMessage());
        }
        finally {            
            out.close();
        }
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response, MultipartRequest multipartRequest, String username) throws IOException, Exception {
        // Get uploaded file
        File tmpFile = multipartRequest.getFile("file");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
        Date date = new Date();
        String imageName = dateFormat.format(date);
        
        //Do whatever adjustment you want to this temporary file . . .
        //Move temporary file to actual destination
        File dirToMove = new File(getServletContext().getRealPath("/uploaded-image/user"));
        String newFileName = imageName + tmpFile.getName().substring(tmpFile.getName().lastIndexOf('.'));
        File fileToMove = new File(dirToMove, newFileName);
        tmpFile.renameTo(fileToMove);
        
        /**
         * Delete temporary file
         */
        tmpFile.delete();
        new UserModel().setImageName(newFileName, username);
        /**
         * Display newly uploaded file
         */
        response.sendRedirect("edit.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
