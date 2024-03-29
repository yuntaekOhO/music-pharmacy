package kr.board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.board.dao.FreeBoardDAO;
import kr.board.vo.FreeBoardReVO;
import kr.controller.Action;

public class FreeWriteReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,String> mapAjax = 
				              new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else {//로그인 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			//전송된 데이터를 반환받아서 VO에 저장
			FreeBoardReVO reply = new FreeBoardReVO();
			reply.setMem_num(user_num);//회원번호(작성자)
			reply.setFreply_content(request.getParameter("freply_content"));
			reply.setFree_num(Integer.parseInt(
					           request.getParameter("free_num")));
			
			FreeBoardDAO dao = FreeBoardDAO.getInstance();
			dao.insertReplyBoard(reply);
			
			mapAjax.put("result", "success");
		}
		
		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = 
				mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
