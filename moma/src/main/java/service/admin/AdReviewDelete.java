package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service.CommandProcess;

public class AdReviewDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.delete(rvno);
		
		request.setAttribute("result", result);
		
		return "adReviewDelete";
	}

}
