package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'boardDelete.do' 게시판 삭제
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setbNumber(Integer.parseInt(request.getParameter("bNumberD")));

		dao.boardDelete(vo);

		return "board.do";
	}

}
