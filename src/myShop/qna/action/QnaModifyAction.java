package myShop.qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myShop.qna.db.*;

 public class QnaModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("euc-kr");
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("gb_num"));
		 
		 QnaDAO qnadao=new QnaDAO();
		 QnaBean qnadata=new QnaBean();
		 
		 boolean usercheck=qnadao.isQnaWriter(num, request.getParameter("gb_passwd"));
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./QnaList.bo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		 try{
			 qnadata.setGb_num(num);
			 qnadata.setGb_title(request.getParameter("gb_title"));
			 qnadata.setGb_contents(request.getParameter("gb_contents"));
			 
			 result = qnadao.qnaModify(qnadata);
			 if(result==false){
		   		System.out.println("게시판 수정 실패");
		   		return null;
		   	 }
		   	 System.out.println("게시판 수정 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("./QnaDetailAction.bo?num="+qnadata.getGb_num());
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}