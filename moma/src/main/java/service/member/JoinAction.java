package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String mname = request.getParameter("mname");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String sms_check = request.getParameter("sms_check");
		String email_check = request.getParameter("email_check");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setEmail(email);
		member.setMname(mname);
		member.setNickname(nickname);
		member.setPhone(phone);
		member.setSms_check(sms_check);
		member.setEmail_check(email_check);
		
		MemberDao md = MemberDao.getInstance();
		Member m1 = md.select(id);
		int result = 0;
		if(m1 == null) {result=md.insert(member);}
		else result = -1;
		request.setAttribute("result", result);
		return "joinAction";
	}

}
