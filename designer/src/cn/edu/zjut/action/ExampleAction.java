package cn.edu.zjut.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.ExampleService;
import cn.edu.zjut.service.IDesignerService;
import cn.edu.zjut.service.IExampleService;

public class ExampleAction {
	private String condition; //lyy
	private List examples; //lyy
	private Example example; //xzm
	private Comments comments; //xzm
	private String exampleId;
	
	private List<String> conditionList = new ArrayList<String>();
	private String radio1;
	private String radio2;
	private String radio3;
	
	
	private IExampleService exampleServ=null;
	
	public void setExampleServ(IExampleService exampleServ)
	{
		this.exampleServ=exampleServ;
	}
	public String getCondition() {return condition;}
	public void setCondition(String condition) {this.condition = condition;}
	public List getExamples(){return examples;}
	public void setExamples(List examples){this.examples=examples;}
	public Example getExample(){return example;}
	public void setExample(Example example){this.example=example;}
	public Comments getComments() {return comments;}
	public void setComments(Comments comments) {this.comments=comments;}
	
	//find all example
	public String findAllExample()          
	{
		examples = exampleServ.findAll();
		return "success";
	}
	
	//When you enter the case details page, put the case details and comments and other relevant information into the request
	public String putExample()            
	{
		exampleServ.putExample(example);
		return"success";
	}
	
	//review
	public String review()                 
	{
		if(exampleServ.review(example,comments))
			return "viewSuccess";
		else
			return "viewFail";
	}
	
	    //search example by condition
		public String searchInFrame()
		{
			examples = exampleServ.searchInFrame(condition);
			return "success";
		}
		
		//search example 
		public String searchInList()
		{
			System.out.println("in searchList");
			System.out.println("1:"+radio1+"2:"+radio2+"3:"+radio3);
			if(radio1!=null) conditionList.add(radio1);
			else conditionList.add("");
			if(radio2!=null) conditionList.add(radio2);
			else conditionList.add("");
			if(radio3!=null) conditionList.add(radio3);
			else conditionList.add("");
			examples = exampleServ.searchInList(conditionList);
			return "success";
		}
		
		
		//praise
		public String praise() throws IOException
		{
			System.out.println("exampleId:"+exampleId);
		
			int num = exampleServ.praise(exampleId);  //鏂扮殑鐐硅禐鏁�
			ServletActionContext.getResponse().getWriter().print(num);
			return null;
		}
		
		//star
		public String star() throws IOException
		{
			System.out.println("exampleId:"+exampleId);
			
			exampleServ.star(exampleId);  //鏂扮殑鐐硅禐鏁�
			//ServletActionContext.getResponse().getWriter().print(num);
			return null;
		}
		
		public String getRadio1() {
			return radio1;
		}
		public void setRadio1(String radio1) {
			this.radio1 = radio1;
		} 
		public String getRadio2() {
			return radio2;
		}
		public void setRadio2(String radio2) {
			this.radio2 = radio2;
		}
		public String getRadio3() {
			return radio3;
		}
		public void setRadio3(String radio3) {
			this.radio3 = radio3;
		} 
		public String getExampleId() {
			return exampleId;
		}
		public void setExampleId(String exampleId) {
			this.exampleId = exampleId;
		}
		
}
