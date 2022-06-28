package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;
import model.Review;

public class ReviewDao {
	// singletone
	private static ReviewDao instance = new ReviewDao ();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	// mybatis
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 리뷰 등록
	public int insert(Review review) { 
//		System.out.println("rv_content = " + review.getRv_content());
//		System.out.println("star_rate = " + review.getStar_rate());
//		System.out.println("rv_date = " + review.getRv_date());
//		System.out.println("mno = " + review.getMno());
//		System.out.println("cno = " + review.getCno());
		return session.insert("reviewns.insert", review);
	}
	
	// 각 컨텐츠의 review list
	public List<Review> select(int cno, int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cno", cno);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("reviewns.select", map);
	}
	
	// 평균 별점 가져오기
	public float selectStar(int cno) {
	//	System.out.println("session = "+session);
		return (float) session.selectOne("reviewns.selectStar", cno);
	}
	
	// 각 컨텐츠의 총 리뷰 갯수
	public int getTotal(int cno) {
		return (int) session.selectOne("reviewns.selectTotal", cno);
	}
	// 마이페이지 : 리뷰내역 조회
	public List<Review> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("reviewns.myList", hm);
	}
		
	// 마이페이지 : 나의 총 리뷰 수
	public int getTotalMy(int mno) {
	    return (int) session.selectOne("reviewns.getTotalMy", mno);
	}
	
	// 마이페이지 : 리뷰 삭제
	public int delete(int rvno) {
		return  session.update("reviewns.delete", rvno);
	}
	
	// 마이페이지 리뷰 수정 : review.* 와 content.cname 조회
	public Review selectRvno(int rvno) {
		return (Review) session.selectOne("reviewns.selectRvno", rvno);
	}
	
	// 마이페이지 리뷰 수정 : update action (content)
	public int update(Review review) {
		return session.update("reviewns.update", review);
	}
	
	// admin 전체 리뷰 조회
	public List<Review> adList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Review>)session.selectList("reviewns.adList",hm);
	}
	
	// admin 총 리뷰 수
	public int getTotal() {
		return (int) session.selectOne("reviewns.getTotal");
	}
}