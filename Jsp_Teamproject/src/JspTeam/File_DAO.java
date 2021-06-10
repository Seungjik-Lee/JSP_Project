package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
		String SQL = "INSERT INTO file(FileName,FileRealName,downloadCount) VALUES (?, ?, 0)";
		
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
	
	public int hit(String FileRealName) {
		String SQL = "UPDATE file SET downloadCount = downloadCount + 1 " + "WHERE FileRealName = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, FileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<File_DTO> getList() {
		String SQL = "SELECT * FROM file";
		
		ArrayList<File_DTO> list = new ArrayList<File_DTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				File_DTO file = new File_DTO(rs.getString("FileName"), rs.getString("FileRealName"), rs.getInt("downloadCount"));
				list.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
}
