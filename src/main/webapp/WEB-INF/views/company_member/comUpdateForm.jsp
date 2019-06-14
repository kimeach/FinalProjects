<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원 정보 수정창</title>



<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body style="font-family: jejugothic ">

<div class="jumbotron">
		<div class="container">
			<h1>사업자 정보수정</h1>
		</div>
	</div>
	<div class="container">
		<form name="comVO" class="form-horizontal"
			action="${contextPath}/Company/comFix.do" method="post"
			onsubmit="return checkForm()">
		
			
			<div class="form-group  row">
				<label class="col-sm-2">등록번호</label>
				<div class="col-sm-3">
					<input name="authNum" type="text" class="form-control"  value="${comVO.authNum}" readonly="readonly">
				</div>
			</div>
			
			
			
			<div class="form-group  row">
				<label class="col-sm-2 ">휴대폰</label>
				<div class="col-sm-2">
					<select name="phone1" id="phone1" >
					    <option selected="selected">${comVO.phone1}</option>
						<option value="02">02</option>
						<option value="010">010</option>
						<option value="031">031</option>
						<option value="032">032</option>
					</select>
					<%-- <input name="phone2" type="text" class="form-control"  value="${comVO.phone1}"> --%>
					</div>
					-
					<div class="col-sm-2">
					<input name="phone2" type="text" class="form-control"  value="${comVO.phone2}">
					</div>
					-
					<div class="col-sm-2">
					<input name="phone3" type="text" class="form-control"  value="${comVO.phone3}">
				</div>
			</div>

	        <div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"  value="${comVO.name}" >
				</div>
			</div>

			
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-offset-3">
					<input type="text" name="email" maxlength="50" value="${comVO.email}">
					<select name="email2" id="email2">
					    <option>${comVO.email2}</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>


			    <div class="form-group row">
    		<label class="col-sm-2">우편번호</label>
    		<div class="col-sm-3">
    			<input type="text" name="zipCode" class="from-control" id="postcode" value="${comVO.zipCode}">
    			</div>
    			<div>
    			<input type="button" class="btn btn-info" onclick="execDaumPostcode()" value="우편번호변경">
    		</div>
           </div>
           
           
        <div class="form-group row">
    		<label class="col-sm-2">주소</label>
    		<div class="col-sm-3">
    				<input type="text" name="address" class="from-control" id="address" value="${comVO.address}">
    				<input type="hidden" id="detailAddress" placeholder="상세주소">
					<input type="hidden" id="extraAddress" placeholder="참고항목">
    		</div>
       </div>
			
			
			
				<div class="form-group  row">
				<label class="col-sm-2">주요매물</label>
				<div class="col-sm-2">
					<input name="mainDeal" type="checkbox" class="form-control" value="주택/빌라" >주택/빌라
					</div>
				
				<div class="col-sm-2">
					<input name="mainDeal" type="checkbox" class="form-control" value="아파트" >아파트
					</div>
				
				<div class="col-sm-2">
					<input name="mainDeal" type="checkbox" class="form-control" value="오피스텔" >오피스텔
					</div>
				
				<div class="col-sm-2">
					<input name="mainDeal" type="checkbox" class="form-control" value="원룸" >원룸
					
				</div>
			</div>
			
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="수정하기"><input type="reset" value="다시입력">
				</div>
			</div>
		</form>	
	</div>




</body>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
     /*  oncomplete:데이타 정상처리 되었을때 callback함수 
           {
    	      oncomplete:function(){}
           }
     */
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    /* document.getElementById("extraAddress").value = extraAddr; */
                
                } else {
                   /*  document.getElementById("extraAddress").value = ''; */
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
             /*    document.getElementById("detailAddress").focus(); */
            }
        }).open();
    }
</script>
</html>