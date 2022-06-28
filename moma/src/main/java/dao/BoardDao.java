package dao;
import java.io.*;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	
	// mybatis
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			//System.out.println("왔냐?");
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// BoardMain.java 게시판 전체 목록
	public List<Board> list(int startRow, int endRow){
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
		return session.selectList("boardns.selectList", hm);
	}
	
	// BoardView.java 조회수 증가
	public void readcountUpdate(int bno) {
		session.update("boardns.readcountUpdate", bno);
	}
	
	// BoardView.java 게시글 조회
	public Board select(int bno) {
		return (Board) session.selectOne("boardns.selectOne", bno);
	}
	
	// AdminBoard.java 총 게시글 수
	public int getTotalB() {
		return (int) session.selectOne("boardns.getTotalB");
	}
	
	// BoardWriteResult.java 게시글 등록
	public int insert(Board board) {
		return session.insert("boardns.insert", board);
	}
	
	// BoardUpdateResult.java 게시글 수정
	public int update(Board board) {
		return session.update("boardns.update", board);
	}
	
	// BoardDelete.java 게시글 삭제
	public int delete(int bno) {
		return session.update("boardns.delete", bno);
	}
	}

	
