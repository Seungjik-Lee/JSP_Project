package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SB_DAO {
	private Connection conn;
	private ResultSet rs;
	
	public SB_DAO() {
		try {
		Class.forName(DBinfo.mysql_class);
		conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//작성일자 메소드
		public String getsbDate() {
			String sql1 = "select now()";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql1);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ""; //데이터베이스 오류
		}
	
	//글쓰기 메소드
	public int write(int bbsID, String userID, String sbContent) {
		String sql3 = "insert into sb(bbsID, userID, sbContent, sbdate) values(?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, bbsID);			
			pstmt.setString(2, userID);			
			pstmt.setString(3, sbContent);	
			pstmt.setString(4, getsbDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글 리스트 메소드
	public ArrayList<SB_DB> getList(int pageNumber) {
		String sql4 = "select * from sb where bbsID="+pageNumber;
		ArrayList<SB_DB> list = new ArrayList<SB_DB>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql4);
			
			pstmt = conn.prepareStatement(sql4);			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				SB_DB sbdb = new SB_DB();
				sbdb.setBbsID(rs.getInt(1));				
				sbdb.setUserID(rs.getString(2));				
				sbdb.setSbContent(rs.getString(3));
				sbdb.setSbDate(rs.getString(4));
				list.add(sbdb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	//하나의 게시글을 보는 메소드
	public SB_DB getsb(int bbsID) {
		String sql6 = "select * from sb where bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql6);
			
			pstmt = conn.prepareStatement(sql6);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				SB_DB sb = new SB_DB();
				sb.setBbsID(rs.getInt(1));				
				sb.setUserID(rs.getString(2));				
				sb.setSbContent(rs.getString(3));
				sb.setSbDate(rs.getString(4));
				return sb;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정 메소드
		public int update(int bbsID, String sbContent) {
			String sql7 = "update sb set sbContent = ? where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql7);
				pstmt.setString(1, sbContent);
				pstmt.setInt(2, bbsID);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
	//게시글 삭제 메소드
		public int delete(int bbsID) {
			//실제 데이터를 삭제하는 것이 아니라 게시글 유효숫자를 '0'으로 수정한다
			String sql8 = "update bbs set bbsAvailable = 0 where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql8);
				pstmt.setInt(1, bbsID);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
		}
}
