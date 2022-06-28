package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 관리자가 수정하는 경우를 위해 세션체크 추가
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int bno = Integer.parseInt(request.getParameter("bno"));

		// 이전 주소 경로 가져오기
		String referer = (String)request.getHeader("Referer");
		String prevUrl = referer.substring(21);
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(bno);

		request.setAttribute("board", board);
		request.setAttribute("id", id);
		request.setAttribute("prevUrl", prevUrl);

		return "boardUpdateForm";
	}

}
