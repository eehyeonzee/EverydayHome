package kr.spring.serviceBoard.vo;

public class ServiceBoardVO {
	private int service_num;
	private String service_title;
	private String service_content;
	private String service_email;
	private String service_keyword;
	private String service_file;
	private int mem_num;
	
	public int getService_num() {
		return service_num;
	}
	public void setService_num(int service_num) {
		this.service_num = service_num;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public String getService_content() {
		return service_content;
	}
	public void setService_content(String service_content) {
		this.service_content = service_content;
	}
	public String getService_email() {
		return service_email;
	}
	public void setService_email(String service_email) {
		this.service_email = service_email;
	}
	public String getService_keyword() {
		return service_keyword;
	}
	public void setService_keyword(String service_keyword) {
		this.service_keyword = service_keyword;
	}
	public String getService_file() {
		return service_file;
	}
	public void setService_file(String service_file) {
		this.service_file = service_file;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "ServiceBoardVO [service_num=" + service_num + ", service_title=" + service_title + ", service_content="
				+ service_content + ", service_email=" + service_email + ", service_keyword=" + service_keyword
				+ ", service_file=" + service_file + ", mem_num=" + mem_num + "]";
	}
	
	
	
	
}
