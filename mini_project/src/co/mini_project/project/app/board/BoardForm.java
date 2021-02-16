package co.mini_project.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;

public class BoardForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 'boardForm.do' 새글쓰기 폼 이동
		
		return "web/05-3boardForm";
	}

}
