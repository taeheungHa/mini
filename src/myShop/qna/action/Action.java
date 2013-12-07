package myShop.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myShop.qna.action.*;

public interface Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
