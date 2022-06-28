package model;

public class Board {
	private int bno;
	private String bname;
	private String bo_content;
	private int bviews;
	private String image;
	private String del;
	private int boardseq;
	
	
	public int getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public int getBviews() {
		return bviews;
	}
	public void setBviews(int bviews) {
		this.bviews = bviews;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}

}
