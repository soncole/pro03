package kr.go.gangneung.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.gangneung.dto.Category;
import kr.go.gangneung.model.BoardDAO;

import org.json.JSONObject;


@WebServlet("/CategoryLoading.do")
public class CategoryLoadingCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate1 = request.getParameter("cate1");
		String msg = "새로운 분류 카테고리를 로딩합니다.";
		
		BoardDAO dao = new BoardDAO();
		ArrayList<Category> ctList = dao.getSecondCategoryList(cate1); 
		
		request.setAttribute("ctList", ctList);
		request.setAttribute("msg", msg);
		System.out.println(cate1);
		System.out.println(msg);
		
		response.setContentType("text/html; charset=UTF-8");
		JSONObject json = new JSONObject();
		json.put("ctList", ctList);
		json.put("msg", msg);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
}