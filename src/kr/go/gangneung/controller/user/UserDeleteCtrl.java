package kr.go.gangneung.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.gangneung.model.UserDAO;

@WebServlet("/UserDelete.do")
public class UserDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		UserDAO dao = new UserDAO();
		int cnt = dao.userDelete(id);
		HttpSession ses = request.getSession();
		if(cnt>=1){
			ses.invalidate();
			response.sendRedirect(request.getContextPath());
		} else {
			ses.invalidate();
			response.sendRedirect("MyInfo.do");
		}
	}

}
