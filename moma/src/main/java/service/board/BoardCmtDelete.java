package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardcmtDao;
import service.CommandProcess;

public class BoardCmtDelete implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bcno = Integer.parseInt(request.getParameter("bcno"));

		BoardcmtDao cmt = BoardcmtDao.getInstance();
		int result = cmt.delete(bcno);
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);
		
		return "boardCmtDelete";

	}
}
