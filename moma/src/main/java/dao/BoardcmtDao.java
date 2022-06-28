package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.Boardcmt;

public class BoardcmtDao {
	private static BoardcmtDao instance = new BoardcmtDao();
	private BoardcmtDao() { }
	public static BoardcmtDao getInstance() {
		return instance;}
	
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

	// BoardView.java 각 게시글의 댓글 수
	public int count(int bno) {
		return (int) session.selectOne("boardcmtns.count", bno);
	}
	
	//BoardCmtWrite.java 댓글 입력
	public int insertComment(Boardcmt cmt) {
		return session.insert("boardcmtns.insert",cmt);
	}

	//BoardView.java 게시글 댓글 목록
	public List<Boardcmt> list(int bno) {
		return (List<Boardcmt>)session.selectList("boardcmtns.cmtlist",bno);
	}
	
	//BoardCmtDelete.java 댓글 삭제
	public int delete(int bcno) {
		return session.update("boardcmtns.delete",bcno);
	}
	
	//AdBoardCmt.java 총 댓글 갯수
	public int getTotalB() {
		return (int) session.selectOne("boardcmtns.getTotalB");
	}
	
	//AdBoardCmt.java 총 댓글 전체 목록
	public List<Board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
		return session.selectList("boardcmtns.cmtTotallist", hm);
	}
	
}
