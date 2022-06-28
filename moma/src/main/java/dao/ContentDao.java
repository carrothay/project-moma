package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Content;
import model.Reservation;

public class ContentDao {
	//singleton
	private static ContentDao instance = new ContentDao();
	private ContentDao() {}
	public static ContentDao getInstance() {
		return instance;
	}
	
	// mybatis
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			//System.out.println("ContentDao 지나간다~~ 왔냐?");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// cname 중복 체크
	public Content select(String cname) {
		return (Content) session.selectOne("contentns.select", cname);
	}
	
	// 컨텐츠 상세 select
	public Content select(int cno) {
		return (Content) session.selectOne("contentns.selectView", cno);
	}
	
	// 검색
	public List<Content> search(String srch) {
		return session.selectList("contentns.search", srch);
	}
	
	// 드라마 paging total
	public int getTotalD() {
		return (int) session.selectOne("contentns.getTotalD");
	}
	
	// 영화 paging total
	public int getTotalM() {
		return (int) session.selectOne("contentns.getTotalM");
	}
	
	// 컨텐츠 리스트 통합 조회
	public List<Content> list() {
		return (List<Content>)session.selectList("contentns.selectList");
	}
	
	// 컨텐츠 드라마 TOP10 리스트 통합 조회
	public List<Content> topDlist() {
		return (List<Content>)session.selectList("contentns.selectDTopList");
	}
	
	// 컨텐츠 영화 TOP10 리스트 통합 조회 
	public List<Content> topMlist() { 
		return (List<Content>)session.selectList("contentns.selectMTopList"); 
	}
	
	// 컨텐츠 드라마 리스트 통합 조회
	public List<Content> Dlist(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectDList", hm);
	}

	// 컨텐츠 영화 리스트 통합 조회
	public List<Content> Mlist(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectMList", hm);
	}

	// 장르태그로 드라마 리스트 조회
	public List<Content> listDGenre(String[] genre) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("genre", genre);
		return session.selectList("contentns.selectDGenre", hm);
	}
	
	// 장르태그로 영화 리스트 조회
	public List<Content> listMGenre(String[] genre) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("genre", genre);
		return session.selectList("contentns.selectMGenre", hm);
	}
	
	// 내가 예매한 컨텐츠의 정보 조회
	public Content selectCno(List<Reservation> rs_cno) {
		return (Content) session.selectOne("contentns.selectCno", rs_cno);
	}
	
	// 마이페이지 - reservation에서 보여줄 cname 
	public List<Content> rs_cname(int mno) {
		return (List<Content>) session.selectList("contentns.rs_cname", mno);
	}
	
	// 마이페이지 - review에서 보여줄 cname 
	public Content selectRvno(int rvno) {
		return (Content) session.selectOne("contentns.selectRvno", rvno);
	}
	
	// 조회수 증가
	public void countUpdate(int cno) {
		session.update("contentns.countUpdate", cno);
	}
	
	// 관리자페이지 - 전체 paging total
	public int getTotal() {
		return (int) session.selectOne("contentns.getTotal");
	}
	
	// 관리자페이지 - 컨텐츠 리스트 통합 조회
	public List<Content> getTotalList(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectTotalList", hm);
	}
	
	// 관리자페이지 - 컨텐츠 등록
	public int insert(Content ct) {
		return session.insert("contentns.insert", ct);
	}
	
	// 관리자페이지 - 컨텐츠 등록 ( 이미지파일 이름 명명하기 위한 cno)
	public String selectNextCno() {
		return (String) session.selectOne("contentns.selectNextCno");
	}
	
	// 관리자페이지 - 컨텐츠 삭제
	public int delete(int cno) {
		return session.update("contentns.delete", cno);
	}
	
	// 관리자페이지 - 컨텐츠 삭제 철회
	public int delCancel(int cno) {
		return session.update("contentns.delCancel", cno);
	}
	
	// 관리자페이지 - 컨텐츠 수정용 정보 불러오기
	public Content adSelectView(int cno) {
		return (Content) session.selectOne("contentns.adSelectView", cno);
	}
	
	// 관리자페이지 - 컨텐츠 수정 업데이트 action
	public int update(Content ct) {
		return session.update("contentns.update", ct);
	}
	
	// 관리자페이지 - 컨텐츠 검색
	public List<Content> adSearch(String searchKey, String searchValue) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return session.selectList("contentns.adSearch", hm);
	}
}
