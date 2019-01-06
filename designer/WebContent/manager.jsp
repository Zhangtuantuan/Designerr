<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="cn.edu.zjut.po.Designer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="content-type" charset="utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>管理员页面</title>
     <link href="http://img.cndesign.com/Scripts/admin/jQuery.jcrop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/base.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/headFoot.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/newBase.css" rel="stylesheet" type="text/css" />
    <script src="http://img.cndesign.com/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="http://img.cndesign.com/Scripts/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/modals.css">
    <link rel="stylesheet" href="css/message.css">
    <link rel="stylesheet" href="css/requirements.css">
</head>
<body>

<div class="head container-fluid">
    <div class="content_box nav_box clear" style="position: relative;">
         <a class="nav_logo lf" href="index.jsp">
         
        <!--  <img src="images/bk.jpg" heigth="30" width="255">  -->
        </a>
        <div class="navbar_collapse lf"></div>
        <ul class="navbar_ul lf clear" style="display: none;">
                <li class="navbar_li lf nb_noneUl ">
                        <a href="index.jsp" target="_parent" class="navbar_a">首页</a>
                </li>
                <li class="navbar_li lf  ">
                        <a href="needList.jsp" class="navbar_a">需求<b class="trangle"></b></a>         
                </li>
                <li class="navbar_li lf  ">
                        <a href="selectDesigner.jsp" class="navbar_a">设计师<b class="trangle"></b></a>    
                </li>   
               <li class="navbar_li lf  ">
                        <a href="projects.jsp" class="navbar_a">搜索<b class="trangle"></b></a>    
                </li>    
        </ul>
            <div class="top_login rf clear">
                <div class="person_info lf">
                    <a href="http://www.cndesign.com/Home/MyIndex">
                        <img src="http://img.cndesign.com/Content/images/tx_130.jpg">
                    </a>
                    <ul class="mine_ul">
                        <li class="mine_li">
                            <a href="./exit>">退出</a>
                        </li>
                    </ul>
                </div>
            </div>
       
        <!-- 登录后 END -->
    </div>
</div>

<!-- 首屏 导航条 -->
<div class="nav contain-fluid" style="display: block; ">
    <div class="content_box nav_box_v1 clear">
        <div class="lf zryd-nav">
            <ul class="nav_ul_v1 lf clear">
                    <li class="nav_li_v1">
                        <a class="nav_a_v1  " href="index.jsp" target="_parent">
                            首页
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="needList.jsp">
                           需求                 
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="selectDesigner.jsp" target="_parent">
                         设计师                   
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="projects.jsp" target="_parent">
                           搜索
                        </a>
                    </li>
                    
            </ul>
              
            <!-- 首屏 导航条 END -->
        </div>
       
    </div>
</div>


<script type="text/javascript">
    $.userID = '7c46edb7-6eee-4d41-b8d4-a99c00e8274a';
    $.userStatus=1;
    var PicHub = "http://img.cndesign.com";
</script>
    <div class="top">
        <div class="dn_frame">

<div class="dn_mem">
    <div class="dn_mem_bg mod_c">
        <img src="http://img.cndesign.com/Content/images/mem_bg.jpg">
       
    </div>
    <div class="dn_men_bg_lv"><img src="http://img.cndesign.com/Content/images/mem_mo_bg.jpg" alt=""></div>
    <div class="dn_mem_left">
      <a class="tx_mod cur_tx user_tx" id="mod_tx" href="javascript:void(0);" title="点击修改"><img src="<s:property value="#session.admin.profilePhoto"/>"  height="130" width="130"></a>
        <div class="dn_mem_msg">
            <div class="nickn f20">
                <em class="nick_name ver_top userNickName">
                <s:property value="#session.admin.adminId"/>
                </em>
                    <i class=""></i>
            </div>
            <div class="mem_ps f14 mt15 mb20">

            </div>
          
        </div>
       
    

      
    </div>
</div>

<div class="dn_main_nav">
    <ul class="ssbtn">
        <li><a class="" href="./show2" >认证中心</a></li>
        <li><a class="active" href="./show" >网站管理</a></li>
        <li><a class="" href="logout.jsp" >注销账号</a></li>
    </ul>
</div>        
<div class="dn_main clear">
 <div class="dn_nav_con xg clear">
  <div class="dnc_clsLine ssbtn">
            <a class="active" href="./show">设计师推优</a>
            <a  href="./show1">案例推优</a>
        </div>
</div>
<div class="contain_box">
  <div class="thead clear">
  <span class="col_01 thead_title">设计师编号</span>
  <span class="col_02 thead_startTime">设计师账户</span>
  <span class="col_03 thead_startTime">推优费</span>
  <span class="col_05 thead_startTime"></span>
  </div>
  <%
     int i=0;
  %>
  <s:if test="#session.Designerss.size()!=0">
   <% if(i<4){ %>
		<s:iterator value="#session.Designerss" var="designer" >
		  <s:if test="#designer.status1!=null  && (#designer.status1.intValue()==1  || #designer.status1.intValue()==2)" >
			<div class="main_requirements">
              <ul class="list_contain">
                <li class="clear list">
                  <div class="col_01 fl req_title">
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <b><s:property value="designerId"/></b>
                     </h4>
                  </div>
              <div class="col_02 fl req_sort"><span><s:property value="account"/></span></div>
              <div class="col_03 fl req_sort"><span><s:property value="money1"/></span></div>
              <s:if test="status1.intValue()==1">
                <div class="col_05 fl req_status"><a href="recommendD.action?designer.designerId=<s:property value='designerId'/>"><font color="red">推优</font></a></div>
              </s:if>
              <s:if test="status1.intValue()==2">
              <div class="col_05 fl req_status"><font color="red">已推优</font></div>"
              </s:if>
              </li>
              </ul>
              </div>
             </s:if>
		</s:iterator>
		<%
		  i=i+1;}
		%>
	</s:if>
		<s:else>
		<h1>当前没有推优预约哦</h1>
		</s:else>
 </div>

<script type="text/javascript">
    var col_list = '<select id="col_select"><option value="451354">笔记</option><select>';
    $(function () {
        $('.edit').deleteWorks();
        $('.edit').shareWorks();
    });
</script>
       </div>
    </div>
    <script src="http://img.cndesign.com/Scripts/header.js" type="text/javascript"></script>    
<div class="back">
    <i></i>
</div>
<!-- footer -->
 <div class="contain_fluid footer">
         <div class="contain_box">
        <div class="links">
       <ul class="clear about_problem">
       <li class="fl"><a href="/Default/About" target="_blank">关于我们</a></li>
      <li class="fl"><a href="#" target="_blank">新手指南</a></li>
        <li class="fl"><a href="/Default/About#3" target="_blank">雇主问题</a></li>
      <li class="fl"><a href="/Default/About#3" target="_blank">设计师问题</a></li>
      <li class="fl"><a href="/Default/Agreement" target="_blank">用户协议</a></li>
      <li class="fl"><a href="/Default/About#5" target="_blank">版权声明</a></li>
      <li class="fl"><a href="/Default/About#6" target="_blank">交易保障</a></li>
    <li class="fl"><a href="/Default/About#2" target="_blank">商务合作</a></li>
    <li class="fl"><a href="/Default/About#4" target="_blank">联系我们</a></li></ul></div>
      <div class="copy_right"><a class="icp" href="http://www.miitbeian.gov.cn/" target="_blank">豫ICP备16038122号-3</a>
      <span class="v_line"></span><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002261" target="_blank">豫公网安备 41019702002261号</a>
     <span class="v_line"></span><span>Copyright ©2006-2018 中国设计网</span></div>
     </div>
     </div>
      <script type="text/javascript">
        var msg=""+'${request.tipMessage}'; 
        if(msg!=""){ 
          alert(msg); 
      } 
        </script>
</body>
</html>
