package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class MomaMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("MomaMain 자바파일 거쳤음");
		
		ContentDao cd = ContentDao.getInstance();
		
		//String metaPath = request.getSession().getServletContext().getRealPath("/img/poster");
		//System.out.println("metaPath="+metaPath);
		//request.setAttribute("metaPath", metaPath);
		
		List<Content> dlist = cd.topDlist();
		request.setAttribute("dlist", dlist);
		
		List<Content> mlist = cd.topMlist();
		request.setAttribute("mlist", mlist);
		
		List<Content> list = cd.list();
		request.setAttribute("list", list);
		
		return "momaMain";
	}
}
