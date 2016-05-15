package entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.DBConnection;

public class Order {
	private long orderid;
	private String username; 
	private long bookid; 
	private int quantity;
	private Date paiddate;
	private String status;
	
	public Order() {
		super();
	}
	
	public Order(long orderid, String username, long bookid, int quantity, Date paiddate,String status) {
		super();
		this.orderid = orderid;
		this.username = username;
		this.bookid = bookid;
		this.quantity = quantity;
		this.paiddate = paiddate;
		this.status = status;
	}
	
	public long getOrderid() {
		return orderid;
	}
	
	public void setUsername(String u) {
		this.username = u;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setBookid(long i) {
		this.bookid = i;
	}
	
	public long getBookid() {
		return bookid;
	}
	
	public void setQuantity(int q) {
		this.quantity = q;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setPaiddate(Date d) {
		this.paiddate = d;
	}
	
	public Date getPaiddate() {
		return paiddate;
	}
	public void setStatus(String s) {
		this.status = s;
	}
	
	public String getStatus() {
		return status;
	}
}
