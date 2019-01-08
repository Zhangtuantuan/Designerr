package cn.edu.zjut.action;

import java.io.File;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.service.EmployerService;
import cn.edu.zjut.service.IEmployerService;

public class EmployerAction {
	Employer employer;
	IEmployerService employerServ=null;
	
	public void setEmployerServ(IEmployerService employerServ){this.employerServ=employerServ;}
	public Employer getEmployer(){return employer;}
	public void setEmployer(Employer employer){this.employer=employer;}
	
	//employer register
	public String registerEmp() {     
		if(employerServ.registerEmp(employer)) {
			return "success";
		}
		return "fail";
	}
	
	//Determine if the designer or anyone else visited the employer's homepage
	public String putEmployer()                       
	{
		if(employerServ.putEmployer(employer))
			return "myself";
		else
			return"others";
	}
	
	
	
	private File uprofile;
	public String uprofileFileName;
	//update emplyer's profile
	public String update3() {
		EmployerService emserv=new EmployerService();	
		if(emserv.update3(employer,uprofile,uprofileFileName))
			return "success";
		else
			return "fail";
	}
	public File getUprofile() {
		return uprofile;
	}
	public void setUprofile(File uprofile) {
		this.uprofile = uprofile;
	}
	public String getUprofileFileName() {
		return uprofileFileName;
	}
	public void setUprofileFileName(String uprofileFileName) {
		this.uprofileFileName = uprofileFileName;
	}
}
