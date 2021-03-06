<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.find1x.gpms.dao.TeacherDAO,com.find1x.gpms.pojos.Teacher,java.util.List"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>毕业设计管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%
	// stylesheet
%>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/main.css" rel="stylesheet" media="screen">
<%
	// icon
%>
<link rel="icon" href="image/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
	<script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div id="wrap">
		<div id="main" class="clearfix">
			<%-- 此行控制是否该页面未登录无法访问 --%>
			<%@ include file="/jsp/authentication.jsp"%>

			<%-- header导航条--%>
			<%@ include file="/jsp/nav.jsp"%>

			<div class="container bs-docs-container">
				<div class="row">
					<div class="col-md-3" id="side">
						<%--导入侧边栏 --%>
						<%@ include file="side.jsp"%></div>
					<div class="col-md-9" id="content">
						<%-- 在注释之间添加代码 --%>
						<div>导入教师信息</div>
						<br />
						<div class="form-group">
							<form action="UploadTeacherInfo" method="POST"
								enctype="multipart/form-data">
								<span class="btn btn-default btn-file"> <input
									type="file" name="teacher_info" />
								</span> <input class="btn" type="submit" />
							</form>
							<p class="help-block">
								<a href="static/teacher_info.xls">点击下载教师信息模板</a>
							</p>
						</div>
						<button  class="btn btn-default" style="float: right"
							onclick="window.location='addTeacher'">增加记录</button>
						<table class="table table-bordered" style="text-align: center">
							<tr>
								<td>工号</td>
								<td>姓名</td>
								<td  width="50">性别</td>
								<td>学院</td>
								<td>电话</td>
								<td>邮箱</td>
								<td>职务</td>
								<td colspan="2">其他</td>
							</tr>
							<%
								List<Teacher> list = TeacherDAO.getList();
								for (Teacher t : list) {
							%>
							<tr>
								<td><%=t.getNo()%></td>
								<td><%=t.getName()%></td>
								<td><%=t.getSex()%></td>
								<td><%=t.getDepartment()%></td>
								<td><%=t.getTelephone()%></td>
								<td><%=t.getEmail()%></td>
								<td><%=t.getPostion()%></td>
								<td><button type="button" class="btn btn-default">删除记录</button></td>
								<td><button type="button" class="btn btn-default">重置密码</button></td>
							</tr>
							<%
								}
							%>
						</table>
						<%-----------------%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--页脚版权信息 --%>
	<%@ include file="/jsp/footer.jsp"%>
	<%--js脚本 --%>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>