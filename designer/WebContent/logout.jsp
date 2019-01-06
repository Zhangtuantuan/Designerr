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
    <link href="http://img.cndesign.com/Content/headFoot.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/base.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/newBase.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/modals.css">
    <link rel="stylesheet" href="css/message.css">
    <link rel="stylesheet" href="css/requirements.css">
    <link rel="stylesheet" href="css/hire.css">
    <script src="http://img.cndesign.com/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="http://img.cndesign.com/Scripts/jquery-ui.js" type="text/javascript"></script>
</head>
<body>

<div class="head container-fluid">
    <div class="content_box nav_box clear" style="position: relative;">
          <a class="nav_logo lf" href="index.jsp">
         <!--    <img src="images/bk.jpg" heigth="30" width="255">  -->
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
                            <a href="./exit">退出</a>
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
        <li><a class="" href="./show" >网站管理</a></li>
        <li><a class="active" href="logout.jsp" >基本操作</a></li>
    </ul>
</div>        
<div class="dn_main clear">
 
<div class="contain_box main clear">
<br>
<br>
<br>
<table align="center">
            <s:form action="logout1" method="post">
            <tr><td  align="center">     <div class="layui-form-item title">
                  <label class="layui-form-label">用户ID：</label>
                       <div class="layui-input-block" >
                          <s:textfield   cssClass="layui-input"  maxlength="30" cssStyle="width:250px;"  autocomplete="off" name="userId"/>
                       </div>
               </div>
             </td>
             </tr>
                <tr> <td  align="center">     <div class="layui-form-item content">
                       <label class="layui-form-label">手机号码：</label>
                         <div class="layui-input-block">
                             <s:textfield name="phone" cssClass="layui-input" theme="simple" align="center" cssStyle="width:250px;" maxlength="30" />
                          </div>
                     </div>
         </tr>
      
             <tr><td  align="center">   <div class="layui-form-item" margin:0 auto>
                  <div class="layui-input-block" margin:0 auto>
                    <s:submit class="layui-btn sub-form" value="注销"/>
                    </s:form>          
                  </div>
              </div>
        </tr>     
     
</table>
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
