package model;

import java.sql.Date;

public class Review {
	private int rvno;
	private int star_rate;
	private String rv_content;
	private Date rv_date;
	private String del;
	private int mno;
	private int cno;
	
	// content에서 받아올 예정
			private String cname;
			
			public String getCname() {
				return cname;
			}
			public void setCname(String cname) {
				this.cname = cname;
			}
		//
	
	// member에서 받아올 예정		
			private String nickname;
			
			public String getNickname() {
				return nickname;
			}
			public void setNickname(String nickname) {
				this.nickname = nickname;
			}
	//
	
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public int getStar_rate() {
		return star_rate;
	}
	public void setStar_rate(int star_rate) {
		this.star_rate = star_rate;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
}