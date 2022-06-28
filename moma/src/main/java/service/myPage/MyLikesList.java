package service.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LikesDao;
import model.Likes;
import service.CommandProcess;

public class MyLikesList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		if (session.getAttribute("mno") != null) {
			int mno = (int) session.getAttribute("mno"); // session mno

		//System.out.println(mno);

		LikesDao ld = LikesDao.getInstance();
		
		//페이징
		final int ROW_PER_PAGE = 12; // 한 페이지에 게시글 6개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = ld.getTotalMy(mno); // 총 게시글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우

		List<Likes> list = ld.myList(mno, startRow, endRow);

		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
	}
	return "myLikesList";
	}
}