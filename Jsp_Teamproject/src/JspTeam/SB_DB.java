package JspTeam;

public class SB_DB {
	
	private int bbsID;	
	private String userID;	
	private String sbContent;
	private String sbDate;
	private int sbID;

	public int getSbID() {
		return sbID;
	}
	public void setSbID(int sbID) {
		this.sbID = sbID;
	}
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getSbContent() {
		return sbContent;
	}
	public void setSbContent(String bbsContent) {
		this.sbContent = bbsContent;
	}
	
	public String getSbDate() {
		return sbDate;
	}
	public void setSbDate(String sbDate) {
		this.sbDate = sbDate;
	}
	

}
