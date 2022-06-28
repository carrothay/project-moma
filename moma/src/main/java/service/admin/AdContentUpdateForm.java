package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContentUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		ContentDao cd = ContentDao.getInstance();
		int cno = Integer.parseInt(request.getParameter("cno"));
		Content ct = cd.adSelectView(cno);
		
		request.setAttribute("ct", ct);
		
		return "adContentUpdateForm";
	}

}
