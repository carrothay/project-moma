package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mname = request.getParameter("mname");
		String email = request.getParameter("email");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(mname, email);
		
		request.setAttribute("member", member);

		return "findIdAction";
	}
}
