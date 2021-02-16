package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardEditForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'boardEditForm.do' 글쓰기 폼 이동
		BoardVO vo = new BoardVO();
		BoardDAO dao = new BoardDAO();
		vo.setbNumber(Integer.parseInt(request.getParameter("bNumber")));
		System.out.println(Integer.parseInt(request.getParameter("bNumber")));
		
		vo = dao.boardSelect(vo);
		request.setAttribute("vo", vo);
		
		return "web/05-4boardEditForm";
	}

}
