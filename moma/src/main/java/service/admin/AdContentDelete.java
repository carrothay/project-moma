package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContentDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ContentDao cd = ContentDao.getInstance();
		int result = cd.delete(cno);		
				
		request.setAttribute("result", result);
		
		return "adContentDelete";
	}

}
