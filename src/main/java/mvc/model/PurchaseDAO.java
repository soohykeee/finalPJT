package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class PurchaseDAO {
	
	private static PurchaseDAO instance;
	
	private PurchaseDAO() {
		
	}
	
	public static PurchaseDAO getInstance() {
		if(instance == null)
			instance = new PurchaseDAO();
		return instance;
	}
	
	public int getListCount(String userId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x=0;
		String sql;
		sql="SELECT count(*) FROM purchase WHERE userId = ?";
	
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 예외발생 : " + ex);
		} finally {			
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();												
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
		return x;
		
	}
	
	//purchase 테이블의 레코드 가져오기 
	public ArrayList<PurchaseDTO> getPurchaseList(String userId, String startDate, String endDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(userId);
		
		String sql;

		if(startDate == null && endDate == null)
			sql="SELECT * FROM purchase, product, member WHERE purchase.productId = product.p_id AND purchase.userId = member.id AND purchase.userId = ?";

		else
			sql="SELECT * FROM purchase, product, member WHERE purchase.productId = product.p_id AND purchase.purchaseDate between '" + startDate + "' AND '" + endDate + "' AND purchase.userId = member.id AND purchase.userId = ?";
		
		ArrayList<PurchaseDTO> list = new ArrayList<PurchaseDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PurchaseDTO purchase = new PurchaseDTO();
				purchase.setPurchaseId(rs.getInt("purchaseId"));
				purchase.setUserId(rs.getString("userId"));
				purchase.setProductId(rs.getString("productId"));
				purchase.setShipName(rs.getString("shipName"));
				purchase.setShipAddress(rs.getString("shipAddress"));
				purchase.setShipPhone(rs.getString("shipPhone"));
				purchase.setPurchaseDate(rs.getString("purchaseDate"));
				purchase.setpName(rs.getString("p_name"));
				purchase.setpPrice(rs.getInt("p_unitPrice"));
				
				list.add(purchase);

			}			
		} catch (Exception ex) {
			System.out.println("getPurchaseList()예외발생: " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}			
		return list;
	}
	
	//member 테이블에서 로그인된 ID의 사용자명 가져오기 
	public String getLoginNameById(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String name=null;
		String sql = "select name from member where id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				name = rs.getString("name");	
			
			return name;
		} catch (Exception ex) {
			System.out.println("getLoginNameById() 예외발생 : " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	//member 테이블에서 로그인된 ID의 사용자명 가져오기 
	public String getLoginPhoneById(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String phone=null;
		String sql = "select phone from member where id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				phone = rs.getString("phone");	
			
			return phone;
		} catch (Exception ex) {
			System.out.println("getLoginPhoneById() 예외발생 : " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	//member 테이블에서 로그인된 ID의 사용자명 가져오기 
	public String getLoginAddressById(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String address=null;
		String sql = "select address from member where id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				address = rs.getString("address");	
			
			return address;
		} catch (Exception ex) {
			System.out.println("getLoginAddressById() 예외발생 : " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	//product 테이블에 주문하는 상품의 상품명 가져오기
	public String getProductNameByPId(String productId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String pName=null;
		String sql = "select p_name from product where p_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				pName = rs.getString("p_name");	
			
			return pName;
		} catch (Exception ex) {
			System.out.println("getProductNameByPId() 예외발생 : " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	//product 테이블에 주문하는 상품의 상품명 가져오기
	public int getProductPriceByPId(String productId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		int pPrice=0;
		String sql = "select p_unitPrice from product where p_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				pPrice = rs.getInt("p_unitPrice");	
			
			return pPrice;
		} catch (Exception ex) {
			System.out.println("getProductPriceByPId() 예외발생 : " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return 0;
	}
	
	//purchase 테이블에 새로운 글 삽입하기 
	public void insertPurchase(PurchaseDTO purchase)  {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();		

			String sql = "insert into purchase(userId, productId, shipName, shipAddress, shipPhone, purchaseDate) values(?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, purchase.getUserId());
			pstmt.setString(2, purchase.getProductId());
			pstmt.setString(3, purchase.getShipName());
			pstmt.setString(4, purchase.getShipAddress());
			pstmt.setString(5, purchase.getShipPhone());
			pstmt.setString(6, purchase.getPurchaseDate());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertPurchase() 예외발생 : " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	} 
	
	//선택된 주문 상세내용 가져오기
	public PurchaseDTO getPurchaseByPurchaseId(int purchaseId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PurchaseDTO purchase = null;

		String sql="SELECT * FROM purchase, product, member WHERE purchase.productId = product.p_id AND purchase.userId = member.id AND purchase.purchaseId = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, purchaseId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				purchase = new PurchaseDTO();
				purchase.setPurchaseId(rs.getInt("purchaseId"));
				purchase.setUserId(rs.getString("userId"));
				purchase.setProductId(rs.getString("productId"));
				purchase.setShipName(rs.getString("shipName"));
				purchase.setShipAddress(rs.getString("shipAddress"));
				purchase.setShipPhone(rs.getString("shipPhone"));
				purchase.setPurchaseDate(rs.getString("purchaseDate"));
				purchase.setpName(rs.getString("p_name"));
				purchase.setpPrice(rs.getInt("p_unitPrice"));
				purchase.setuName(rs.getString("name"));
				purchase.setuPhone(rs.getString("phone"));
				purchase.setuAddress(rs.getString("address"));
				
			}
			
			return purchase;
		} catch (Exception ex) {
			System.out.println("getPurchaseByPurchaseId() 예외발생 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	//선택된 주문 삭제하기
	public void deletePurchase(int purchaseId) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from purchase where purchaseId=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, purchaseId);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deletePurchase() 예외발생 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}
	

}
