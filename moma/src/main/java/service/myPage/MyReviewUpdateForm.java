package service.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import dao.ReviewDao;
import model.Content;
import model.Review;
import service.CommandProcess;

public class MyReviewUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);

		int rvno = Integer.parseInt(request.getParameter("rvno"));
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review = rd.selectRvno(rvno);
		
		ContentDao cd = ContentDao.getInstance();
		Content content = cd.selectRvno(rvno);
		
		request.setAttribute("review", review);
		request.setAttribute("content", content);
		request.setAttribute("prevUrl", prevUrl);
		
		
	return "myReviewUpdateForm";

	}
}
