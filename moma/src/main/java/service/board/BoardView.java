package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BoardcmtDao;
import dao.MemberDao;
import model.Board;
import model.Boardcmt;
import service.CommandProcess;

public class BoardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bd = BoardDao.getInstance();
		
		//조회수 카운트
		bd.readcountUpdate(bno);
		//데이터 가져오기
		Board board = bd.select(bno);
		
		//댓글부분
		Boardcmt cmt = new Boardcmt();
		BoardcmtDao cmtdao = BoardcmtDao.getInstance();
		List<Boardcmt> list = cmtdao.list(bno); //댓글 목록 불러오기
		int cmt_cnt = list.size();
		
		
		request.setAttribute("board", board);
		request.setAttribute("bno", bno);
		request.setAttribute("list",list);
		request.setAttribute("cmt_cnt", cmt_cnt);

	
		return "boardView";
	}

}
