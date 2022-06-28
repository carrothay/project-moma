package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContentDelCancel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AdContentDelete 자바파일 지나감");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ContentDao cd = ContentDao.getInstance();
		int result = cd.delCancel(cno);		
				
		System.out.println("AdContentDelete 자바파일 지나감222");
		request.setAttribute("result", result);
		
		return "adContentDelCancel";
	}

}
