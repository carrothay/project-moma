package service.content;


import java.text.*;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import dao.ReservationDao;
import model.Content;
import model.Reservation;
import service.CommandProcess;

public class ReserveAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("ReserveAction 자바파일 지나감");
		
		String rsdate = request.getParameter("rsdate");
		//System.out.println("rsdate="+rsdate);
		int cno = Integer.parseInt(request.getParameter("cno"));
		//System.out.println("cno="+cno);
		int mno = Integer.parseInt(request.getParameter("mno"));
		//System.out.println("mno="+mno);
		String rstime = request.getParameter("rstime");
		//System.out.println("rstime="+rstime);
		int rsnum = Integer.parseInt(request.getParameter("rsnum"));
		//System.out.println("rsnum="+rsnum);
		String cinema = request.getParameter("cinema");
		//System.out.println("cinema="+cinema);
		String payment = request.getParameter("payment");
		//System.out.println("payment="+payment);
		int price = Integer.parseInt(request.getParameter("price"));
		//System.out.println("price="+price);
		
		ContentDao cd = ContentDao.getInstance();
		Content ct = cd.select(cno);
		
		Reservation reserve = new Reservation();
		reserve.setCno(cno);
		reserve.setMno(mno);
		reserve.setRsdate(java.sql.Date.valueOf(rsdate));
		reserve.setCinema(cinema);
		reserve.setPayment(payment);
		reserve.setPrice(price);
		reserve.setRstime(rstime);
		reserve.setRsnum(rsnum);
		
		ReservationDao rv = ReservationDao.getInstance();
		int result = rv.insert(reserve);
		
		request.setAttribute("result", result);
		//System.out.println("ReserveAction 자바파일 지나감22");
		
		return "reserveAction";
	}

}
