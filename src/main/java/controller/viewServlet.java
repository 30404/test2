package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

// DTO 클래스 (예: dto.ReviewDTO)
import dto.ReviewDTO;

@WebServlet("/review")
public class viewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public viewServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 나중에는 DB에서 가져오면 됨
        List<ReviewDTO> reviews = new ArrayList<>();

        // 테스트용 더미 데이터
        reviews.add(new ReviewDTO(1, "인셉션", "정말 재밌는 영화였어요!", "2025-08-21"));
        reviews.add(new ReviewDTO(2, "인터스텔라", "감동적인 우주 이야기!", "2025-08-20"));

        // JSP에서 쓸 수 있도록 request에 담기
        request.setAttribute("reviews", reviews);

        // JSP로 forward
        RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewList.jsp"); 
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
