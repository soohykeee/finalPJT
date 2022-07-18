package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class CartDAO {
	
	private static CartDAO instance;
	
	private CartDAO() {
		
	}
	
	public static CartDAO getInstance() {
		if(instance == null)
			instance = new CartDAO();
		return instance;
	}
	
	public int getListCount(String userId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x=0;
		String sql;
		sql="SELECT count(*) FROM cart WHERE userId = ?";
	
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
	
	//cart 테이블의 레코드 가져오기 
	public ArrayList<CartDTO> getCartList(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(userId);
		
		String sql;

		sql="SELECT * FROM cart, product WHERE cart.productId = product.p_id AND userId = ?";

		ArrayList<CartDTO> list = new ArrayList<CartDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCartId(rs.getInt("cartId"));
				cart.setUserId(rs.getString("userId"));
				cart.setProductId(rs.getString("productId"));
				cart.setAmout(rs.getInt("amout"));
				cart.setpName(rs.getString("p_name"));
				cart.setpPrice(rs.getInt("p_unitPrice"));
				
				list.add(cart);

			}			
		} catch (Exception ex) {
			System.out.println("getCartList()예외발생: " + ex);
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
	
	//선택된 장바구니 삭제하기
	public void deleteCart(int cartId) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from cart where cartId=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartId);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteCart() 예외발생 : " + ex);
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
	
	//전체 장바구니 삭제하기
	public void deleteAllCarts(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from cart where userId=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteAllCarts() 예외발생 : " + ex);
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
	
	public void addCart(String userId, String productId) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into cart(userId, productId, amout) values (?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, productId);
			pstmt.setInt(3, 1);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("addCart() 예외발생 : " + ex);
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
