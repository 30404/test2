package dto;

public class ReviewDTO {
    private int id;
    private String movieTitle;
    private String reviewText;
    private String createdAt;

    // DB 조회용
    public ReviewDTO(int id, String movieTitle, String reviewText, String createdAt) {
        this.id = id;
        this.movieTitle = movieTitle;
        this.reviewText = reviewText;
        this.createdAt = createdAt;
    }

    // 등록용
    public ReviewDTO(String movieTitle, String reviewText) {
        this.movieTitle = movieTitle;
        this.reviewText = reviewText;
    }

    public int getId() { return id; }
    public String getMovieTitle() { return movieTitle; }
    public String getReviewText() { return reviewText; }
    public String getCreatedAt() { return createdAt; }
}
