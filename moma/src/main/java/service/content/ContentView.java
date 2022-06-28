package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentDao;
import dao.LikesDao;
import dao.MemberDao;
import dao.ReviewDao;
import model.Content;
import model.Likes;
import model.Member;
import model.Review;
import service.CommandProcess;

public class ContentView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		HttpSession session = request.getSession();    //솔 수정
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ContentDao cd = ContentDao.getInstance();
		Content content = cd.select(cno);
		
		MemberDao md = MemberDao.getInstance();
		
		
		// hj 좋아요부분추가
		if (session.getAttribute("mno") != null) {
			int mno = (int) session.getAttribute("mno"); // session mno
		String result = "";
		LikesDao ld = LikesDao.getInstance();
		Likes likes = ld.select(cno, mno); 
		if (likes == null) { result = "n"; }
		else result = "y"; 
		request.setAttribute("result", result);
		}
		//
		
		
		// 조회수
		cd.countUpdate(cno);
		
		// 리뷰 페이징 : start
		final int ROW_PER_PAGE = 4; // 한 페이지에 10개씩
		final int PAGE_PER_BLOCK = 5;  // 한 블럭에 2페이지

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
 
		// 뿌려질 리스트의 시작번호 
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		// 해당 컨텐츠 리스트 셀렉
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> list = rd.select(cno, startRow, endRow);
		
		// 해당 컨텐츠의 총 리뷰 수
		int total = rd.getTotal(cno);
		
		// Math.ceil : 현재 실수보다 큰 정수 
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수 
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10 
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1 
		int endPage = startPage + PAGE_PER_BLOCK - 1; 
		// 총 페이지보다 큰 endPage는 나올 수 없다. 
		if (endPage > totalPage) endPage = totalPage; 
		// paging : end
		
		// 평균 별점
		float star_rate = 0;

		// 리뷰가 없을때 제어
		if (list.size() == 0) {
			star_rate = 0;
		} else {
			star_rate = (float) rd.selectStar(cno);
		}

		// 리뷰 갯수
		int reviewCnt = total; // list.size();
		
		/*
		 * // 회원이 좋아요 했는지 체크 LikesDao lkd = LikesDao.getInstance(); String imgSrc = "";
		 * 
		 * if (session.getAttribute("mno") != null) { //로그인이 되어있으면 int mno = (int)
		 * session.getAttribute("mno"); // session mno //솔 수정 Likes lk = lkd.select(cno,
		 * mno); String nickname = md.selectNick(mno); //솔 수정
		 * //System.out.println("nickname=" + nickname);
		 * request.setAttribute("nickname", nickname); // 솔 수정
		 * request.setAttribute("lk", lk); //솔 수정 if (lk == null) { imgSrc =
		 * "../../img/icon/heart.png"; } else { imgSrc = "../../img/icon/heart (1).png";
		 * } } else { imgSrc = "../../img/icon/heart.png"; }
		 */
				
		request.setAttribute("cno", cno);
		request.setAttribute("content", content);
		request.setAttribute("list", list);
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("reviewCnt", reviewCnt);
		/* request.setAttribute("imgSrc", imgSrc); */
		
		request.setAttribute("pageNum", pageNum);	
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage); 
		request.setAttribute("endPage", endPage); 

		return "contentView";
	}

}