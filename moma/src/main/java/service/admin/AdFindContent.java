package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdFindContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AdFindContent 자바파일 지나감");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		ContentDao cd = ContentDao.getInstance();
		List<Content> ctList = cd.adSearch(searchKey, searchValue);
		
		request.setAttribute("ctList", ctList);
		
		return "adFindContent";
	}

}
