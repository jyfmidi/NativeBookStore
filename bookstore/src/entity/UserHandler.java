package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserHandler {
	Connection conn;
	Statement state;
	ResultSet result;
	
	public boolean isUserExist(long userid)
	{
		boolean isExist = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			result = state.executeQuery("select * from users where userid='"+userid+"' limit 1");
			if(result.next())
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isExist;
	}
	public boolean isUserNameExist(String username)
	{
		boolean isExist = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			result = state.executeQuery("select * from users where username='"+username+"' limit 1");
			if(result.next())
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isExist;
	}
	public boolean register(String username,String pwd,String truename,String email, String phonenumber, String address) {
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			state.execute("insert into users values (null,'"+username+"','"+pwd+"',null,'"+truename+"','"+email+"','"+phonenumber+"','"+address+"')");
			result = state.executeQuery("select * from users where username='"+username+"' and password_='"+pwd+"' limit 1");
			if(result.next())
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccessed;
	}
	
	public boolean checkUser(String username,String pwd) {
		boolean isMember = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			result = state.executeQuery("select password_ from users where username='"+username+"' limit 1");
			if(result.next())
			{
				if(pwd.equals(result.getString(1)))
				{
					isMember = true;
				}
				
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isMember;
	}
	public ArrayList<User> getNewUser()
	{
		ArrayList<User> arr = new ArrayList<User>();
		try{
			conn = new DBConnection().getConnection();
		state = conn.createStatement();
		result = state.executeQuery("select * from users order by userid desc limit 12");
		while(result.next())
		{
			arr.add(new User(result.getLong(1), result.getString(2), result.getString(3), result.getInt(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8)));
		}
		}catch (SQLException e) {
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return arr;
	}
	public User getUserByUserName(String username)
	{
		User user = null;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			result = state.executeQuery("select * from users where username='"+username+"' limit 1");
			if(result.next())
			{
				user = new User(result.getLong(1), result.getString(2), result.getString(3), result.getInt(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8));
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public User getUser(long userid)
	{
		User user = null;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			result = state.executeQuery("select * from users where userid='"+userid+"' limit 1");
			if(result.next())
			{
				user = new User(result.getLong(1), result.getString(2), result.getString(3), result.getInt(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8));
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public boolean remove(long userid)
	{
		boolean isSuccessed = false;
		try {
			conn = new DBConnection().getConnection();
			state = conn.createStatement();
			state.execute("delete from users where userid="+userid);
			result = state.executeQuery("select * from users where userid='"+userid);
			if(result.next())
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
				if (result != null) {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccessed;
	}
}
