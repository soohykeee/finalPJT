package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.ProductDAO;
import mvc.model.ProductDTO;

public class ProductController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// admin
		if(command.equals("/ProductAdminListAction.doPr")) {	// 제품 관리 페이지 출력 (관리자)
			requestProductList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./admin/adminPage.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductAdminWriteForm.doPr")) { // 제품 등록 페이지 출력 (관리자)
			RequestDispatcher rd = request.getRequestDispatcher("./admin/adminAddProduct.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/ProductAdminWriteAction.doPr")) {// 새 제품을 추가 처리 (관리자)
				requestProductWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/ProductAdminListAction.doPr");
				rd.forward(request, response);						
		} else if (command.equals("/ProductAdminViewAction.doPr")) {// 선택한 제품을 페이지에 보여주기 처리 (관리자)
				requestProductView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/ProductAdminView.doPr");
				rd.forward(request, response);						
		} else if (command.equals("/ProductAdminView.doPr")) { //선택한 제품 보여주기 (관리자)
				RequestDispatcher rd = request.getRequestDispatcher("./admin/adminView.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/ProductAdminUpdateAction.doPr")) { //선택된 제품 수정하기 (관리자) 
				requestProductUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/ProductAdminListAction.doPr");
				rd.forward(request, response);
		} else if (command.equals("/ProductAdminDeleteAction.doPr")) { //현재 제품 삭제 처리 (관리자)
				requestProductDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/ProductAdminListAction.doPr");
				rd.forward(request, response);				
		} 
		
		// client
		else if (command.equals("/ProductViewAction.doPr")) {// 선택한 제품을 페이지에 보여주기 처리 (고객)
			requestProductView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductView.doPr");
			rd.forward(request, response);						
		} else if (command.equals("/ProductView.doPr")) { //선택한 제품 보여주기 (고객)
			RequestDispatcher rd = request.getRequestDispatcher("./product.jsp");
			rd.forward(request, response);	
		} else if (command.equals("/ProductSearchListAction.doPr")) { //검색한 제품 보여주기
			requestSearchProductView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./productList.jsp");
			rd.forward(request, response);	
		} 
		
		
	}
	
	//등록된 글 목록 가져오기
	public void requestProductList(HttpServletRequest request){
			
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		productlist = dao.getProductList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("productlist", productlist);								
	}
	
	//로그인 이름 가져오기
	public void requestLoginName(HttpServletRequest request){
					
		String id = request.getParameter("id");
		
		ProductDAO dao = ProductDAO.getInstance();
		
		String name = dao.getLoginNameById(id);		
		
		request.setAttribute("name", name);									
	}

	// 게시판 글쓰기 요청 처리
	public void requestProductWrite(HttpServletRequest request) throws IOException {
					
		ProductDAO dao = ProductDAO.getInstance();		
		ProductDTO product = new ProductDTO();
		
		String filename = "";
		String realFolder = "C:\\Users\\gur20\\OneDrive\\바탕 화면\\Programming\\Eclipse-web-workspace\\finalPJT\\src\\main\\WebContent\\resources\\images";
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = null;
		String fileName = null;
		
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String brand = multi.getParameter("brand");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String size = multi.getParameter("size");
		
		Integer price;
		if(unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		long stock;
		if(unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		fileName = multi.getFilesystemName(fname);
		
		product.setProductId(productId);
		product.setName(name);
		product.setUnitPrice(price);
		product.setDescription(description);
		product.setBrand(brand);
		product.setCategory(category);
		product.setUnitsInStock(stock);
		product.setSize(size);
		product.setFileName(fileName);
	
		dao.insertProduct(product);								
	}
	
	//제품 전체 목록 요청 처리
	public void requestProductView(HttpServletRequest request){
					
		ProductDAO dao = ProductDAO.getInstance();
		String pid = request.getParameter("pid");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		ProductDTO product = new ProductDTO();
		product = dao.getProductByPid(pid, pageNum);		
		
		request.setAttribute("pid", pid);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("product", product);   									
	}
	
	//제품 수정 요청 처리
	public void requestProductUpdate(HttpServletRequest request) throws IOException {
					
		String str = request.getParameter("pid").substring(request.getParameter("pid").lastIndexOf("P")+1);
		int pid = Integer.parseInt(str);
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		ProductDAO dao = ProductDAO.getInstance();		
		ProductDTO product = new ProductDTO();		
		
		String filename = "";
		String realFolder = "C:\\Users\\gur20\\OneDrive\\바탕 화면\\Programming\\Eclipse-web-workspace\\finalPJT\\src\\main\\WebContent\\resources\\images";
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = null;
		String fileName = null;
		
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String brand = multi.getParameter("brand");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String size = multi.getParameter("size");
		
		Integer price;
		if(unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		long stock;
		if(unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		fileName = multi.getFilesystemName(fname);
		
		product.setProductId(productId);
		product.setName(name);
		product.setUnitPrice(price);
		product.setDescription(description);
		product.setBrand(brand);
		product.setCategory(category);
		product.setUnitsInStock(stock);
		product.setSize(size);
		product.setFileName(fileName);
		
		dao.updateProduct(product);								
	
	}
	//게시판 글 삭제 요청 처리
	public void requestProductDelete(HttpServletRequest request){
					
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.deleteProduct(request.getParameter("pid"));							
	}	
	
	//검색한 상품 목록 가져오기
	public void requestSearchProductView(HttpServletRequest request){
			
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();
		
	  	String searchWord="";
		
		if(request.getParameter("searchWord")!=null)
			searchWord=request.getParameter("searchWord");
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getSearchListCount(searchWord);
		productlist = dao.getSearchProductList(searchWord); 
		
		
   		request.setAttribute("searchWord", searchWord);		  
		request.setAttribute("total_record",total_record); 
		request.setAttribute("productlist", productlist);								
	}

}
