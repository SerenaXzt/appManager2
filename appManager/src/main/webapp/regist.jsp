<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href=" <%=basePath%>">
<script type="text/javascript" src="statics/jquery/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentellela Alela! |</title>

<!-- Bootstrap -->
<link
	href="statics/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="statics/gentelella-master/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="statics/gentelella-master/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- Animate.css -->
<link href="https://colorlib.com/polygon/gentelella/css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="statics/gentelella-master/build/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="login">
	<div>
		<br />
		<br />
		<section class="text-center">
			<h1>APP管理系统</h1>
		</section>
		<br />
		<br />
		<form action="${pageContext.request.contextPath }/regist"
			method="post" class="form-horizontal form-label-left" id="regist">
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">登录名*</label>
				<div class="col-md-9 col-sm-9 col-xs-4">
					<input type="text" class="form-control" name="usercode"
						required="required" id="usercode"> <span></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">用户名*</label>
				<div class="col-md-9 col-sm-9 col-xs-4">
					<input type="text" class="form-control" name="username"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">用户类型*</label>
				<div class="col-md-9 col-sm-9 col-xs-4">
					<input type="text" class="form-control" value="普通用户"
						readonly="readonly"> <input type="hidden" value="2"
						name="usertype" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">创建者*</label>
				<div class="col-md-9 col-sm-9 col-xs-4">
					<input type="text" class="form-control" value="普通用户"
						readonly="readonly"> <input type="hidden" value="2"
						name="createdby" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">用户密码*</label>
				<div class="col-md-9 col-sm-9 col-xs-4">
					<input type="text" class="form-control" name="userpassword"
						required="required" />
				</div>
			</div>
			<div class="ln_solid"></div>
			<div class="form-group">
				<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
					<input type="submit" class="btn btn-primary" value="提交" id="submit" />
					<a href="index.jsp" class="btn btn-primary">返回</a>
				</div>
			</div>
		</form>
	</div>
</body>
<!-- <script type="text/javascript">
	var flag = "";
	$("#usercode").blur(function() {
		$(this).next("span").html("");
		var usercode = $(this).val();
		var regSoft = /^[\u4E00-\u9FA5A-Za-z0-9]{3,}$/;
		if (!regSoft.test(usercode)) {
			$(this).next("span").html("请输入至少3个字符").css("color", "red");
			flag = false;
		} else {
			$.ajax({
				url : "validateUser/" + usercode,
				type : "GET",
				success : function(result) {
					if(result.code == 200){
						$("#usercode").next("span").html("登录名已存在！").css("color","red");
						flag = false;
					}else{
						$("#usercode").next("span").html("登录名可以使用").css("color","green");
						flag = true;
					}
				}
			})
		}
	});
	$("#submit").click(function(){
		if(flag){
			$("#submit").submit();
		}
	})
</script> -->
</html>