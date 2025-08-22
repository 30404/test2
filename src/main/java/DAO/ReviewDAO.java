package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.ReviewDTO;

public class ReviewDAO {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; 
    private static final String USER = "scott"; 
    private static final String PASSWORD = "tiger"; 

    private Connection getConnection() throws SQLException {
        try { Class.forName("oracle.jdbc.driver.OracleDriver"); }
        catch (ClassNotFoundException e) { e.printStackTrace(); }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 리뷰 등록
    public int insertReview(ReviewDTO review) {
        String sql = "INSERT INTO movie_review (movie_title, review_text, created_at) VALUES (?, ?, SYSTIMESTAMP)";
        int result = 0;
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, review.getMovieTitle());
            pstmt.setString(2, review.getReviewText());
            result = pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return result;
    }

    // 전체 리뷰 조회
    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> list = new ArrayList<>();
        String sql = "SELECT id, movie_title, review_text, created_at FROM movie_review ORDER BY id DESC";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                list.add(new ReviewDTO(
                    rs.getInt("id"),
                    rs.getString("movie_title"),
                    rs.getString("review_text"),
                    rs.getString("created_at")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
