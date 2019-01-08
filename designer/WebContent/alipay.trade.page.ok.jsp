<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>确认</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
 <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Extra Styles, not needed for Mega Menu or Boostrap -->
	<link href="css/style3.css" rel="stylesheet">
	<link rel="stylesheet" href="layui/css/layui.css">
	<!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
	<link href="css/mega-menu3.css" rel="stylesheet">
</head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.domain.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="com.alipay.api.response.*"%>
<%@ page import="cn.edu.zjut.dao.*"%>
<%@ page import="cn.edu.zjut.po.*"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
			AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
			AlipayConfig.sign_type);
	AlipayFundTransToaccountTransferRequest AlipayRequest = new AlipayFundTransToaccountTransferRequest();
	AlipayFundTransToaccountTransferModel model = new AlipayFundTransToaccountTransferModel();
	String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
	//商户转账唯一订单号
	model.setOutBizNo(out_trade_no);
	//收款方账户类型。 
	//1、PayeeType=ALIPAY_USERID：PayeeAccount传值pid ,以2088开头的16位纯数字组成。 
	//2、PayeeType=ALIPAY_LOGONID：PayeeAccount传值支付宝登录号(邮箱或手机号)
	model.setPayeeType("ALIPAY_LOGONID");
	//收款方账户。与payee_type配合使用。付款方和收款方不能是同一个账户。
	model.setPayeeAccount("jcrjoy9351@sandbox.com");
	//测试金额必须大于等于0.1，只支持2位小数，小数点前最大支持13位
	model.setAmount(total_amount);
	//当付款方为企业账户且转账金额达到（大于等于）50000元，remark不能为空。
	model.setRemark("单笔到到支付账户转账备注");
	AlipayRequest.setBizModel(model);
	AlipayFundTransToaccountTransferResponse AlipayResponse = alipayClient.execute(AlipayRequest);
	System.out.println(AlipayResponse.getBody());
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	if (AlipayResponse.isSuccess()) {
		System.out.println("调用成功");
		try{
			IOrderrDAO orderrDAO=(IOrderrDAO)ctx.getBean("orderrDAO");
	        Orderr order=orderrDAO.findById(out_trade_no);
	        order.setState("已完成");
	        orderrDAO.update(order);
		}catch (Exception e) {
			e.printStackTrace();
		}
	} else {
		System.out.println("调用失败");
	}
%>
<body>

<header class="container" >
	

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</a>
					
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li><a href="index.jsp">首页</a></li>
						<li><a href="findall.action">看案例</a></li>
						<li><a href="findneeds">找需求</a></li>
								<li><a href="4menus.htm">论坛</a></li>
								<li><a href="styles.htm">装修攻略</a></li>
								
						
							<li><a href="judge.action">我的主页</a></li>
						  
							<li><a href="designerIndex.jsp">个人中心</a></li>
						  
						  
						
							</ul>
						</div><!--/.nav-collapse -->
				</div><!-- Container -->
			</div><!-- Nav Bar - Inner -->
		</div><!-- Nav Bar -->
	

<div style="text-align:center;margin-top:150px;">
<img src="images/tradeok.png" />
</div>
</body>
</html>