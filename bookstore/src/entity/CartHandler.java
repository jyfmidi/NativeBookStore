package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class CartHandler {
  Connection connection;
  Statement statement;
  ResultSet resultset;
  HashMap<String, String> hashMap = new HashMap<String, String>();

  public void addNewBook(String id, String qty) {
    if(!hashMap.containsKey(id))
      hashMap.put(id, qty);
  }

  public void clear() {
    hashMap.clear();
  }

  public void updateBookById(String id, String qty) {
    hashMap.put(id, qty);
  }
  
  public void AddBook1QuantityById(String id) {
    hashMap.put(id, ""+(Integer.parseInt(hashMap.get(id))+1));
  }
  public void SubBook1QuantityById(String id) {
    hashMap.put(id, ""+(Integer.parseInt(hashMap.get(id))-1));
    if("0".equals(hashMap.get(id)))
    {
      hashMap.remove(id);
    }
  }
  public int getBookCount()
  {
    return hashMap.size();
  }
  public int getTotalBookPrice()
  {
    int sum = 0;
    ArrayList<Book> books = getBook();
    Iterator<String> it = hashMap.keySet().iterator();
    for(int i = 0;i <books.size();i++)
    {
      sum += Integer.parseInt(getBookCountById(books.get(i).getBookid()+"")) * books.get(i).getBookprice();
    }
    return sum;
  }
  public void removeBookById(String id)
  {
    hashMap.remove(id);
  }
  public String getBookCountById(String id)
  {
    return hashMap.get(id);
  }
  public ArrayList<Book> getBook() {
    ArrayList<Book> arr = new ArrayList<Book>();
    if(hashMap.isEmpty())
    {
      return arr; 
    }
    try {
      connection = new DBConnection().getConnection();
      statement = connection.createStatement();
      String sql = "select * from books where booksid in (";
      Iterator<String> iterator = hashMap.keySet().iterator();
      while(iterator.hasNext())
      {
        sql += iterator.next();
        if(iterator.hasNext())
           sql += ",";
        else
          sql += ")";
      }
      resultset = statement.executeQuery(sql);
      while (resultset.next())
        arr.add(new Book(resultset.getLong(1), resultset.getString(2), resultset.getString(3), resultset.getString(4), resultset.getFloat(5), resultset.getString(6), resultset.getString(7)));
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      try {
        if (connection != null) {
          connection.close();
        }
        if (statement != null) {
          statement.close();
        }
        if (resultset != null) {
          resultset.close();
        }
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
    return arr;
  }
}
