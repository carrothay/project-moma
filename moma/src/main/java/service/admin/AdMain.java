package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 확인용
		//System.out.println(id);
		
		MemberDao md = MemberDao.getInstance();
		
		if (id != null) {
		Member member = md.select(id);
		request.setAttribute("member", member);
		}

		return "adMain"; 
		
	}
}
