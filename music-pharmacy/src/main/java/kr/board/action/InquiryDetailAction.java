package kr.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.InquiryBoardDAO;
import kr.board.vo.InquiryBoardVO;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.util.StringUtil;

public class InquiryDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int[] arr = null;
		//글번호 반환
		int board_num = Integer.parseInt(request.getParameter("inq_num"));
		InquiryBoardDAO dao = InquiryBoardDAO.getInstance();
		
		//이전 글, 다음 글 번호 저장
		arr = dao.getPreOrNextBoard(board_num);
		
		//글상세 정보 반환
		InquiryBoardVO board = dao.getBoard(board_num);
		int mem_num = board.getMem_num();

		board.setInq_question(StringUtil.useBrNoHtml(board.getInq_question()));
		board.setInq_answer(StringUtil.useBrNoHtml(board.getInq_answer()));
		
		MemberDAO memberDao = MemberDAO.getInstance();
		MemberVO member = memberDao.getMember(mem_num);

		//이전,다음글 정보 반환
		InquiryBoardVO preBoard = dao.getBoard(arr[0]);
		if(preBoard!=null) {
			preBoard.setInq_question(StringUtil.shortWords(15,preBoard.getInq_question()));
		}
		
		InquiryBoardVO nextBoard = dao.getBoard(arr[1]);
		if(nextBoard!=null) {
			nextBoard.setInq_question(StringUtil.shortWords(15,nextBoard.getInq_question()));
		}
		
		request.setAttribute("board", board);
		request.setAttribute("member", member);
		request.setAttribute("pre_board", preBoard);
		request.setAttribute("next_board", nextBoard);
		
		return "/WEB-INF/views/board/inquiryDetail.jsp";
	}

}
