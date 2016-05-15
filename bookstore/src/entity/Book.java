package entity;

public class Book {
	private long bookid;
	private String bookname;
	private String breifintroduction;
	private String detailintroduction;
	private float bookprice;
	private String photo;
	private String categroy;
	
	public Book(long bookid, String bookname, String breifintroduction, String detailintroduction, float bookprice, String photo, String categroy) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.breifintroduction = breifintroduction;
		this.detailintroduction = detailintroduction;
		this.bookprice = bookprice;
		this.photo = photo;
		this.categroy = categroy;
	}
	public String getBreifintroduction() {
		return breifintroduction;
	}
	public String getCategroy() {
		return categroy;
	}
	public String getDetailintroduction() {
		return detailintroduction;
	}
	public long getBookid() {
		return bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public float getBookprice() {
		return bookprice;
	}
	public String getPhoto() {
		return photo;
	}
	public void setBreifintroduction(String breifintroduction) {
		this.breifintroduction = breifintroduction;
	}
	public void setCategroy(String categroy) {
		this.categroy = categroy;
	}
	public void setDetailintroduction(String detailintroduction) {
		this.detailintroduction = detailintroduction;
	}
	public void setBookid(long bookid) {
		this.bookid = bookid;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public void setBookprice(float bookprice) {
		this.bookprice = bookprice;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
