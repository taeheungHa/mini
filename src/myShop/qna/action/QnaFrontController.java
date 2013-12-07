package myShop.qna.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myShop.qna.action.*;

public class QnaFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		
		 ActionForward forward=null;
		 Action action=null;
		 
		 if(command.equals("/QnaWrite.bo")){
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/qna/qna_write.jsp");
			}else if(command.equals("/QnaReplyAction.bo")){
				action = new QnaReplyAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/QnaDelete.bo")){
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/qna/qna_delete.jsp");
			}else if(command.equals("/QnaModify.bo")){
				action = new QnaModifyView();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		 	}else if(command.equals("/QnaWriteAction.bo")){
				action  = new QnaWriteAction();
				try {
					forward=action.execute(request, response );
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/QnaReplyView.bo")){
				action = new QnaReplyView();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/QnaModifyAction.bo")){
				action = new QnaModifyAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/QnaDeleteAction.bo")){
				action = new QnaDeleteAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/QnaList.bo")){
				action = new QnaListAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/QnaDetailAction.bo")){
				action = new QnaDetailAction();
				try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			}
		 }
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			doProcess(request,response);
		}  	
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			doProcess(request,response);
		}	  	 
		
		
	}
