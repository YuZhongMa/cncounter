<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../basePath.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>二维码显示 - CN计数-cncounter</title>
	<jsp:include page="/common/cssjs.jsp"></jsp:include>
	<jsp:include page="/common/clipboard.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="content_left">
		
			<p class="h1"> 二维码显示</p>
			<div>
				<form id="input_form" action="<%=basePath %>qrcode/ajax/genqrcode.json" method="post">
					<span>二维码内容:</span>
					<br/>
					<textarea readonly="readonly" tabindex="3" id="content" name="content" rows="8" cols="36">${content}</textarea>
					<br/>
					
					<a id="btn_copy"  tabindex="4" class="btn btn-sm btn-success btn-block"> 点击复制 </a> 
				</form>
			</div>
			<div>
			<br/>
			</div>
			<div class="qrcode-jpeg-area">
				<span>二维码图片:</span>
				<br/>
				<a id="qrcode_img_anchor" target="_blank" href="<%=basePath %>rest/qrcode/${uuid}.jpeg">
					<img id="qrcode_img" alt="${content}" src="<%=basePath %>rest/qrcode/${uuid}.jpeg" class="qrcode-img img-responsive center-block">
				</a>
			</div>
			<a href="<%=basePath %>qrcode/input.php" class="btn btn-lg btn-warning btn-block">  &lt;&lt;返回 </a> 
		</div>
		<jsp:include page="/common/sidebar.jsp"></jsp:include>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		
	
		$(function(){
			//
			var $btn_copy = $("#btn_copy");
			var $content = $("#content");
			
			//
			$btn_copy.click(function(){
				//
				var content = $content.val() || "";
				try{
					content && copy(content);
				} catch(ex){
					//
					try{
						var content0=$content[0]; 
						content0.select(); // 选择对象 
						document.execCommand("Copy"); // 执行浏览器复制命令 
					} catch(ex2){
						alert("复制失败");
					}
				}
			});
			//
			/**
			setTimeout(function() {
				//set path
				ZeroClipboard.setMoviePath('http://davidwalsh.name/dw-content/ZeroClipboard.swf');
				//create client
				var clip = new ZeroClipboard.Client();
				//event
				clip.addEventListener('mousedown',function() {
					// 由JS自己控制
					var content = $content.val() || "";
					//
					if(!content){
						//alert("复制的内容为空!");
						return;
					}
					try{
						// 由JS自己控制
						clip.setText(content);
					} catch(ex){
						// 不能用 window.copy 判断,杯具
						try{
							content && copy(content);
						} catch(ex){
						}
					}
					
				});
				clip.addEventListener('complete',function(client,text) {
					alert("复制成功!"); // 这里应该修改为使用 msg
				});
				//glue it to the button
				clip.glue('btn_copy');
			}, 200);
			*/
		});
	</script>
</body>
</html>