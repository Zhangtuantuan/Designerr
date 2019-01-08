package cn.edu.zjut.action;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.DesignerService;
import cn.edu.zjut.service.IDesignerService;

public class DesignerAction extends ActionSupport {
	private Example example;
	private Designer designer;
	IDesignerService designerServ = null;
	// Envelope Upload File Properties
	private File[] upload;
	private File[] upload2;

	private String designerID; 
	private String account;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getDesignerID() {
		return designerID;
	}

	public void setDesignerID(String designerID) {
		this.designerID = designerID;
	}

	public IDesignerService getDesignerServ() {
		return designerServ;
	}

	public void setDesignerServ(IDesignerService designerServ) {
		System.out.println("setservice");
		this.designerServ = designerServ;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public File[] getUpload2() {
		return upload2;
	}

	public void setUpload2(File[] upload2) {
		this.upload2 = upload2;
	}

	public Example getExample() {
		return example;
	}

	public void setExample(Example example) {
		this.example = example;
	}

	public Designer getDesigner() {
		return designer;
	}

	public void setDesigner(Designer designer) {
		this.designer = designer;
	}

	//subscribe
	public String gotoSubscribe() 
	{
		// System.out.println("designerID:"+designerID);
		Designer designer = new Designer();
		designer.setDesignerId(designerID);
		;
		designerServ.putDesigner(designer);
		return "success";
	}

	//upload example
	public String upload() throws Exception { 
		if (designerServ.upload(example, upload, upload2))
			return "uploadSucccess";
		else
			return "uploadFail";
	}

	//login
	public String login() {
		if (designerServ.login(designer))
			return "loginSuccess";
		else
			return "loginFail";
	}

	//To determine if it was the designer or anyone else who clicked the "Visit the Designer Home Page" button
	public String putDesigner() 
	{
		if (designerServ.putDesigner(designer))
			return "myself";
		else
			return "others";
	}

	//When you enter your profile, judge whether you're a designer or an employer
	public String judgeIdentity() 
	{
		if (designerServ.judgeIdentity())
			return "designer";
		else
			return "employer";
	}

	//designer register
	public String registerDes() { 
		if (designerServ.registerDes(designer)) {
			return "success";
		}
		return "fail";
	}

	//view example's details
	public String viewExampleDetails() {
		if (designerServ.viewExampleDetails(designer, example))
			return "viewSuccess";
		else
			return "viewFail";
	}

	//find all designers
	public String findAll() {
		if (designerServ.findAll())
			return "success";
		else
			return "false";
	}

	//find designers by praise
	public String findByPraise() throws Exception {
		if (designerServ.findByPraise())
			return "praiseSuccess";
		else
			return "praiseFail";
	}

	//find designers by score
	public String findByScore() throws Exception {
		if (designerServ.findByScore())
			return "scoreSuccess";
		else
			return "scoreFail";
	}

	//designer logout
	public String logout() {
		if (designerServ.logout())
			return "success";
		else
			return "false";
	}

	private File profile;
	public String profileFileName;
	private File certificate;
	public String certificateFileName;
	private int money1;
	private String message;

	//designer update profile
	public String update() {
		System.out.println(designer.getDesignerId());
		System.out.println(designer.getAccount());
		if (designerServ.update(designer, profile, profileFileName))
			return "success";
		else
			return "fail";
	}

	//designer certify 
	public String update2() {
		if (designerServ.update2(designer, certificate, certificateFileName))
			return "success";
		else
			return "fail";
	}

	//apply for designer preference
	public String recommend1() {
		if (designerServ.recommend1(money1))
			return "success";
		else
			return "fail";
	}

	//designer preference successfully
	public String recommend2() {
		if (designerServ.recommend2(money1))
			return "success";
		else
			return "fail";
	}

	//apply for example preference
	public String recommend3() {
		if (designerServ.recommend3(message))
			return "success";
		else
			return "fail";
	}

	public File getProfile() {
		return profile;
	}

	public void setProfile(File profile) {
		this.profile = profile;
	}

	public String getProfileFileName() {
		return profileFileName;
	}

	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}

	public File getCertificate() {
		return certificate;
	}

	public void setCertificate(File certificate) {
		this.certificate = certificate;
	}

	public String getCertificateFileName() {
		return certificateFileName;
	}

	public void setCertificateFileName(String certificateFileName) {
		this.certificateFileName = certificateFileName;
	}

	public int getMoney1() {
		return money1;
	}

	public void setMoney1(int money1) {
		this.money1 = money1;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	//find designer by account
	public String searchByAccount() 
	{
		if (designerServ.searchByAccount(account))
			return "idSuccess";
		else
			return "idFail";
	}
}
