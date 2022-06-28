package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardMain implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("BoardMain 자바파일 지나감");
		BoardDao bd = BoardDao.getInstance();
		
		final int ROW_PER_PAGE = 6; // 한 페이지에 게시글 4개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩
		
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		
		int total = bd.getTotalB(); // 총 게시글 수
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)
		
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		
		if (endPage > totalPage) endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		List<Board> list = bd.list(startRow, endRow);
		
		
		request.setAttribute("list", list);
		//System.out.println(list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		
		//System.out.println("BoardMain 자바파일 지나감2");
		
		return "boardMain";
	}

}
