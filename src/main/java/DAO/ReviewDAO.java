package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.ReviewDTO;

public class ReviewDAO {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; // 환경에 맞게 수정
    private static final String USER = "scott"; // 계정명 수정
    private static final String PASSWORD = "tiger"; // 비밀번호 수정

    // DB 연결
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 드라이버 로딩
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 리뷰 등록
    public int insertReview(ReviewDTO review) {
        String sql = "INSERT INTO movie_review (movie_title, review_text, created_at) "
                   + "VALUES (?, ?, SYSTIMESTAMP)";
        int result = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, review.getMovieTitle());
            pstmt.setString(2, review.getReviewText());

            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 리뷰 전체 조회
    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> list = new ArrayList<>();
        String sql = "SELECT id, movie_title, review_text, created_at "
                   + "FROM movie_review ORDER BY id DESC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO(
                        rs.getInt("id"),
                        rs.getString("movie_title"),
                        rs.getString("review_text"),
                        rs.getString("created_at")  // TIMESTAMP → String
                );
                list.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 특정 리뷰 조회
    public ReviewDTO getReviewById(int id) {
        String sql = "SELECT id, movie_title, review_text, created_at "
                   + "FROM movie_review WHERE id = ?";
        ReviewDTO review = null;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                review = new ReviewDTO(
                        rs.getInt("id"),
                        rs.getString("movie_title"),
                        rs.getString("review_text"),
                        rs.getString("created_at")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return review;
    }
}
