package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class delete 
{
	public static void main(String[] args) 
	{
		String url = "jdbc:mysql://localhost:3306?user=root&password=shrivenubabu";
		String qry = "delete from login.info where username='VishalPatankar'";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url);
			PreparedStatement pstmt = con.prepareStatement(qry);
			
			pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			
		}
	}
}
