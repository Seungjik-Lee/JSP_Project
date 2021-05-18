package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BroadDBM {
	public BroadDBM() {
	// TODO Auto-generated constructor stub
	}
	public List<BroadDB> select() {
		List<BroadDB> list = new ArrayList<BroadDB>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement("select * from hospital2");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BroadDB bbd = new BroadDB(); 
				bbd.setIdx(rs.getInt("idx"));
				bbd.setUnit(rs.getString("unit"));
				bbd.setGrp(rs.getString("grp"));
				bbd.setName(rs.getString("name"));
				bbd.setAddr(rs.getString("addr"));
				list.add(bbd);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ex){
				
			}
		}
		return list;
	}
}

