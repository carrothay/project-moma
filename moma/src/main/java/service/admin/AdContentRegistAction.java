package service.admin;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContentRegistAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ContentDao cd = ContentDao.getInstance();
		Content ct = new Content();
		
		//paging : start
		final int ROW_PER_PAGE = 10;  //한 페이지 10개씩
		// 페이지 총 개수
		int total = cd.getTotal();
		// Math.ceil : 현재 실수보다 큰 정수 
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		request.setAttribute("totalPage", totalPage);
		
		String nextCno = cd.selectNextCno();
		// file upload
		String savePath = request.getSession().getServletContext().getRealPath("/img/poster");   //업로드한 파일을 저장할 폴더
		int maxSize = 1024 * 1024 * 20; // 20MB 이미지 사이즈를 설정해줘야 함!
		
		try {
			String fileName=""; //파일명
			// 파일 업로드 하고나서 파일 명 가져오기
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration files = mr.getFileNames();
			String file = (String) files.nextElement();
			fileName = mr.getFilesystemName(file);
			
			int dot = fileName.lastIndexOf("."); //파일 확장자 위치
			String ext = fileName.substring(dot);
			
			// 파일명 변경하기
			String newFileName = nextCno+ext;
			
			//업로드 후 파일명 수정
			File oldFile = new File(savePath+'/'+fileName);
			File newFile = new File(savePath+'/'+newFileName);
						
			oldFile.renameTo(newFile);
			
			//System.out.println("rename oldFile="+oldFile);
			//System.out.println("rename newFile="+newFile);
			
			String cname = mr.getParameter("cname");
			String sort = mr.getParameter("sort");
			int clevel = Integer.parseInt(mr.getParameter("clevel"));
			String hours = mr.getParameter("hours");
			String start_date = mr.getParameter("start_date");
			String netflix = mr.getParameter("netflix");
			String watcha = mr.getParameter("watcha");
			String tving = mr.getParameter("tving");
			String director = mr.getParameter("director");
			String actor = mr.getParameter("actor");
			String reserve = mr.getParameter("reserve");
			
			// 장르 세팅
			String[] genre = mr.getParameterValues("genre");
			String genres="";
			
			if(genre!=null) {
			for (int g=0; g<genre.length; g++) {
				if(g== genre.length-1) {
					genres += genre[g];
				} else {
					genres += genre[g]+"/";
				}
			}
			ct.setGenre(genres);
			}
			// 입력받은 데이터 세팅
			ct.setCname(cname);
			ct.setSort(sort);
			ct.setClevel(clevel);
			ct.setHours(hours);
			ct.setStart_date(start_date);
			ct.setNetflix(netflix);
			ct.setWatcha(watcha);
			ct.setTving(tving);
			ct.setDirector(director);
			ct.setActor(actor);
			ct.setReserve(reserve);
			ct.setPoster(newFileName);
		
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		int result = cd.insert(ct);
		request.setAttribute("result", result);
		
		return "adContentRegistAction";
	}

}
