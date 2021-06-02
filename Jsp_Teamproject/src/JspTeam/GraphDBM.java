package JspTeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GraphDBM {

	public String selectAddr() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "[";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select substr(addr,1,2) as 'addr', " + " count(substr(addr,1,2)) as 'cnt' "
					+ " from jsp_teamproject.hospital2 " + " group by substr(addr,1,2) " + " order by cnt desc ; ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.isLast())
					ret += rs.getInt("cnt");
				else
					ret += rs.getInt("cnt") + ",";
			}
			ret += "]";
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
			} catch (Exception ex) {

			}
		}
		return ret;
	}

	public ArrayList<GraphDB> selectAddr2() {
		ArrayList<GraphDB> list = new ArrayList<GraphDB>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select substr(addr,1,2) as 'addr', " + " count(substr(addr,1,2)) as 'cnt' "
					+ " from jsp_teamproject.hospital2 " + " group by substr(addr,1,2) " + " order by cnt desc ; ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GraphDB ct = new GraphDB();
				ct.setCityName(rs.getString("addr"));
				ct.setCityNum(rs.getInt("cnt"));
				list.add(ct);
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
			} catch (Exception ex) {

			}
		}
		return list;
	}

	public String selectGrp() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "[";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select grp as 'part', " + "count(grp) as 'cnt' "
					+ "from jsp_teamproject.hospital2 " + "group by grp " + "order by cnt desc limit 0, 10 ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.isLast())
					ret += rs.getInt("cnt");
				else
					ret += rs.getInt("cnt") + ",";
			}
			ret += "]";
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
			} catch (Exception ex) {

			}
		}
		return ret;
	}

	public String selectGrpName() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "[";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select grp as 'part', " + "count(grp) as 'cnt' "
					+ "from jsp_teamproject.hospital2 " + "group by grp " + "order by cnt desc limit 0, 10");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.isLast())
					ret += rs.getString("part");
				else
					ret += rs.getString("part") + ",";
			}
			ret += "]";
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
			} catch (Exception ex) {

			}
		}
		return ret;
	}

	
	public ArrayList<GraphDB> selectGrp2() {
		ArrayList<GraphDB> list = new ArrayList<GraphDB>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select grp as 'part', " + "count(grp) as 'cnt' "
					+ "from jsp_teamproject.hospital2 " + "group by grp " + "order by cnt desc ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GraphDB ct = new GraphDB();
				ct.setGrpName(rs.getString("part"));
				ct.setGrpNum(rs.getInt("cnt"));
				list.add(ct);
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
			} catch (Exception ex) {

			}
		}
		return list;
	}
	
	public String selectUnit() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "[";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select unit as 'unitname', " + " count(*) as 'UnitTotal' "
					+ " from jsp_teamproject.hospital2 " + " group by unit ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.isLast())
					ret += rs.getInt("UnitTotal");
				else
					ret += rs.getInt("UnitTotal") + ",";
			}
			ret += "]";
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
			} catch (Exception ex) {

			}
		}
		return ret;
	}

	public String selectUnitName() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "[";
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select unit as 'unitname', " + " count(*) as 'UnitTotal' "
					+ " from jsp_teamproject.hospital2 " + " group by unit ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.isLast())
					ret += "'" + rs.getString("unitname") + "'";
				else
					ret += "'" + rs.getString("unitname") + "',";
			}
			ret += "]";
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
			} catch (Exception ex) {

			}
		}
		return ret;
	}

	public ArrayList<GraphDB> selectUnit2() {
		ArrayList<GraphDB> list = new ArrayList<GraphDB>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement(" select unit as 'unitname', " + " count(*) as 'UnitTotal' "
					+ " from jsp_teamproject.hospital2 " + " group by unit ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GraphDB en = new GraphDB();
				en.setUnitName(rs.getString("unitname"));
				en.setUnitTotal(rs.getInt("UnitTotal"));
				list.add(en);
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
			} catch (Exception ex) {

			}
		}
		return list;
	}
	
}
