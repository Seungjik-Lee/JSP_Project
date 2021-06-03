package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class File_DAO {
	
	private Connection conn;
	
	public File_DAO() {
		
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
		} catch (Exception e) {
				e.printStackTrace();
		}	
	}
	
	public int upload(String FileName, String FileRealName) {
		String SQL = "INSERT INTO file VALUES (?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, FileName);
			pstmt.setString(2, FileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
