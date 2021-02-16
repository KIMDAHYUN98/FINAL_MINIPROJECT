package co.mini_project.project.app.franchise;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.dao.FranchiseDAO;
import co.mini_project.project.vo.FranchiseVO;
import co.mini_project.project.vo.StoreVO;


@WebServlet("/FranchiseListServlet")
public class FranchiseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FranchiseListServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=UTF-8");
		FranchiseDAO dao = new FranchiseDAO();
		ArrayList<FranchiseVO> list = dao.selectList();
		PrintWriter out = response.getWriter();
		
		String json = "[";
		int cnt = 1;
		for(FranchiseVO fvo : list) {
			json += "{";
			json += "\"fNumber\":\"" + fvo.getfNumber() + "\"";
			json += ",\"fName\":\"" + fvo.getfName() + "\"";
			json += ",\"fEmail\":\"" + fvo.getfEmail() + "\"";
			json += ",\"fAge\":\"" + fvo.getfAge() + "\"";
			json += ",\"fTel\":\"" + fvo.getfTel() + "\"";
			json += ",\"fAddress\":\"" + fvo.getfAddress() + "\"";
			json += ",\"fContent\":\"" + fvo.getfContent() + "\"";
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
