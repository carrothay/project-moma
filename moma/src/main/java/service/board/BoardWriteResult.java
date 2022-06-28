package service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
				
		// board생성
		Board board = new Board();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈
		
		int result = 0;
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String image = mr.getFilesystemName("image"); // image input 내용 불러오기
			String bname = mr.getParameter("bname");
			String bo_content = mr.getParameter("bo_content");
			
			// board 세팅
			board.setImage(image);
			board.setBname(bname);
			board.setBo_content(bo_content);

		
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		BoardDao bd = BoardDao.getInstance();
	
		// action 값 가져오기
		String action = request.getParameter("action");
		
		if (action.equals("insert")) // 글작성
			result = bd.insert(board);
		
		request.setAttribute("result", result);
		request.setAttribute("action", action);

	return "boardWriteResult";
}
}
