package myShop.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import myShop.qna.db.*;



public class QnaWriteAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		QnaDAO qnadao=new QnaDAO();
	   	QnaBean qnadata=new QnaBean();
	   	ActionForward forward=new ActionForward();
	   	
		String realFolder="";
   		String saveFolder="qnaupload";
   		
   		int fileSize=5*1024*1024;
   		
   		realFolder=request.getRealPath(saveFolder);
   		
   		boolean result=false;
   		
   		try{
   			
   			MultipartRequest multi=null;
   			
   			multi=new MultipartRequest(request,
   					realFolder,
   					fileSize,
   					"euc-kr",
   					new DefaultFileRenamePolicy());
   			
   			qnadata.setGb_name(multi.getParameter("gb_name"));
   			qnadata.setGb_passwd(multi.getParameter("gb_passwd"));
	   		qnadata.setGb_title(multi.getParameter("gb_title"));
	   		qnadata.setGb_contents(multi.getParameter("gb_contents"));
	   		qnadata.setGb_file(
	   				multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		
	   		result=qnadao.QnaInsert(qnadata);
	   		
	   		if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./QnaList.bo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}