<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
	<div class='uploadDiv'>
		<input type="file" name="uploadFile" multiple>	
	</div>	
	<button id='uploadBtn'>UploadFile</button>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		let maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		$('#uploadBtn').on("click", function(e){
		 
		   let formData = new FormData();
		   let inputFile = $("input[name='uploadFile']");
		   let files = inputFile[0].files;
				
				 console.log(files);
				 
				//add filedate to formdata
				 for(var i = 0; i < files.length; i++){
					 if (!checkExtension(files[i].name, files[i].size)) {
							return false;
						}
				   formData.append("uploadFile", files[i]);
				
				 }

				
				 $.ajax({
				 	url: '/uploadAjaxAction',
				 	processData: false,
					 contentType: false,
					 data: formData,
				 	 type: 'POST',
				 	 success: function(result){
					 alert("Uploaded");
				 }
			 }); //$.ajax
		});
	});
	</script>
</body>
</html>