package JspTeam;

public class File_DTO {
	
	String FileName;
	String FileRealName;
	int downloadCount;
	
	
	
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getFileRealName() {
		return FileRealName;
	}
	public void setFileRealName(String fileRealName) {
		FileRealName = fileRealName;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public File_DTO(String fileName, String fileRealName, int downloadCount) {
		super();
		this.FileName = fileName;
		this.FileRealName = fileRealName;
		this.downloadCount = downloadCount;
	}
	
}
