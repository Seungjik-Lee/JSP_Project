package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDBM {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void CustomerDBa(String id, String pw, String name, String phone) {

		CustomerDB cdb = new CustomerDB();
		ArrayList<CustomerDB> list = new ArrayList<CustomerDB>();

		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement("insert into member value(?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int login(String id, String pw) {
		String sql = "select pw from member where id = ?";

		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(sql); // sql쿼리문을 대기 시킨다
			pstmt.setString(1, id); // 첫번째 '?'에 매개변수로 받아온 'ID'를 대입
			rs = pstmt.executeQuery(); // 쿼리를 실행한 결과를 rs에 저장
			if (rs.next()) {
				System.out.println("실행");
				if (rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return -2; // 오류
	}

	public int join(CustomerDB cdb) {
		String sql = "insert into member value(?, ?, ?, ?, ?)";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdb.getId());
			pstmt.setString(2, cdb.getPw());
			pstmt.setString(3, cdb.getName());
			pstmt.setString(4, cdb.getGender());
			pstmt.setString(5, cdb.getPhone());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return -1;
	}
	
	public int withdrawl(String id, String pw){
		int result = -1;
		String sql = "select pw from member where id=?";
		
		try {
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					sql = "delete from member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;
					System.out.println("회원삭제성공-아디일치,비번일치");
				}else{
					result = 0;
				}
			}else{
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return result;		
	}
}