<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href=" <%=basePath%>">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="statics/jquery/jquery-1.12.4.js"></script>

<%@include file="/statics/common/back_head.jsp" %>
<h2>历史版本</h2>
   <c:if test="${ !empty requestScope.appversionvo}">
		<table class="table table-striped table-hover table-bordered">
		  <tr>
		    <th>软件名称</th>
		    <th>版本号</th>
		    <th>版本大小（单位：M）</th>
		    <th>发布状态</th>
		    <th>APK文件下载</th>
		    <th>最近更新时间</th>
		  </tr>
			<c:forEach items="${requestScope.appversionvo }" var="appVersion">
			  <tr>
			    <td>
			    	${appVersion.softwareName }
			    	<c:set var="appId" value="${appVersion.id}" scope="request"></c:set>
			    </td>
			    <td>${appVersion.versionNo }</td>
			    <td>${appVersion.versionSize }</td>
			    <td>${appVersion.publishStatus }</td>
			    <td>${appVersion.apkFileName }</td>
			    <td><fmt:formatDate value="${appVersion.modifyDate }" pattern="yyyy-MM-dd" /></td>
			  </tr>
		</c:forEach> 
	</table>
	</c:if>
	<hr/>
	<h2>待审核APP信息</h2>
  	<form action="#" class="form-horizontal form-label-left" method="POST">
  		<input type="hidden" name="_method" value="PUT" />
  		<input type="hidden" id="appId" name="id" value="${requestScope.appInfoVo.id}" />
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="softwareName" name="softwarename" class="form-control" value="${requestScope.appInfoVo.softwarename }" >
           	<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">APK名称*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="apkName" name="apkname" class="form-control" readonly="readonly" value="${requestScope.appInfoVo.apkname }">
           		<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">支持ROM*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="supportRom" name="supportrom" class="form-control" value="${requestScope.appInfoVo.supportrom}">
           		<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">界面语言*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="interfaceLanguage" name="interfacelanguage" class="form-control" value="${requestScope.appInfoVo.interfacelanguage}">
           		<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">软件大小*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="softwareSize" name="softwaresize" class="form-control" value="${requestScope.appInfoVo.softwaresize}">
           		<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">下载次数*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="downloads" name="downloads" class="form-control" value="${requestScope.appInfoVo.downloads}">
           		<span></span>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <input type="text" readonly="readonly" id="flatformid" name="flatformid" class="form-control" value="${requestScope.appInfoVo.flatformid}">
           </div>
         </div>
        

         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
          	<input type="text" value="待审核" readonly="readonly" class="form-control"/>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">版本号*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
           		<input type="text" readonly="readonly" class="form-control"  value="${requestScope.appInfoVo.versionNo}" />
           </div>
         </div>
         
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">应用简介*<span class="required"></span>
           </label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <textarea style="resize: none" class="form-control" rows="3" readonly="readonly">
             	${requestScope.appInfoVo.appinfo}
             </textarea>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3 col-sm-3 col-xs-12">图片*</label>
           <div class="col-md-9 col-sm-9 col-xs-12">
             <img style="width: 100px" src="${requestScope.appInfoVo.logopicpath}">
           </div>
         </div>
         
         <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
            	<input id="checked" type="button" class="btn btn-success" value="审核通过"/>
              <input id="unchecked" class="btn btn-success" type="button" value="审核不通过" />
              <a class="btn btn-primary" href="appsInfo" >返回</a>
            </div>
          </div>
       </form>
       
<script type="text/javascript">

function check(){
	var appId = $("#appId").val();
	var status = 0;
	var selfId = $(this).attr("id");
	if(selfId == "checked"){
		status = 2;
	}else if(selfId == "unchecked"){
		status = 3;
	}
	$.ajax({
		url:"appCheck",
		type:"GET",
		dataType:"JSON",
		data:{"appId":appId,"status":status},
		success:function(result){
			if(result.code == 100){
				var flag = result.extend.flag;
				if(flag == "true"){
					alert("审核通过~~");
					window.location.href="${pageContext.request.contextPath}/appsInfo";
				}else{
					alert("你残忍的回绝了~~");
					window.location.href="${pageContext.request.contextPath}/appsInfo";
				}
			}else{
				window.location.href="${pageContext.request.contextPath}/error.jsp";
			}
		}
	})
	return false;
}

	$("#checked").click(check);
	$("#unchecked").click(check);
</script>
<script type="text/javascript" src="statics/common/js/ajaxThreeLevel.js"></script>
<script type="text/javascript" src="statics/common/js/validate.js"></script>
<%@include file="/statics/common/footer.jsp" %>