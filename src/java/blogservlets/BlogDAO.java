package blogservlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO {

    public static List<blog> getAllBlogs(Connection conn) throws SQLException {
        List<blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM blog";

        try (PreparedStatement pstm = conn.prepareStatement(sql); ResultSet rs = pstm.executeQuery()) {
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String img = rs.getString("img");
                String rating = rs.getString("rating");

                blog blog = new blog(id, name, description, img, rating);
                blogList.add(blog);
            }
        }

        return blogList;
    }

    public static void insertBlog(Connection conn, blog blog) throws SQLException {
        String sql = "INSERT INTO blog(id, name, description, img, rating) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setString(1, blog.getId());
            pstm.setString(2, blog.getName());
            pstm.setString(3, blog.getDescription());
            pstm.setString(4, blog.getImg());
            pstm.setString(5, blog.getRating());
            pstm.executeUpdate();
        }
    }

    public static void updateBlog(Connection conn, blog blog) throws SQLException {
        String sql = "UPDATE blog SET name=?, description=?, img=?, rating=? WHERE id=?";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setString(1, blog.getName());
            pstm.setString(2, blog.getDescription());
            pstm.setString(3, blog.getImg());
            pstm.setString(4, blog.getRating());
            pstm.setString(5, blog.getId());
            pstm.executeUpdate();
        }
    }

    public static blog getBlogById(Connection conn, String blogId) throws SQLException {
        String sql = "SELECT * FROM blog WHERE id = ?";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setString(1, blogId);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String img = rs.getString("img");
                    String rating = rs.getString("rating");

                    return new blog(id, name, description, img, rating);
                }
            }
        }
        return null;
    }

    public static void deleteBlog(Connection conn, String blogId) throws SQLException {
        String sql = "DELETE FROM blog WHERE id = ?";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setString(1, blogId);
            pstm.executeUpdate();
        }
    }

    public static List<blog> getBlogsWithPagination(Connection conn, int start, int count) throws SQLException {
        List<blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM blog LIMIT ?, ?";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setInt(1, start);
            pstm.setInt(2, count);
            try (ResultSet rs = pstm.executeQuery()) {
                while (rs.next()) {
                    blog blog = new blog(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("img"), rs.getString("rating"));
                    blogList.add(blog);
                }
            }
        }
        return blogList;
    }

    public static void updateBlogRating(Connection conn, String id, String rating) throws SQLException {
        String sql = "UPDATE blog SET rating=? WHERE id=?";
        try (PreparedStatement pstm = conn.prepareStatement(sql)) {
            pstm.setString(1, rating);
            pstm.setString(2,id );
            pstm.executeUpdate();
        }
    }

}
