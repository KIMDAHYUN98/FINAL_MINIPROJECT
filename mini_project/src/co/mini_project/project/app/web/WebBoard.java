package co.mini_project.project.app.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class WebBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 'board.do'
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardDAO dao = new BoardDAO();
		
		list = dao.boardList();
		request.setAttribute("board", list);
		
		return "web/05-1board";
	}

}
