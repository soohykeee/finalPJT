package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.CartDAO;
import mvc.model.CartDTO;

public class CartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if (command.equals("/CartListAction.doCa")) {// 장바구니 목록 페이지 출력
			requestCartList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./cart/cartList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/CartDeleteAction.doCa")) { //현재 장바구니 삭제 처리 
			requestCartDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/CartListAction.doCa");
			rd.forward(request, response);				
		} else if (command.equals("/CartAllDeleteAction.doCa")) { //전체 장바구니 삭제 처리 
			requestCartAllDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/CartListAction.doCa");
			rd.forward(request, response);				
		} else if (command.equals("/CartAddAction.doCa")) { // 상품 장바구니에 담기(추가)
			requestCartAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("./shop.jsp");
			rd.forward(request, response);				
		} 
		
	}
	
	//등록된 장바구니 목록 가져오기
	public void requestCartList(HttpServletRequest request){
			
		String id = request.getParameter("id");
		CartDAO dao = CartDAO.getInstance();
		List<CartDTO> cartlist = new ArrayList<CartDTO>();
		
		int total_record=dao.getListCount(id);
		cartlist = dao.getCartList(id); 
		
		request.setAttribute("total_record",total_record);
		request.setAttribute("cartlist", cartlist);						
	}
	
	//선택된 장바구니 삭제 요청 처리
	public void requestCartDelete(HttpServletRequest request){
					
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		
		CartDAO dao = CartDAO.getInstance();
		dao.deleteCart(cartId);	
	}	
	
	//전체 장바구니 삭제 요청 처리
	public void requestCartAllDelete(HttpServletRequest request){
					
		String userId = request.getParameter("userId");
		
		CartDAO dao = CartDAO.getInstance();
		dao.deleteAllCarts(userId);						
	}	
	
	//장바구니에 상품 추가
	public void requestCartAdd(HttpServletRequest request) {
		
		String productId = request.getParameter("productId");
		String userId = request.getParameter("userId");
		
		CartDAO dao = CartDAO.getInstance();

		dao.addCart(userId, productId);
	}

}
