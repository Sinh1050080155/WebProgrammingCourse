package blogservlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.Connection;

@WebServlet("/AddBlogServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddBlogServlet extends HttpServlet {
    private static final String SAVE_DIR = "imgMNM";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Part filePart = request.getPart("img"); 
        String rating = request.getParameter("rating");

        String fileName = extractFileName(filePart); 
        
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        String filePath = savePath + File.separator + fileName;
        filePart.write(filePath);

        String dbFilePath = SAVE_DIR + "/" + fileName;

        blog blog = new blog(id, name, description, dbFilePath, rating); 

        try (Connection conn = MySQLConntUtils.getMySQLConnection()) {
            BlogDAO.insertBlog(conn, blog);
            response.getWriter().print("Blog added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error adding blog: " + e.getMessage());
        }
    }
    
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("Content-Disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}