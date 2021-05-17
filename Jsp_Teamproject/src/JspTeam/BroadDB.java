package JspTeam;

public class BroadDB {

	private int idx;
	private String unit;
	private String grp;
	private String name;
	private String addr;
	
	@Override
	public String toString() {
		return "BroadDB [idx=" + idx + ", unit=" + unit + ", grp=" + grp + ", name=" + name + ", addr=" + addr + "]";
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getGrp() {
		return grp;
	}
	public void setGrp(String grp) {
		this.grp = grp;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

}
