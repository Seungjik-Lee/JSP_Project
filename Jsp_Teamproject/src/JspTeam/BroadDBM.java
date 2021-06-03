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
		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement("select * from hospital2");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BroadDB bbd = new BroadDB();
				bbd.setIdx(rs.getInt("idx"));
				bbd.setUnit(rs.getString("unit"));
				bbd.setGrp(rs.getString("grp"));
				bbd.setName(rs.getString("name"));
				bbd.setAddr(rs.getString("addr"));
				list.add(bbd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {

			}
		}
		return list;
	}

	public List<BroadDB> select2(String address) {

		ArrayList<BroadDB> list = new ArrayList<BroadDB>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DBinfo.mysql_class);
			conn = DriverManager.getConnection(DBinfo.mysql_url, DBinfo.mysql_id, DBinfo.mysql_pw);
			pstmt = conn.prepareStatement("select * from hospital2 where addr like \"%" + address + "%\" limit 0, 100");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BroadDB bbd = new BroadDB();
				bbd.setIdx(rs.getInt("idx"));
				bbd.setUnit(rs.getString("unit"));
				bbd.setGrp(rs.getString("grp"));
				bbd.setName(rs.getString("name"));
				bbd.setAddr(rs.getString("addr"));
				list.add(bbd);
			}

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
		return list;
	}

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

	public ArrayList<grp_entity> selectAddr2() {
		ArrayList<grp_entity> list = new ArrayList<grp_entity>();
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
				grp_entity ct = new grp_entity();
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

	public ArrayList<grp_entity> selectUnit2() {
		ArrayList<grp_entity> list = new ArrayList<grp_entity>();
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
				grp_entity en = new grp_entity();
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
