package model;

public class Content {
	private int cno;
	private String cname;
	private String sort;
	private int clevel;
	private String genre;
	private String hours;
	private String start_date;
	private int cviews;
	private String netflix;
	private String watcha;
	private String tving;
	private String poster;
	private String del;
	private String director;
	private String actor;
	private String reserve;

	private float star_rate;

	public float getStar_rate() {
		return star_rate;
	}
	public void setStar_rate(float star_rate) {
		this.star_rate = star_rate;
	}

		// review에서 받아올 예정
		private int rvno;
		
		public int getRvno() {
			return rvno;
		}
		public void setRvno(int rvno) {
			this.rvno = rvno;
		}
	//

	// likes에서 받아올 예정
		private int lno;
		
		public int getLno() {
			return lno;
		}
		public void setLno(int lno) {
			this.lno = lno;
		}
	//	
		
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getClevel() {
		return clevel;
	}
	public void setClevel(int clevel) {
		this.clevel = clevel;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public int getCviews() {
		return cviews;
	}
	public void setCviews(int cviews) {
		this.cviews = cviews;
	}
	public String getNetflix() {
		return netflix;
	}
	public void setNetflix(String netflix) {
		this.netflix = netflix;
	}
	public String getWatcha() {
		return watcha;
	}
	public void setWatcha(String watcha) {
		this.watcha = watcha;
	}
	public String getTving() {
		return tving;
	}
	public void setTving(String tving) {
		this.tving = tving;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}	
}

