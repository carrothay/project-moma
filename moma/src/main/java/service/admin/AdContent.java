package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		//ct 리스트 조회
		ContentDao cd = ContentDao.getInstance();
		
		//paging : start
		final int ROW_PER_PAGE = 10;  //한 페이지 10개씩
		final int PAGE_PER_BLOCK = 5;  // 한 블럭에 5페이지
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		// 현재페이지
		int currentPage = Integer.parseInt(pageNum);
		
		// 페이지 총 개수
		int total = cd.getTotal();
		
		// 시작번호 : (페이지번호-1)*페이지당 개수 +1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호 : 시작번호 + 페이지당 개수 -1
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		List<Content> list = cd.getTotalList(startRow, endRow);
		
		// Math.ceil : 현재 실수보다 큰 정수 
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수 
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10 
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1 
		int endPage = startPage + PAGE_PER_BLOCK - 1; 
		// 총 페이지보다 큰 endPage는 나올 수 없다. 
		if (endPage > totalPage) endPage = totalPage; 
		// paging : end		
		
		request.setAttribute("list", list);
		
		// paging param 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage); 
		request.setAttribute("endPage", endPage); 
		request.setAttribute("totalPage", totalPage);
		
		return "adContent";
	}

}
