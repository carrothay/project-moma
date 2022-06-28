package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import service.CommandProcess;

public class BoardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));

		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(bno);
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);
		
		return "boardDelete";
	}

}
