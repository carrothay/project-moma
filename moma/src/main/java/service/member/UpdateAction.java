package service.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		Member member = new Member();
		String prevUrl = request.getParameter("prevUrl");
		
		// 수정하려는 값 불러오기
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String mname = request.getParameter("mname");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String sms_check = request.getParameter("sms_check");
		String email_check = request.getParameter("email_check");
		
		System.out.println(password);
		System.out.println(email);
		System.out.println(mname);
		System.out.println(nickname);
		System.out.println(phone);
		System.out.println(sms_check);
		System.out.println(email_check);
	
		// member에 수정내용 세팅
		member.setMno(mno);
		member.setPassword(password);
		member.setEmail(email);
		member.setMname(mname);
		member.setNickname(nickname);
		member.setPhone(phone);
		member.setSms_check(sms_check);
		member.setEmail_check(email_check);

		// memberDao 생성 및 update
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		
		request.setAttribute("result", result);
		request.setAttribute("prevUrl", prevUrl);

		return "updateAction";
	
	}
}
