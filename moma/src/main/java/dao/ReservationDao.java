package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reservation;

public class ReservationDao {
	// singleton
	private static ReservationDao instance = new ReservationDao();
	private ReservationDao() {}
	public static ReservationDao getInstance() {
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
	//예매하기
	public int insert(Reservation reserve) {
		return session.insert("reservationns.insert", reserve);
	}
	//예매취소
	public int delete(int rsno) {
		return session.delete("reservationns.delete", rsno);
	}
	
	// 마이페이지 예매내역 조회
	public List<Reservation> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("reservationns.myList", hm);
	}
	
	// 마이페이지 총 예매내역 수
	public int getTotalMy(int mno) {
	    return (int) session.selectOne("reservationns.getTotalMy", mno);
	}
	
	// 마이페이지 내가 예약한 컨텐츠의 cno 조회 (mno로 cno조회)
	public  List<Reservation> selectCno(int mno) {
		return session.selectList("reservationns.selectCno", mno);
	}
		
}
