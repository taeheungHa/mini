package myShop.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myShop.qna.db.QnaDAO;
import myShop.qna.db.QnaBean;

public class QnaReplyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	request.setCharacterEncoding("euc-kr");
		 	ActionForward forward = new ActionForward();
		 	
			QnaDAO qnadao=new QnaDAO();
	   		QnaBean qnadata=new QnaBean();
	   		int result=0;
	   		
	   		qnadata.setGb_num(Integer.parseInt(request.getParameter("gb_num")));
	   		qnadata.setGb_name(request.getParameter("gb_name"));
	   		qnadata.setGb_passwd(request.getParameter("gb_passwd"));
	   		qnadata.setGb_title(request.getParameter("gb_title"));
	   		qnadata.setGb_contents(request.getParameter("gb_contents"));
	   		qnadata.setGb_re_ref(Integer.parseInt(request.getParameter("gb_re_ref")));
	   		qnadata.setGb_re_lev(Integer.parseInt(request.getParameter("gb_re_lev")));
	   		qnadata.setGb_re_seq(Integer.parseInt(request.getParameter("gb_re_seq")));
	   		
	   		result=qnadao.qnaReply(qnadata);
	   		if(result==0){
	   			System.out.println("답장 실패");
	   			return null;
	   		}
	   		System.out.println("답장 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./QnaDetailAction.bo?num="+result);
	   		return forward;
	}  	
}