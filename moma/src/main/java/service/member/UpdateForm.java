package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		request.setAttribute("member", member);
	
		return "updateForm";

	}
}
