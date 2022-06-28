package service.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReviewDao;
import service.CommandProcess;

public class MyReviewDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		//admin, 회원 구분 필요 없을듯? 아이디 굳이 안불러와도 될듯. 일단 킵
		/*
		 * HttpSession session = request.getSession(); String id =
		 * (String)session.getAttribute("id");
		 */
		
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.delete(rvno);
		
		request.setAttribute("result", result);
		
		return "myReviewDelete";
		
	}

}
