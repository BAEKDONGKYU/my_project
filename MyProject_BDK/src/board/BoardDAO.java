package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//자바빈 클래스 종류 : DAO(DB관련 작업)
public class BoardDAO {
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
	
	public int modifyBoard(int num, String subject, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "update p_board set subject = ?, content = ? where num = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			System.out.println("modifyBoard() 메소드에서 발생한 에러");
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
	
	public int deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from p_board where num = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteBoard() 메소드에서 발생한 에러입니다.");
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
	
	
	
	public String getPW(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from p_board where num = ?";
		String pwd = "";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pwd = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("getPW() 메소드에서 발생한 에러입니다.");
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
		return pwd;
	}
	
	
	public int writeData(BoardDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int lastNum = 0;
		int result = 0;
		
		//마지막 글번호 가져오기
		String sql = "";
		try {
			con = getConnection();
			sql = "select num from p_board order by num desc limit 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lastNum = rs.getInt(1);
				pstmt.close();
			}
			
			//dto에서 넘겨준값들 다 꺼내서 insert하기
			sql = "insert into p_board(num,author,subject,content,pass,ip) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lastNum+1);
			pstmt.setString(2, dto.getAuthor());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getIp());
			result = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("writeData()메소드에서 발생한 에러");
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
		
		return result;
	}
	
	

	// 해당 글번호에 해당하는 모든 데이터 가져오기 
	// 가져오기전 먼저 조회수를 1증가 시킴
	
	public BoardDTO getNumData(int _num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = null;
		
		
		String sql = "select * from p_board where num = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, _num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num"); 
				String author = rs.getString("author"); 
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String pass = rs.getString("pass");
				int count = rs.getInt("count")+1;  // 카운트 1증가
				String ip = rs.getString("ip");
				Timestamp regdate = rs.getTimestamp("regdate");
				dto = new BoardDTO();
				dto.setNum(num);
				dto.setAuthor(author);
				dto.setContent(content);
				dto.setCount(count);
				dto.setIp(ip);
				dto.setPass(pass);
				dto.setRegdate(regdate);
				dto.setSubject(subject);
			}
			pstmt.close();
			sql = "update p_board set count = ? where num = ?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCount());
			pstmt.setInt(2, _num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("getNumData() 에서 발생한 에러 입니다.");
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
		
		
		
		return dto;
	}
	
	//전체글을 출력하는  메소드
	public ArrayList allBoardList(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = null;
		ArrayList<BoardDTO> boardArr = new ArrayList<BoardDTO>();
		String sql = "";
		try {
			con = getConnection();
			// 키워드를 입력하지 않았을 경우
			if(keyWord == null || keyWord.isEmpty()) {
				sql = "select * from p_board order by num desc";
			}
			else if(keyWord != null) {
				sql = "select * from p_board where " + keyField 
	            	    + " like '%" + keyWord + "%' order by num desc";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num"); 
				String author = rs.getString("author"); 
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String pass = rs.getString("pass");
				int count = rs.getInt("count");
				String ip = rs.getString("ip");
				Timestamp regdate = rs.getTimestamp("regdate");
				dto = new BoardDTO();
				dto.setNum(num);
				dto.setAuthor(author);
				dto.setContent(content);
				dto.setCount(count);
				dto.setIp(ip);
				dto.setPass(pass);
				dto.setRegdate(regdate);
				dto.setSubject(subject);
				boardArr.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("allBoardList()메소드에서 에러 발생");
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
		
		return boardArr;
	}
	
	

} // BoardDAO 클래스 끝
