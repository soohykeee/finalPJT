package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ProductDAO {
	
	private static ProductDAO instance;
	
	private ProductDAO() {
		
	}
	
	public static ProductDAO getInstance() {
		if(instance == null)
			instance = new ProductDAO();
		return instance;
	}
	
	//product 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;
		
		if (items == null && text == null)
			sql = "select  count(*) from product";
		else
			sql = "SELECT   count(*) FROM product where " + items + " like '%" + text + "%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	//product 테이블의 레코드 가져오기 
	public ArrayList<ProductDTO> getProductList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql;

		if (items == null && text == null)
			sql = "select * from product ORDER BY p_brand ASC limit ?,?";
		else
			sql = "SELECT  * FROM product where " + items + " like '%" + text + "%' ORDER BY p_brand DESC limit ?,?";

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index-1);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setProductId(rs.getString("p_id"));
				product.setName(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setBrand(rs.getString("p_brand"));
				product.setCategory(rs.getString("p_category"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setSize(rs.getString("p_size"));
				product.setFileName(rs.getString("p_fileName"));
				
				list.add(product);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}			
		} catch (Exception ex) {
			System.out.println("getBoardList()예외발생: " + ex);
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
	
	//user 테이블에서 로그인된 ID의 사용자명 가져오기 --> 관리자여야만함
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String name=null;
		String sql = "select * from user where id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	//product 테이블에 새로운 글 삽입하기 
	public void insertProduct(ProductDTO product)  {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();		

			String sql = "insert into product values( ? , ? , ? , ? , ? , ? , ? , ? , ? )";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductId());
			pstmt.setString(2, product.getName());
			pstmt.setInt(3, product.getUnitPrice());
			pstmt.setString(4, product.getDescription());
			pstmt.setString(5, product.getBrand());
			pstmt.setString(6, product.getCategory());
			pstmt.setLong(7, product.getUnitsInStock());
			pstmt.setString(8, product.getSize());
			pstmt.setString(9, product.getFileName());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 예외발생 : " + ex);
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
	
	//선택된 제품 상세내용 가져오기
	public ProductDTO getProductByPid(String pid, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO product = null;

		String sql = "select * from product where p_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new ProductDTO();
				product.setProductId(rs.getString("p_id"));
				product.setName(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setBrand(rs.getString("p_brand"));
				product.setCategory(rs.getString("p_category"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setSize(rs.getString("p_size"));
				product.setFileName(rs.getString("p_fileName"));
			}
			
			return product;
		} catch (Exception ex) {
			System.out.println("getProductByPid() 예외발생 : " + ex);
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
	
	//선택된 제품 수정하기
	public void updateProduct(ProductDTO product) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			if(product.getFileName() != null) {
				String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_brand=?, p_category=?, p_unitsInStock=?, p_size=?, p_fileName=? WHERE p_id=?";
	
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				conn.setAutoCommit(false);
				
				pstmt.setString(1, product.getName());
				pstmt.setInt(2, product.getUnitPrice());
				pstmt.setString(3, product.getDescription());
				pstmt.setString(4, product.getBrand());
				pstmt.setString(5, product.getCategory());
				pstmt.setLong(6, product.getUnitsInStock());
				pstmt.setString(7, product.getSize());
				pstmt.setString(8, product.getFileName());
				pstmt.setString(9, product.getProductId());
	
				pstmt.executeUpdate();			
				conn.commit();
			} else {
				String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_brand=?, p_category=?, p_unitsInStock=?, p_size=? WHERE p_id=?";
				
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				conn.setAutoCommit(false);
				
				pstmt.setString(1, product.getName());
				pstmt.setInt(2, product.getUnitPrice());
				pstmt.setString(3, product.getDescription());
				pstmt.setString(4, product.getBrand());
				pstmt.setString(5, product.getCategory());
				pstmt.setLong(6, product.getUnitsInStock());
				pstmt.setString(7, product.getSize());
				pstmt.setString(8, product.getProductId());
	
				pstmt.executeUpdate();			
				conn.commit();
			}

		} catch (Exception ex) {
			System.out.println("updateProduct() 예외발생 : " + ex);
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
	
	//선택된 제품 삭제하기
	public void deleteProduct(String pid) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from product where p_id=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteProduct() 예외발생 : " + ex);
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
	
	//검색한 product 테이블의 레코드 개수
	public int getSearchListCount(String searchWord) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;
		
		if (searchWord == null)
			sql = "select  count(*) from product";
		else
			sql = "SELECT   count(*) FROM product where p_name  like '%" + searchWord + "%' or p_brand like '%" + searchWord + "%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getSearchListCount() 예외발생 : " + ex);
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
	
	//검색한 product 테이블의 레코드 가져오기 
	public ArrayList<ProductDTO> getSearchProductList(String searchWord) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getSearchListCount(searchWord);
		
		String sql;

		if (searchWord == null)
			sql = "select * from product ORDER BY p_id ASC";
		else
			sql = "SELECT * FROM product where p_name  like '%" + searchWord + "%' or p_brand like '%" + searchWord + "%'";

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setProductId(rs.getString("p_id"));
				product.setName(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setBrand(rs.getString("p_brand"));
				product.setCategory(rs.getString("p_category"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setSize(rs.getString("p_size"));
				product.setFileName(rs.getString("p_fileName"));
				
				list.add(product);
			}			
		} catch (Exception ex) {
			System.out.println("getSearchProductList()예외발생: " + ex);
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

}
