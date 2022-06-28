package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardcmtDao;
import service.CommandProcess;

public class AdBoardCmtDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bcno = Integer.parseInt(request.getParameter("bcno"));

		BoardcmtDao cmt = BoardcmtDao.getInstance();
		int result = cmt.delete(bcno);
		
		request.setAttribute("result", result);
		
		return "adboardCmtDelete";
	}

}
