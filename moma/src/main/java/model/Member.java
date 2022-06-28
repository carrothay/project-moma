package model;

import java.sql.Date;

public class Member {
		
	private int mno;
	private String id;
	private String password;
	private String email;
	private String mname;
	private String nickname;
	private String phone;
	private String sms_check;
	private String email_check;
	private Date join_date;
	private String del;
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSms_check() {
		return sms_check;
	}
	public void setSms_check(String sms_check) {
		this.sms_check = sms_check;
	}
	public String getEmail_check() {
		return email_check;
	}
	public void setEmail_check(String email_check) {
		this.email_check = email_check;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	 
}
