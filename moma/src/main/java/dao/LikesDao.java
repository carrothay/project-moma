package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Likes;

public class LikesDao {
	private static LikesDao instance = new LikesDao();

	private LikesDao() {
	}

	public static LikesDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			openSession(true) : 입력/삭제/수정 후에 commit
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 회원이 해당 컨텐츠에 좋아요 했는지 체크
	public Likes select(int cno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("cno", cno);
		hm.put("mno", mno);
		return (Likes) session.selectOne("likesns.select", hm);
	}

	
	// 좋아요 하면 insert
	public int insert1(Likes likes) {			
		return session.insert("likesns.insert1", likes);
	}

	// 좋아요 하면 insert
	public int delete1(Likes likes) {			
		return session.delete("likesns.delete1", likes);
	}
	
	
	// 좋아요 하면 insert
	public int insert(int cno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("cno", cno);
		hm.put("mno", mno);
		return session.insert("likesns.insert", hm);
	}

	// 좋아요 취소
	public int delete(int cno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("cno", cno);
		hm.put("mno", mno);
		return session.delete("likesns.delete", hm);
	}

	// 마이페이지 좋아요 조회
	public List<Likes> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("likesns.myList", hm);
	}
	
	// 마이페이지 - 좋아요 한 수
	public int getTotalMy(int mno) {
		return (int) session.selectOne("likesns.getTotalMy", mno);
	}

}

