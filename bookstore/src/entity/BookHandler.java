package entity;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class BookHandler {
	Connection conn;
	Statement state;
	ResultSet res;
	
	public boolean isBookIdValid(long bookid)
	{
		boolean isExist = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from books where booksid='"+bookid+"' limit 1");
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
	
	public boolean isBookNameExist(String bookname)
	{
		boolean isExist = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from books where booksname='"+bookname+"' limit 1");
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
	
	public int getBookCount(){
		int count=0;
		try{
			conn=new DBConnection().getConnection();
			state=conn.createStatement();
			res=state.executeQuery("select count(*) from books");
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
	
	public ArrayList<Book> getBookByPage(int page, int pageSize) {
		ArrayList<Book> temp = new ArrayList<Book>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from books limit " + pageSize * (page - 1) + "," + pageSize * (page - 1) + pageSize);
			while (res.next())
				temp.add(new Book(res.getLong(1), res.getString(2), res.getString(3), res.getString(4), res.getFloat(5), res.getString(6), res.getString(7)));
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
	
	public ArrayList<Book> getAllBook() {
		ArrayList<Book> temp = new ArrayList<Book>();
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from books");
			while (res.next())
				temp.add(new Book(res.getLong(1), res.getString(2), res.getString(3), res.getString(4), res.getFloat(5), res.getString(6), res.getString(7)));
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
	
	public Book getBook(long id) {
		Book book = null;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			res = state.executeQuery("select * from books where booksid=" + id);
			if (res.next())
				book = new Book(res.getLong(1), res.getString(2), res.getString(3), res.getString(4), res.getFloat(5), res.getString(6), res.getString(7));
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
		return book;
	}
	
	public boolean add(long bookid,String bookname,String brief,String detail, float price, String photo,String category) {
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			state.execute("insert into books values ('"+bookid+"','"+bookname+"','"+brief+"','"+detail+"','"+price+"','"+photo+"','"+category+"')");
			res = state.executeQuery("select * from books where booksid='"+bookid+"' and booksname='"+bookname+"' limit 1");
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
			state.execute("delete from books where booksid="+id);
			res = state.executeQuery("select * from books where booksid='"+id);
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
	
}
