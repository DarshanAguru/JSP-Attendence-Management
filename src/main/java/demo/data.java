package demo;
import java.sql.*;
import java.util.*;

import demo.User.*;


public class data{
	
	

	public static Connection connect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "");
			return con;
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
		return null;
	}
	
	
	// ATTENDENCE 
	
	public static ArrayList<User> displayAtt()
			{
				ArrayList<User> users = new ArrayList<User>();
		try {
			Connection con = connect();
			PreparedStatement ps = con.prepareStatement("select * from studentsatt");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				User u = new User();
				u.setRoll(rs.getString(1));
				u.setName(rs.getString(2));
				u.setBranch(rs.getString(3));
				u.setAtt(rs.getString(4));
				users.add(u);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return users;
			}
	
	public static int insertAtt(User u)
	{
		int status = 0;
		try {
		Connection con = connect();
		PreparedStatement ps = con.prepareStatement("Insert into studentsatt(rollno, sname, sbranch, satt) values(?,?,?,?)");
		ps.setString(1, u.getRoll());
		ps.setString(2, u.getName());
		ps.setString(3, u.getBranch());
		ps.setString(4, u.getAtt());
		status = ps.executeUpdate();
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static int deleteAtt(String rollno)
	{
		int status =  0;
		try {
			Connection con = connect();
			Statement smt = con.createStatement();
			smt.execute("DELETE FROM STUDENTSATT WHERE ROLLNO=" +rollno);
			status = 1;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	
	public static User getUserAtt(String rollno)
	{
		User u = null;
		try {
			Connection con = connect();
			PreparedStatement ps = con.prepareStatement("select * from studentsatt where rollno=?");
			ps.setString(1, rollno);
			ResultSet rs = ps.executeQuery();
			u = new User();
			while(rs.next())
			{
				
				u.setRoll(rs.getString(1));
				u.setName(rs.getString(2));
				u.setBranch(rs.getString(3));
				u.setAtt(rs.getString(4));
				
			}
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		
		}
		return u;
	}
	
	public static int updateAtt(User u)
	{
		int status = 0;
		try {
			Connection con = connect();
			PreparedStatement ps = con.prepareStatement("update studentsatt set sname=?, sbranch=?, satt=? where rollno=?");
			ps.setString(1,u.getName());
			ps.setString(2, u.getBranch());
			ps.setString(3, u.getAtt());
			ps.setString(4, u.getRoll());
			status = ps.executeUpdate();
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	
	// RESULT
	
	public static ArrayList<UserRes> displayRes()
	{
		ArrayList<UserRes> usersres = new ArrayList<UserRes>();
try {
	Connection con = connect();
	PreparedStatement ps = con.prepareStatement("select * from studentsres");
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		UserRes u = new UserRes();
		u.setRoll(rs.getString(1));
		u.setName(rs.getString(2));
		u.setBranch(rs.getString(3));
		u.setCgpa(rs.getString(4));
		usersres.add(u);
	}
}
catch(Exception e)
{
	System.out.println(e);
}

	return usersres;
	}

public static int insertRes(UserRes u)
{
int status = 0;
try {
Connection con = connect();
PreparedStatement ps = con.prepareStatement("Insert into studentsres(rollno, sname, sbranch, scgpa) values(?,?,?,?)");
ps.setString(1, u.getRoll());
ps.setString(2, u.getName());
ps.setString(3, u.getBranch());
ps.setString(4, u.getCgpa());
status = ps.executeUpdate();

}
catch(Exception e)
{
	System.out.println(e);
}
return status;
}

public static int deleteRes(String rollno)
{
int status =  0;
try {
	Connection con = connect();
	Statement smt = con.createStatement();
	smt.execute("DELETE FROM STUDENTSRES WHERE ROLLNO=" +rollno);
	status = 1;
}
catch(Exception e)
{
	System.out.println(e);
}
return status;
}


public static UserRes getUserRes(String rollno)
{
UserRes u = null;
try {
	Connection con = connect();
	PreparedStatement ps = con.prepareStatement("select * from studentsres where rollno=?");
	ps.setString(1, rollno);
	ResultSet rs = ps.executeQuery();
	u = new UserRes();
	while(rs.next())
	{
		
		u.setRoll(rs.getString(1));
		u.setName(rs.getString(2));
		u.setBranch(rs.getString(3));
		u.setCgpa(rs.getString(4));
		
	}
	
	
}
catch(Exception e)
{
	System.out.println(e);
	
	
}
return u;
}

public static int updateRes(UserRes u)
{
int status = 0;
try {
	Connection con = connect();
	PreparedStatement ps = con.prepareStatement("update studentsres set sname=?, sbranch=?, scgpa=? where rollno=?");
	ps.setString(1,u.getName());
	ps.setString(2, u.getBranch());
	ps.setString(3, u.getCgpa());
	ps.setString(4, u.getRoll());
	status = ps.executeUpdate();
	
	
	
}
catch(Exception e)
{
	System.out.println(e);
}
return status;
}


	
}