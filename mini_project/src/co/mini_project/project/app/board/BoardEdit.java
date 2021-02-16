package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardEdit implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'boardEdit.do' 글쓰기 수정
		BoardVO vo = new BoardVO();
		BoardDAO dao = new BoardDAO();	
		vo.setbTitle(request.getParameter("bTitle"));
		vo.setbKind(request.getParameter("bKind"));
		vo.setbContent(request.getParameter("bContent"));
		vo.setbNumber(Integer.parseInt(request.getParameter("bNumber")));

		dao.boardEdit(vo);
		
		return "board.do";
	}

}
