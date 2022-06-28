package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmNickname implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nickname = request.getParameter("nickname");
		String msg = "";
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.confirmNickname(nickname);
		if(member==null) {
			msg = "";
		}
		else {
			msg = "이미 사용중인 별명입니다";
		}
		request.setAttribute("msg", msg);
		return "confirmNickname";
	}
}
