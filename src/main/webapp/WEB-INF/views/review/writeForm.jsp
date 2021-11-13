<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>리뷰 쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/write.css" />" rel="stylesheet">
	<script>
	function loadFile(input) {
        let file = input.files[0]; // 선택된 파일 가져오기
        let newImage = document.createElement("img"); //새 이미지 추가

        //이미지 source 가져오기
        newImage.src = URL.createObjectURL(file);
        newImage.id = "img-id"
        newImage.style.width = "100%";
        newImage.style.height = "100%";
        newImage.style.objectFit = "cover";

        //이미지를 image-show div에 추가
        container = document.getElementById('image-show');
        container.appendChild(newImage);
    }
	
	$(function(){
		$('#content').keyup(function(){
		bytesHandler(this);
		});
		});

		function getTextLength(str) {
		var len = 0;

		for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
		len++;
		}
		len++;
		}
		return len;
		}

		function bytesHandler(obj){
		var text = $(obj).val();
		$('p.bytes').text(getTextLength(text) + "/ 500");
		if (getTextLength(text) > 500) {
			alert("최대 500bytes까지 입력 가능합니다.");
			//$(obj).val(text.substring(0, 50));
		}
		}

	</script>
</head>
<body>
	<form action="writeProc" method="post" enctype="multipart/form-data">
	<section class="ReviewWritingPage__Container">
	    <div class="ReviewWritingPage__Row">
	      <strong class="RestaurantSubMessage__RestaurantName">식당 이름1</strong>
	    </div>
		<textarea name="content" id="content" rows=10 style="width:100%;" placeholder="음식은 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
		<p class="bytes" align="right">0 / 500</p>

        <div class="upload_wrap">
 		<!-- 이미지 띄울 공간 -->
			 <div>
		  		<div class="addImage" id="image-show"></div><br>
		    	<input type="file" accept="image/*" name="fileUpload" onchange="loadFile(this)">
	    	</div>
		    <div>
		  		<div class="addImage" id="image-show"></div><br>
		    	<input type="file" accept="image/*" name="fileUpload2" onchange="loadFile(this)">
	    	</div>
	    	<div>
		  		<div class="addImage" id="image-show"></div><br>
		    	<input type="file" accept="image/*" name="fileUpload3" onchange="loadFile(this)">
	    	</div>
    	</div>
	
	</section>
    	<div class="button_wrap">
			<button type="submit" class="btn btn-defualt">리뷰 작성</button>
			<button type="reset" class="btn btn-defualt">새로입력</button>
		</div>
	</form>
</body>