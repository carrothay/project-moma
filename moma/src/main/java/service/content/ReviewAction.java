package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class ReviewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String rv_content = request.getParameter("rv_content");
		int star_rate = Integer.parseInt(request.getParameter("star_rate"));
		
		// id로 mno 조회
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id);
		
		// setting
		Review review = new Review();
		review.setRv_content(rv_content);
		review.setStar_rate(star_rate);
		review.setCno(cno);
		review.setMno(mno);
		
		// review table에 insert
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.insert(review);
		cno = review.getCno();
		
		request.setAttribute("review", review);
		request.setAttribute("result", result);
		request.setAttribute("cno", cno);
		
		return "reviewAction"; 
	}

}