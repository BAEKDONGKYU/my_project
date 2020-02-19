package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//자바빈 클래스 종류 : DAO(DB관련 작업)
public class MemberDAO {
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
	
	// 회원탈퇴 메소드
	
	public int deleteId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from p_member where id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 삭제 성공시 result 변수에 1 할당 , 실패시 0
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteId()메소드에서 발생한 에러 입니다.");
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
	
	
	// 입력 받은 아이디의 비밀번호를 찾는 메소드
	
	public String findPW(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pwd from p_member where id = ?";
		String pwd = "";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pwd = rs.getString(1);
			}
			
		} catch (Exception e) {
			System.out.println("findPW()에서 발생한 에러 입니다.");
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
	
	
	
	
	
	
	
	
	
	
	
	//로그인 처리시 사용하는 메소드
	//입력받은 아이디,비빌번호가 DB에 존재하는지 확인
	
	public int userCheck(String id, String pwd) {
		int check = -1; //1 --> 아이디, 비빌번호 맞음
		                //0 --> 아이디 맞음 , 비빌번호 틀림
		                // -1 --> 아이디 틀림
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from p_member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 아이디가 존재함
				//login.sjp에서 입력한 비빌번호와 DB에 저장되어 있는 비밀번호가 동일하면
				if(pwd.equals(rs.getString("pwd"))) {
					check = 1;
				}
				else {
					check = 0;
				}
				
			}else { //아이디가 존재하지 않음
				check = -1;
			}
		} catch (Exception e) {
			System.out.println("userCheck에서 발생한 에러 입니다."+e);
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("자원해제 에러 발생");
				e.printStackTrace();
			}
		}
		
		return check;
		
	}// 메소드 끝
	
	
	//아이디 찾기
	
	public String findId(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = "";
		String sql = "select id from p_member where email = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getString(1);
			}
			
			
		} catch (Exception e) {
			System.out.println("findId에서 발생한 에러 입니다."+e);
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
		
		return id;
	}
	
	public int mailCheck(String email) {
		
		int result = 1; // 결과값을 리턴할 변수
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(email) from p_member where email = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("mailCheck ()에서 발생한 에러");
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
	
	
	
	//DB에 사용자가 입력한 id값이 존재 하는지 검색하여..
	//만약 사용자가 입력한 id에 해당하는 회원레코드가 검색이 되면??
	//check변수에 값1을 저장하여 <--- 아이디 중복을 나타내는 값임
	//만약 사용자가 입력한 id에 해당하는 회원 레코드가 검색이 되지 않으면 ?
	//check변수에 값 0을 저장하여 <---- 아이디 중복 아님을 나타내는 값임
	//결과적으로 아이디 중복이냐 중복이 아니냐는 check변수에 저장된 값으로 판단함
	
	public int idCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		try {
			//커넥션풀로 부터 커넥션 빌려오기
			con = getConnection();
			//select sql문 만들기 : 입력한 아이디에 해당하는 회원 검색
			
			sql = "select * from p_member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = 1;
			}else {
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck() 메서드에서 에러 발생 " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("자원해제 에러 발생");
				e.printStackTrace();
			}
		}
		
		return check;
	}
	
	//개인정보 수정하는 메소드
	
	public int modify(MemberDTO m_dto, String id) {
		Connection con = null;
		int result = 0; 
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update p_member set pwd = ?, phone = ?, phone2 = ?, phone3 = ?"
				+ "where id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_dto.getPwd());
			pstmt.setString(2, m_dto.getPhone());
			pstmt.setString(3, m_dto.getPhone2());
			pstmt.setString(4, m_dto.getPhone3());
			pstmt.setString(5, m_dto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("modify()메소드에서 발생한 에러");
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
		return result;  //리턴 할 변수값
	}
	
	
	
	
	
	// 해당 아이디에 대한 모든 데이터 가져오는 메소드
	
	public MemberDTO userAllData(String user_id) {
		Connection con = null;
		int result = 0; 
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from p_member where id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String year = rs.getString("year");
				String month = rs.getString("month");
				String date = rs.getString("date");
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");
				String address2 = rs.getString("address2");
				String email = rs.getString("email");
				dto = new MemberDTO();
				dto.setId(id);
				dto.setPwd(pwd);
				dto.setName(name);
				dto.setGender(gender);
				dto.setPhone(phone);
				dto.setPhone2(phone2);
				dto.setPhone3(phone3);
				dto.setYear(year);
				dto.setMonth(month);
				dto.setDate(date);
				dto.setZipcode(zipcode);
				dto.setAddress(address);
				dto.setAddress2(address2);
				dto.setEmail(email);
			}
			
		} catch (Exception e) {
			System.out.println("allData()메소드에서 발생한 에러");
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
	

	/*insertMember메소드 추가*/
	//MemberBean객체를 매개변수로 전달 받아 DB에 INSERT작업 하는 메소드
	
	public int insertMember(MemberDTO memberDTO) {
		Connection con = null;
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = "insert into p_member(id,pwd,name,gender,phone,phone2,phone3,year,month,"
				+ "date,zipcode,address,address2,email)"
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPwd());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getPhone());
			pstmt.setString(6, memberDTO.getPhone2());
			pstmt.setString(7, memberDTO.getPhone3());
			pstmt.setString(8, memberDTO.getYear());
			pstmt.setString(9, memberDTO.getMonth());
			pstmt.setString(10, memberDTO.getDate());
			pstmt.setString(11, memberDTO.getZipcode());
			pstmt.setString(12, memberDTO.getAddress());
			pstmt.setString(13, memberDTO.getAddress2());
			pstmt.setString(14, memberDTO.getEmail());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("insertMember() 메소드에서 에러 발생" + e);
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
	}// insertMember() 메소드 끝
} // MemberDAO 클래스 끝
