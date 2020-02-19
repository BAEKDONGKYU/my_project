package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class CartDAO {

	//커넥션풀로 부터 커넥션을 얻기 위한 메소드
	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		//커넥션풀로 부터 커넥션 객체 얻기
		
		con = ds.getConnection();
		
		return con;
		
	}
	
	public int addCart(String userId, String prdNum, int cartStock) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into p_cart (userId,prdNum,cartStock) values (?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, prdNum);
			pstmt.setInt(3, cartStock);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addCart() 메소드에서 발생한 에러 입니다.");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("자원해제 에러 발생");
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
}
