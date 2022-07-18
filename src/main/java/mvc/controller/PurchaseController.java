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
import mvc.model.PurchaseDAO;
import mvc.model.PurchaseDTO;

public class PurchaseController extends HttpServlet{
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
	
		if (command.equals("/PurchaseListAction.doPu")) {//주문한 상품 목록 페이지 출력
			requestPurchaseList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/purchaseList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/PurchaseDeleteAction.doPu")) { //주문 삭제(취소) 처리 
			requestPurchaseDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/PurchaseListAction.doPu");
			rd.forward(request, response);				
		} else if (command.equals("/PurchaseAddForm.doPu")) { // 주문 페이지 출력
			requestLoginInfo(request);
			requestProductInfo(request);
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/purchaseAddForm.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/PurchaseAddAction.doPu")) { // 주문 추가 처리
			requestPurchaseAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/thankPurchase.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/PurchaseCartAddForm.doPu")) { // 장바구니 제품 주문 페이지 출력 
			requestLoginInfo(request);
			requestCartInfo(request);
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/cartToPurchaseAdd.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/PurchaseCartAddAction.doPu")) { // 장바구니 제품 주문 추가 처리
			requestPurchaseCartAdd(request);
			clearCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/thankPurchase.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/PurchaseViewAction.doPu")) {// 선택한 주문 페이지에 보여주기 처리
			requestPurchaseView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/PurchaseView.doPu");
			rd.forward(request, response);						
		} else if (command.equals("/PurchaseView.doPu")) { //선택한 주문 보여주기
			RequestDispatcher rd = request.getRequestDispatcher("./purchase/purchaseInfo.jsp");
			rd.forward(request, response);	
		}
		
		
	}
	
	// 주문한 상품 목록 가져요기
	public void requestPurchaseList(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		PurchaseDAO dao = PurchaseDAO.getInstance();
		List<PurchaseDTO> purchaselist = new ArrayList<PurchaseDTO>();
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int total_record=dao.getListCount(id);
		
		purchaselist = dao.getPurchaseList(id, startDate, endDate); 
		
		request.setAttribute("total_record",total_record);
		request.setAttribute("purchaselist", purchaselist);	
		
	}
	
	//로그인 정보 가져오기
	public void requestLoginInfo(HttpServletRequest request){
					
		String userId = request.getParameter("id");
		
		PurchaseDAO  dao = PurchaseDAO.getInstance();
		
		String name = dao.getLoginNameById(userId);
		String phone = dao.getLoginPhoneById(userId);
		String address = dao.getLoginAddressById(userId);
		
		request.setAttribute("name", name);									
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
	}
	
	//주문할 제품 정보 가져오기
	public void requestProductInfo(HttpServletRequest request) {
		
		String productId = request.getParameter("pid");
		
		PurchaseDAO dao = PurchaseDAO.getInstance();
		
		String pName = dao.getProductNameByPId(productId);
		int pPrice = dao.getProductPriceByPId(productId);
		
		request.setAttribute("pId", productId);
		request.setAttribute("pName", pName);
		request.setAttribute("pPrice", pPrice);
		
	}
	
	// 주문 작성 요청 처리
	public void requestPurchaseAdd(HttpServletRequest request){
					
		PurchaseDAO dao = PurchaseDAO.getInstance();
		
		PurchaseDTO purchase = new PurchaseDTO();
		
		purchase.setUserId(request.getParameter("userId"));
		purchase.setProductId(request.getParameter("productId"));
		purchase.setShipName(request.getParameter("shipName"));
		purchase.setShipAddress(request.getParameter("shipAddress"));
		purchase.setShipPhone(request.getParameter("shipPhone"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String regist_day = formatter.format(new java.util.Date());
		purchase.setPurchaseDate(regist_day);
		
		dao.insertPurchase(purchase);				
	}
	
	//주문 전체 목록 요청 처리
	public void requestPurchaseView(HttpServletRequest request){
					
		PurchaseDAO dao = PurchaseDAO.getInstance();
		int purchaseId = Integer.parseInt(request.getParameter("purchaseId"));
		
		PurchaseDTO purchase = new PurchaseDTO();
		purchase = dao.getPurchaseByPurchaseId(purchaseId);		
		
		request.setAttribute("purchaseId", purchaseId);		 
   		request.setAttribute("purchase", purchase);   									
	}
	
	//주문 삭제 요청 처리
	public void requestPurchaseDelete(HttpServletRequest request){
					
		int purchaseId = Integer.parseInt(request.getParameter("purchaseId"));
		
		PurchaseDAO dao = PurchaseDAO.getInstance();
		dao.deletePurchase(purchaseId);							
	}
	
	public void requestCartInfo(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		CartDAO cartDAO = CartDAO.getInstance();
		List<CartDTO> cartlist = new ArrayList<CartDTO>();
		
		int total_record=cartDAO.getListCount(id);
		cartlist = cartDAO.getCartList(id); 
		
		request.setAttribute("total_record",total_record);
		request.setAttribute("cartlist", cartlist);	
		
	}
	
	// 장바구니 제품 주문 추가 처리
	public void requestPurchaseCartAdd(HttpServletRequest request) {
		
		// 장바구니 제품을 가져오는 list
		String id = request.getParameter("id");
		CartDAO cartDAO = CartDAO.getInstance();
		List<CartDTO> cartlist = new ArrayList<CartDTO>();
		cartlist = cartDAO.getCartList(id); 
		
		// 가져온 list를 저장
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String regist_day = formatter.format(new java.util.Date());
		
		PurchaseDAO purchaseDAO = PurchaseDAO.getInstance();
		List<PurchaseDTO> purchaselist = new ArrayList<PurchaseDTO>();
		
		for(int i=0; i<cartlist.size(); i++) {
			
			PurchaseDTO dto = new PurchaseDTO();
			dto.setUserId(cartlist.get(i).getUserId());
			dto.setProductId(cartlist.get(i).getProductId());
			dto.setShipName(request.getParameter("shipName"));
			dto.setShipAddress(request.getParameter("shipAddress"));
			dto.setShipPhone(request.getParameter("shipPhone"));
			dto.setPurchaseDate(regist_day);
			
			purchaselist.add(i, dto);
			purchaseDAO.insertPurchase(purchaselist.get(i));
		}
		
	}
	
	//주문 완료한 장바구니 삭제 처리
	public void clearCart(HttpServletRequest request){
					
		String userId = request.getParameter("id");
		
		CartDAO dao = CartDAO.getInstance();
		dao.deleteAllCarts(userId);						
	}	

}
