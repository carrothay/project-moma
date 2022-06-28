package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import model.Member;
import service.CommandProcess;

public class AdBoard implements CommandProcess {

		@Override
		public String requestPro(HttpServletRequest request, HttpServletResponse response) {
			
			final int ROW_PER_PAGE = 10;
			final int PAGE_PER_BLOCK = 5;
			
			String pageNum = request.getParameter("pageNum");		
			if (pageNum == null || pageNum.equals("")) pageNum="1";
			int currentPage = Integer.parseInt(pageNum);
			
			BoardDao bd = BoardDao.getInstance();
			
			int total = bd.getTotalB();
			
			int startRow = (currentPage-1)*ROW_PER_PAGE+1;
			int endRow = startRow + ROW_PER_PAGE-1;
		
			List<Board> list = bd.list(startRow, endRow);
			
			int number = total - startRow + 1;
			int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);
			int startPage = currentPage - (currentPage-1)%PAGE_PER_BLOCK;
			int endPage = startPage+PAGE_PER_BLOCK-1;
			if(endPage>totalPage) endPage = totalPage;
			
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("number", number);
			request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("list", list);
		
			return "adBoard";
		}
	}