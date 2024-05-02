package blogservlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/EditBlogServlet")
@MultipartConfig
public class EditBlogServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Part filePart = request.getPart("img"); 
        String fileName = getFileName(filePart); 
        String rating = request.getParameter("rating");

        
        String imagePath = "imgMNM/" + fileName;

        
        blog blogToUpdate = new blog(id, name, description, imagePath, rating);
        try (Connection conn = MySQLConntUtils.getMySQLConnection()) {
            BlogDAO.updateBlog(conn, blogToUpdate);
            response.getWriter().write("Blog updated successfully");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error updating blog: " + e.getMessage());
        }
    }

    
    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}