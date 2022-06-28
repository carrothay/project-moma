package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

//.so로 끝나는 url 처리
@WebServlet(urlPatterns = "*.so", initParams = {@WebInitParam(name = "config", value = "/WEB-INF/command_so.properties") })
public class ControllerSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config");
		// props : "/WEB-INF/command_so.properties"
		Properties pr = new Properties();
		// Java 11장 Properties클래스의 특징 키=값을 가진 Map을 구현
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			// configFilePath 실제 사용할 위치에 있는 이름
			f = new FileInputStream(configFilePath);
			pr.load(f);
			// pr은 command_so.properties라는 file의 데이터를 사용
		} catch (IOException e) { throw new ServletException(e);
		} finally {
			if (f != null)
				try {	f.close();
				} catch (IOException ex) {}
		}
		Iterator<Object> keyIter = pr.keySet().iterator();
		// message.so, color.so
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();   // 키가져옴
			// command : message.so
			String className = pr.getProperty(command);  // 값가져옴
			try {
				Class<?> commandClass = Class.forName(className);
				// commandClass : service.Message 클래스
				//Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
				Object commandInstance = commandClass.newInstance(); //수정-하영
				// commandInstance : service.Message객체
				commandMap.put(command, commandInstance);
				// commandMap에는
				// key가 message.do
				// 값이 Message객체
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try { 
			String command = request.getRequestURI();
			// command : /ch13/message.do
			// request.getContextPath() : /ch13
			// request.getContextPath().length()+1 : 6
			command = command.substring(request.getContextPath().length() + 1);
			// command : message.do
			System.out.println("command="+command);
			com = (CommandProcess) commandMap.get(command);
			// com : service.Message객체를 CommandProcess로 형변환
			// 자식 즉 Message객체의 requestPro()메소드 실행
			System.out.println("com="+com);
			view = com.requestPro(request, response);
			// view는 "message.jsp" 문자
		} catch (Throwable e) {	throw new ServletException(e); }
		//RequestDispatcher dispatcher = request.getRequestDispatcher(view+".jsp"); // 파일 경로 설정
		RequestDispatcher dispatcher = request.getRequestDispatcher(view+".jsp"); // 파일 경로 재설정-하영
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
