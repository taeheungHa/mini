package myShop.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myShop.qna.db.QnaBean;
import myShop.qna.db.QnaDAO;

public class QnaModifyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("euc-kr");
	   		
		 	QnaDAO qnadao=new QnaDAO();
	   		QnaBean qnadata=new QnaBean();
	   		
			int num=Integer.parseInt(request.getParameter("num"));
		   	qnadata=qnadao.getDetail(num);
		   	
		   	if(qnadata==null){
		   		System.out.println("(수정)상세보기 실패");
		   		return null;
		   	}
		   	System.out.println("(수정)상세보기 성공");
		   	
		   	request.setAttribute("qnadata", qnadata);
		   	forward.setRedirect(false);
	   		forward.setPath("./member/qna/qna_modify.jsp");
	   		return forward;
	 }
}