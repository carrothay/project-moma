package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardcmtDao;
import model.Boardcmt;
import service.CommandProcess;

public class BoardCmtWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardcmtDao bd = BoardcmtDao.getInstance();
		Boardcmt cmt = new Boardcmt();
		
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String bc_content = request.getParameter("bc_content");
		
		//cmt 세팅
		cmt.setBno(bno);
		cmt.setBc_content(bc_content);
		cmt.setMno(mno);
		
		int result = bd.insertComment(cmt); //댓글 저장하기
		
		request.setAttribute("result", result);
		request.setAttribute("bno",bno);
		
		return "boardComment";
	}
}
