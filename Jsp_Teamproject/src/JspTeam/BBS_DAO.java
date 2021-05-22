package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BBS_DAO {
	private Connection conn;
	private ResultSet rs;
	
	public BBS_DAO() {
		try {
		Class.forName(DBinfo.mysql_class);
		conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//작성일자 메소드
	public String getDate() {
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
	
	//게시글 번호 부여 메소
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql2 = "select bbsID from bbs order by bbsID desc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			//첫번째 게시글인 경우
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//글쓰기 메소드
	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql3 = "insert into bbs values(?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //글의 유효번호
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글 리스트 메소드
	public ArrayList<BBS_DB> getList(int pageNumber) {
		String sql4 = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<BBS_DB> list = new ArrayList<BBS_DB>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql4);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BBS_DB bbsdb = new BBS_DB();
				bbsdb.setBbsID(rs.getInt(1));
				bbsdb.setBbsTitle(rs.getString(2));
				bbsdb.setUserID(rs.getString(3));
				bbsdb.setBbsDate(rs.getString(4));
				bbsdb.setBbsContent(rs.getString(5));
				bbsdb.setBbsAvailable(rs.getInt(6));
				list.add(bbsdb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//페이징 처리 메소드
	public boolean nextPage(int pageNumber) {
		String sql5 = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql5);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//하나의 게시글을 보는 메소드
	public BBS_DB getBbs(int bbsID) {
		String sql6 = "select * from bbs where bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql6);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BBS_DB bbs = new BBS_DB();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정 메소드
		public int update(int bbsID, String bbsTitle, String bbsContent) {
			String sql7 = "update bbs set bbsTitle = ?, bbsContent = ? where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql7);
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsID);
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
