package service.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;

import model.Review;
import service.CommandProcess;

public class MyReviewUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		
		String rv_content = request.getParameter("rv_content");
		int star_rate = Integer.parseInt(request.getParameter("star_rate"));
		
		ReviewDao rd = ReviewDao.getInstance();
		
		System.out.println(rvno);
		System.out.println(rv_content);
		System.out.println(star_rate);
		
		
		Review review = new Review();
		review.setRvno(rvno);
		review.setRv_content(rv_content);
		review.setStar_rate(star_rate);
		
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("rvno", rvno);
		
		return "myReviewUpdateAction";
	}
}