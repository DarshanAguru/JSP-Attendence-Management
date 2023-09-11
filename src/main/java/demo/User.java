package demo;
public class User {

	private String rollno, name, branch, attendence;
	
	
	public String getRoll()
	{
		return rollno;
	}
	
	public String getName()
	{
		return name;
	}
	
	public String getBranch()
	{
		return branch;
	}
	

	
	public String getAtt()
	{
		return attendence;
	}
	
	
	
	public void setRoll(String roll)
	{
		this.rollno = roll;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public void setBranch(String branch)
	{
		this.branch = branch;
	}
	

	
	public void setAtt(String att)
	{
		this.attendence = att;
	}
	
}
