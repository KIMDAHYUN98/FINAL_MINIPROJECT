package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardView implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'boardView.do' 글 상세보기 폼 이동
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setbNumber(Integer.parseInt(request.getParameter("bNumberRow")));
		
		vo = dao.boardSelect(vo);
		request.setAttribute("vo", vo);
		
		return "web/05-2boardView";
	}

}
