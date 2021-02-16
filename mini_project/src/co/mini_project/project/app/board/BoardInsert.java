package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'boardInsert.do' 글쓰기
		BoardVO vo = new BoardVO();
		BoardDAO dao = new BoardDAO();;
		vo.setbTitle(request.getParameter("bTitle"));
		vo.setbKind(request.getParameter("bKind"));
		vo.setbContent(request.getParameter("bContent"));
		vo.setmId(request.getParameter("mId"));
		
		dao.boardInsert(vo);
		
		return "board.do";
	}

}
