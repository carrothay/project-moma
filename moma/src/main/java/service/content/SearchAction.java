package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ContentDao;
import model.Board;
import model.Content;
import service.CommandProcess;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("searchAction 자바파일 지나간당~");
		
		String srch = request.getParameter("srch");
		
		ContentDao cd = ContentDao.getInstance();
		List<Content> ctList = cd.search(srch);
		
		request.setAttribute("ctList", ctList);
	
		return "searchAction";
	}

}
