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
@WebServlet(urlPatterns = "*.bb",
	initParams = {@WebInitParam(name = "config", value = "/WEB-INF/command_bb.properties") })
public class ControllerBb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> commandMap = new HashMap<>();
	
	public void init(ServletConfig config) throws ServletException {
	//  init method는 doGet() 또는 doPost() 메서드 하기전에 실행할 메서드
		
		String props = config.getInitParameter("config");
		// props : /WEB-INF/command_bb.properties이 된다.
		
		Properties pr = new Properties();
		// Properties클래스의 특징 키=값을 가짐. 파일을 불러오기 위해 pr객체 생성.
		
		FileInputStream f = null;
		// FileInputStream으로 properties 파일을 불러오기 위해 호출
		// FileInputStream클래스는? 자바에서 파일로부터 바이트단위로 입력할 수 있도록 하기 위해서 제공하는 클래스
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			// configFilePath 실제 사용할 위치에 있는 이름
			// FileInputStream으로 불러올 파일은 절대 경로가 필요하기 때문에 realpath를 구해야함.
			
			f = new FileInputStream(configFilePath);
			pr.load(f);
			// pr에는 command_bb.properties라는 file의 데이터를 사용
			// command_bb.properties의 views/member/loginForm.bb를 (key)로 service.member.LoginForm (value)로
			
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {	if (f != null)try{f.close();} catch (IOException ex) {}
		}
		
		
		Iterator<Object> keyIter = pr.keySet().iterator();
		// message.do, color.do
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			// command : message.do
			String className = pr.getProperty(command);
			// className : ch13.service.Message문자
			try {
				Class<?> commandClass = Class.forName(className);
				// commandClass : service.Message 클래스
				Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
				// commandInstance : service.Message객체
				commandMap.put(command, commandInstance);
				// commnadMap에는
				// key가 message.do
				// 값이 Message객체
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
			String view = null;
		    CommandProcess com=null;
		    try { // map key:message.do   Message객체
		    	  // url : http://localhost(ip번호):8080/ch13/message.do
		    	  String command = request.getRequestURI();
		    	  // command : /ch13/message.do
		    	  // request.getContextPath() : /ch13
		    	  // request.getContextPath().length()+1 : 6
		    	  System.out.println("command="+command);
		    	  command = command.substring(
			    		 request.getContextPath().length()+1);
		    	  // command : message.do
		          com = (CommandProcess)commandMap.get(command);
		          System.out.println("com="+com);
		          // com : service.Message객체를 CommandProcess로 형변환
		          // 자식 즉 Message객체의 requestPro()메소드 실행
		          view = com.requestPro(request, response);
		          // view는 "message.jsp" 문자
		    } catch(Throwable e) { throw new ServletException(e); } 
		    	  // view는 pgm article에 보여줄 프로그램
		    RequestDispatcher dispatcher =
		    		//아래 ()에서 view ===> "main.jsp?pgm="+view 로 변경함. 왜? 이미지 위에 nav를 보여주고 싶으니까.
		      	request.getRequestDispatcher(view+".jsp");
		   dispatcher.forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}