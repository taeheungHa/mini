package myShop.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myShop.qna.db.QnaDAO;
import myShop.qna.db.QnaBean;

 public class QnaDetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("euc-kr");
   		
		QnaDAO qnadao=new QnaDAO();
	   	QnaBean qnadata=new QnaBean();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		qnadao.setReadCountUpdate(num);
	   	qnadata=qnadao.getDetail(num);
	   	
	   	if(qnadata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("qnadata", qnadata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./member/qna/qna_view.jsp");
   		return forward;

	 }
}