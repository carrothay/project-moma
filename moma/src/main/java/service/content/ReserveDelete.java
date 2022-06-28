package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import service.CommandProcess;

public class ReserveDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		
		ReservationDao rd = ReservationDao.getInstance();
		int result = rd.delete(rsno);
		
		request.setAttribute("result", result);
		
		return "reserveDelete";
	}

}
