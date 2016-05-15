package entity;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;


public class OrderHandler {
	Connection conn;
	Statement state;
	ResultSet res;
	
	public boolean isOrderIdValid(long orderid)
	{
		boolean isExist = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders where orderid='"+orderid+"' limit 1");
			if(res.next())
			{
				isExist = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
				if (res != null) {
					res.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isExist;
	}
	
	
	public int getOrderCount(){
		int count=0;
		try{
			conn=new DBConnection().getConnection();
			state=conn.createStatement();
			res=state.executeQuery("select count(*) from orders");
			if(res.next())
				count=res.getInt(1);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	public ArrayList<Order> getAllOrders() {
		ArrayList<Order> temp = new ArrayList<Order>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders");
			while (res.next())
				temp.add(new Order(res.getLong(1), res.getString(2), res.getLong(3), res.getInt(4), res.getDate(5), res.getString(6)));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return temp;
	}
	
	public ArrayList<Order> getAllOrdersByBook(long booksid) {
		ArrayList<Order> temp = new ArrayList<Order>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders where booksid=" + booksid);
			while (res.next())
				temp.add(new Order(res.getLong(1), res.getString(2), res.getLong(3), res.getInt(4), res.getDate(5), res.getString(6)));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return temp;
	}
	
	public int getOrdersCountByBook(long booksid) {
		int count=0;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select count(*) from orders where booksid="+booksid);
			if(res.next())
				count=res.getInt(1);
			} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	public ArrayList<Order> getAllOrdersByUser(String username) {
		ArrayList<Order> temp = new ArrayList<Order>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders where username='" + username+"'");
			while (res.next())
				temp.add(new Order(res.getLong(1), res.getString(2), res.getLong(3), res.getInt(4), res.getDate(5), res.getString(6)));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return temp;
	}
	
	public ArrayList<Order> getAllOrdersByCategory(String category) {
		ArrayList<Order> temp = new ArrayList<Order>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders natural join books where category=" + category);
			while (res.next())
				temp.add(new Order(res.getLong(1), res.getString(2), res.getLong(3), res.getInt(4), res.getDate(5), res.getString(6)));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return temp;
	}
	
	
	
	public Order getOrder(long id) {
		Order order = null;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from orders where orderid=" + id);
			if (res.next())
				order = new Order(res.getLong(1), res.getString(2), res.getLong(3), res.getInt(4), res.getDate(5), res.getString(6));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		return order;
	}
	
	public boolean add(String username,long bookid,int quantity,String status) {
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			Date d = new Date();
			java.sql.Date paiddate = new java.sql.Date(d.getTime());
			state.execute("insert into orders values (null,'"+username+"','"+bookid+"','"+quantity+"','"+paiddate+"','"+status+"')");
			res = state.executeQuery("select * from orders where username='"+username+"' and booksid='"+bookid+"' limit 1");
			if(res.next())
				isSuccessed = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
				if (res != null) {
					res.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccessed;
	}
	
	public boolean remove(long id) {
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			state.execute("delete from orders where orderid="+id);
			res = state.executeQuery("select * from orders where orderid="+id);
			if(res.next())
				isSuccessed = false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
				if (res != null) {
					res.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccessed;
	}
	
	public boolean updateStatus(long orderid,String newstatus) {
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			state.execute("update orders set status='"+newstatus+"' where orderid="+orderid);
			res = state.executeQuery("select * from orders where orderid='"+orderid+"' limit 1");
			if(res.getString(6)==newstatus)
				isSuccessed = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
				if (res != null) {
					res.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccessed;
	}
	
	public void getStatisticByCategory(ArrayList<String>categorys,ArrayList<Integer>nums) {
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res=state.executeQuery("select category,sum(quantity) from orders natural join books group by category");
			while (res.next()){
				categorys.add(res.getString(1));
				nums.add(res.getInt(2));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}	
	
	public void getStatisticByYearMonth(ArrayList<Integer>years,ArrayList<Integer>months,ArrayList<Integer>nums) {
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res=state.executeQuery("select year(paiddate),month(paiddate),sum(quantity) from orders natural join books group by year(paiddate),month(paiddate)");
			while (res.next()){
				years.add(res.getInt(1));
				months.add(res.getInt(2));
				nums.add(res.getInt(3));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}	
	
	public void getStatisticByDate(ArrayList<Date>dates,ArrayList<Integer>nums) {
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res=state.executeQuery("select paiddate,sum(quantity) from orders natural join books group by paiddate");
			while (res.next()){
				dates.add(res.getDate(1));
				nums.add(res.getInt(2));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally{
			try{
				if(conn!=null) conn.close();
				if(state!=null) state.close();
				if(res!=null) res.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}	
}
