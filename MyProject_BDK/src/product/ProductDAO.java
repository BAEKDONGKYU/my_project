package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardDTO;

public class ProductDAO {
	
	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		//커넥션풀로 부터 커넥션 객체 얻기
		
		con = ds.getConnection();
		
		return con;
	}
	
	//전체글을 출력하는  메소드
		public ArrayList allProductList(String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ProductDTO pdto = null;
			ArrayList<ProductDTO> productArr = new ArrayList<ProductDTO>();
			String sql = "";
			try {
				con = getConnection();
				// 키워드를 입력하지 않았을 경우
				if(keyWord == null || keyWord.isEmpty()) {
					sql = "select * from p_product order by p_date desc";
				}
				
				else {
					sql = "select * from p_product where p_name"  
		            	    + " like '%" + keyWord + "%' order by p_date desc";
				}
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String pNum = rs.getString("p_num");
					String pName = rs.getString("p_name");
					String pCategory = rs.getString("p_category");
					int pPrice = rs.getInt("p_price");
					Timestamp pDate = rs.getTimestamp("p_date");
					int pCount = rs.getInt("p_count");
					int pTotalCount = rs.getInt("p_total_count");
					pdto = new ProductDTO();
					pdto.setP_num(pNum);
					pdto.setP_category(pCategory);
					pdto.setP_count(pCount);
					pdto.setP_date(pDate);
					pdto.setP_name(pName);
					pdto.setP_price(pPrice);
					pdto.setP_total_count(pTotalCount);
					productArr.add(pdto);
				}
				
			} catch (Exception e) {
				System.out.println("allProductList() 메소드에서 에러 발생");
				e.printStackTrace();
				
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e) {
					System.out.println("자원해제 에러 발생");
					e.printStackTrace();
				}
			}
			
			return productArr;
		}
		
	
}
