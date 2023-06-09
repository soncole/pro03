<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/head.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN - 게시판 수정</title>
</head>
<body>
<jsp:include page="/header.jsp" />
<form class="frm1" action="BoardUpdatePro.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tbody>
			<tr>
				<th>
					<label for="cate1">게시글 분류</label><br>
					<span id="bnotxt"></span>
				</th>
				<td>
					대분류 : 
				<div class="select is-info">
					<select id="cate1" name="cate1" class="form-control">
						<option value="">선택안함</option>
						<c:forEach items="${cateList }" var="cate1">
						<option value="${cate1.ct }">${cate1.cateGroup }</option>
						</c:forEach>	
					</select>
				</div>
					소분류 :
				<div class="select is-info">
					<select id="cate" name="cate" class="form-control">
								<option value="">선택안함</option>
					</select><br>
				</div>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="bno" id="bno" value="${board.bno }"></td>
			</tr>
			<tr>
				<th><label for="btitle">제목</label></th>
				<td>
				<input value="${board.btitle }" class="input is-primary" id="btitle" name="btitle" type="text" title="50글자 미만 작성" placeholder="50글자 미만으로 제목을 입력해주세요." maxlength="49" >
				</td>
			</tr>
			<tr>
				<th><label for="bcontent">내용</label></th>
				<td>
				<input value="${board.bcontent }" class="input is-primary" id="bcontent" name="bcontent" type="text" title="1000글자 미만 작성" placeholder="1000글자 미만으로 내용을 입력해주세요." maxlength="999" >
				</td>
			</tr>
			<tr>
				<th><label for="baddress">주소</label></th>
				<td>
				<input value="${board.baddress }" class="input is-primary" id="baddress" name="baddress" type="text" title="100글자 미만 작성" placeholder="100글자 미만으로 주소를 입력해주세요." maxlength="99" >
				</td>
			</tr>
			<tr>
				<th><label for="btel">연락처</label></th>
				<td>
				<input value="${board.btel }" class="input is-primary" id="btel" name="btel" type="tel" title="20글자 미만 작성" placeholder="20글자 미만으로 연락처를 입력해주세요." maxlength="19" >
				</td>
			</tr>
			<tr>
				<th>지도 좌표 설정</th>
				<td colspan="2">
				<input value="${board.latitude }" type="number" id="latitude" name="latitude" title="위도를 입력해주세요" placeholder="위도를 입력해주세요">
				<input value="${board.longitude }" type="number" id="longitude" name="longitude" title="경도를 입력해주세요" placeholder="경도를 입력해주세요">
				</td>
			</tr>
			<tr>
				<th><label for="pic1">게시글 이미지 첨부</label></th>
				<td>
					이미지 1 : <p id="picAttac1"></p><input value="${board.bpic1 }" type="file" accept="image/*" name="bpic1" id="bpic1" class="form-control file"><br>
					이미지 2 : <p id="picAttac2"></p><input value="${board.bpic2 }" type="file" accept="image/*" name="bpic2" id="bpic2" class="form-control file"><br>
					이미지 3 : <p id="picAttac3"></p><input value="${board.bpic3 }" type="file" accept="image/*" name="bpic3" id="bpic3" class="form-control file">
					이미지 4 : <p id="picAttac4"></p><input value="${board.bpic4 }" type="file" accept="image/*" name="bpic4" id="bpic4" class="form-control file">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="submit-btn" class="button button-info" value="글 수정">
					<a href="${path1 }/BoardList.do" class="button button-info">게시글 목록</a>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<jsp:include page="/footer.jsp" />
<script>
$(document).ready(function(){
	$("#pd_comment").click(function(){
		if($(this).text()=="500자 이내"){
			$(this).text("");
		}
	});
	$(".file").change(function(){
		var tar = $(this).index();
		if($(this).val()!=""){
			$(this).prev("p").html("<strong>이미지 첨부 섬공</strong>");
		}
	});
	$("#cate1").change(function(){
		if($("#cate1").val()==""){
			alert("대분류 카테고리를 선택하시기 바랍니다.");
			$("#cate1").focus();
			return;
		}
		var params = {cate1:$("#cate1").val()}
		console.log(params);
		$.ajax({
			url:"${path1 }/CategoryLoading.do",
			type:"post",
			dataType:"json",
			encType:"UTF-8",
			data:params,
			success:function(result){
				console.log(result);
				var ctList = result.ctList;
				var msg = result.msg;
				$("#cate").empty();
				$("#cate").append("<option value=''>선택안함</option>");
				for(var c in ctList){
					$("#cate").append("<option value='"+ctList[c]["cate"]+"'>"+ctList[c]["cateName"]+"</option>");
				}
			}
		})
	})
})
</script>
</body>
</html>