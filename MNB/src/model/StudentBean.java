package model;

public class StudentBean {
	private String handle;
	private String name;
	private String id;
	private String pass;
	private String email;
	private boolean isProhan;
	private boolean is2dcghan;
	private boolean is3dcghan;
	private boolean isMusichan;
	private boolean isAdmin;

	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public boolean isProhan() {
		return isProhan;
	}
	public void setIsProhan(boolean isProhan) {
		this.isProhan = isProhan;
	}
	public boolean isIs2dcghan() {
		return is2dcghan;
	}
	public void setIs2dcghan(boolean is2dcghan) {
		this.is2dcghan = is2dcghan;
	}
	public boolean isIs3dcghan() {
		return is3dcghan;
	}
	public void setIs3dcghan(boolean is3dcghan) {
		this.is3dcghan = is3dcghan;
	}
	public boolean isMusichan() {
		return isMusichan;
	}
	public void setIsMusichan(boolean isMusichan) {
		this.isMusichan = isMusichan;
	}
}
