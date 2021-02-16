package co.mini_project.project.app.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.dao.StoreDAO;
import co.mini_project.project.vo.StoreVO;


@WebServlet("/StoreListServlet")
public class StoreListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public StoreListServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=UTF-8");
		StoreDAO dao = new StoreDAO();
		ArrayList<StoreVO> list = dao.selectList();
		PrintWriter out = response.getWriter();
		
		String json = "[";
		int cnt = 1;
		for(StoreVO svo : list) {
			json += "{";
			json += "\"sNumber\":\"" + svo.getsNumber() + "\"";
			json += ",\"sName\":\"" + svo.getsName() + "\"";
			json += ",\"sTel\":\"" + svo.getsTel() + "\"";
			json += ",\"sAddress\":\"" + svo.getsAddress() + "\"";
			json += ",\"sContent\":\"" + svo.getsContent() + "\"";
			json += ",\"sImage\":\"" + svo.getsImage() + "\"";
			json += "}";
			if(list.size() != cnt++ ) {
				json += ",";
			}
		}
			json += "]";
			response.getWriter().append(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
