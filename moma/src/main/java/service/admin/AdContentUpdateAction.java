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

public class AdContentUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("updateAction 자바파일 지나간당");
		int cno = Integer.parseInt(request.getParameter("cno"));
		ContentDao cd = ContentDao.getInstance();
		Content ct = new Content();
		
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
			
			if (fileName != null) {
			int dot = fileName.lastIndexOf("."); //파일 확장자 위치
			String ext = fileName.substring(dot);
			
			// 파일명 변경하기
			String newFileName = cno+ext;
			//System.out.println("newFileName="+newFileName);
			
			//업로드 후 파일명 수정
			File oldFile = new File(savePath+'/'+fileName);
			File newFile = new File(savePath+'/'+newFileName);
			
			if (newFile.exists()) {
				if (newFile.delete()) {
					System.out.println("기존 파일 삭제 성공");
				} else {
					System.out.println("기존 파일 삭제 실패");
				}
			} else {
				System.out.println("기존 파일이 존재하지 않습니다.");
			}
			
			oldFile.renameTo(newFile);
			
			ct.setPoster(newFileName);
			System.out.println("newFileName="+newFileName);
			}
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

			for (int g=0; g<genre.length; g++) {
				if(g== genre.length-1) {
					genres += genre[g];
				} else {
					genres += genre[g]+"/";
				}
			}
			ct.setGenre(genres);
			//System.out.println("genres="+genres);
			
			// 입력받은 데이터 세팅
			ct.setCname(cname);
			//System.out.println("cname="+cname);
			ct.setSort(sort);
			//System.out.println("sort="+sort);
			ct.setClevel(clevel);
			//System.out.println("clevel="+clevel);
			ct.setHours(hours);
			//System.out.println("hours="+hours);
			ct.setStart_date(start_date);
			//System.out.println("start_date="+start_date);
			ct.setNetflix(netflix);
			//System.out.println("netflix="+netflix);
			ct.setWatcha(watcha);
			//System.out.println("watcha="+watcha);
			ct.setTving(tving);
			//System.out.println("tving="+tving);
			ct.setDirector(director);
			//System.out.println("director="+director);
			ct.setActor(actor);
			//System.out.println("actor="+actor);
			ct.setReserve(reserve);
			//System.out.println("reserve="+reserve);


		
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		ct.setCno(cno);
		int result = cd.update(ct);
		
		System.out.println("updateAction 자바파일 지나간당");
		request.setAttribute("result", result);
		
		return "adContentUpdateAction";
	}

}
