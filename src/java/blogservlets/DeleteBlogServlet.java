package blogservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBlogServlet")
public class DeleteBlogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blogId = request.getParameter("blogId");
        try {
            
            Connection conn = MySQLConntUtils.getMySQLConnection();
            BlogDAO.deleteBlog(conn, blogId);
            response.getWriter().print("Blog deleted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error deleting blog: " + e.getMessage());
        }
    }
}
