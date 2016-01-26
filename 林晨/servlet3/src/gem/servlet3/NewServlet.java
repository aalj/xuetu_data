package gem.servlet3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewServlet
 */
@WebServlet(name="MyServlet",loadOnStartup=3,urlPatterns={"/MySevelt1","/xyz/*"},
		initParams={@WebInitParam(name="userName",value="tom"),
			@WebInitParam(name="password",value="123456")})
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("ok");
		PrintWriter out = response.getWriter();
		//获得初始化参数
		ServletConfig config = this.getServletConfig();
		String userName = config.getInitParameter("userName");
		String pwd = config.getInitParameter("password");
		//全局初始化参数同前
		ServletContext context = this.getServletContext();
		String driver = context.getInitParameter("driverClass");
		out.println("<h2>Servlet 3新特性,"+userName+","+pwd+","+driver+"</h2>");
		out.flush();
		out.close();
		
	}

}
