<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<%
String a=request.getParameter("aNum");
String b=request.getParameter("ema");
String c=request.getParameter("ema2");
%>

<script type="text/javascript">

function readURL(input) {
    if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
        }
       reader.readAsDataURL(input.files[0]);
    }
   
}

	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	
	function mail(){
	
		alert("인증번호를 보냅니다");
		var em=document.getElementById("email").value;
		var em2=document.getElementById("email2");
		var em3=em2.options[em2.selectedIndex].value;
		var email1=em+em3;
		alert(email1);

		var f=document.createElement("form");
		f.setAttribute("method","get");
		f.setAttribute("action","${contextPath}/mail/mailSending.do");
		document.body.appendChild(f);
		
		var inp=document.createElement("input");
		
		inp.setAttribute("type","text");
		inp.setAttribute("name","email");
		inp.setAttribute("value",em);
		f.appendChild(inp);
		
var inp2=document.createElement("input");
		
		inp2.setAttribute("type","text");
		inp2.setAttribute("name","email2");
		inp2.setAttribute("value",em3);
		f.appendChild(inp2);

		f.submit();	
		/* location.href="${contextPath}/mail/mailSending.do"; */
	}
</script>
<title>회원 가입</title>
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">사업자 등록</h1>
		</div>
	</div>
	
	
	<div class="container">
	<form name="comMember" class="form-horizontal"  action="${contextPath}/Company/comAdd.do" method="post" >
	
    <!-- 이미지첨부 -->
    	     <div class="form-group row">
    	     <div class="col-sm-3">
    	      <img  id="preview" src="#"   width=100 height=100/>
			   </div>
			     <input type="file" name="imageFile"  onchange="readURL(this);" />
			   </div>
    

            <div class="form-group row">
    		<label class="col-sm-2">우편번호</label>
    		<div class="col-sm-3">
    			<input type="text" name="zipCode" class="from-control" id="postcode">
    			</div>
    			<div>
    			<input type="button" class="btn btn-info" onclick="execDaumPostcode()" value="우편번호찾기">
    		</div>
           </div>
           
           
        <div class="form-group row">
    		<label class="col-sm-2">주소</label>
    		<div class="col-sm-3">
    				<input type="text" name="address" class="from-control" id="address">
    				<input type="hidden" id="detailAddress" placeholder="상세주소">
					<input type="hidden" id="extraAddress" placeholder="참고항목">
    		</div>
       </div>
			
			<div class="form-group  row">
				<label class="col-sm-2">대표자 성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">대표번호</label>
			
				<div class="col-sm-2">
				<select name="phone1" id="phone1">
					    <option >직접입력</option>
						<option value="02">02</option>
						<option value="010">010</option>
						<option value="031">031</option>
						<option value="032">032</option>
					</select>
					-
				</div>
				
				<div class="col-sm-2">
					<input name="phone2" type="text" class="form-control"  >
					</div>
					-
					<div class="col-sm-2">
					<input name="phone3" type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-offset-4">
					<input type="text" name="email" maxlength="50" placeholder="email" id="email" value="<%=b%>"> 
					<select name="email2" id="email2" >
					    <option value="<%=c%>"><%=c%></option>
					    <option >이메일선택</option>
						<option value="@naver.com">@naver.com</option>
						<option value="@daum.net">@daum.net</option>
						<option value="@gmail.com">@gmail.com</option>
						<option value="@nate.com">@nate.com</option>
					</select>
					   <input id="auth" type="button" onclick="mail()" class="btn btn-info" value="인증">
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
				<label class="col-sm-2">고유번호</label>
				<div class="col-sm-3">
					<input name="authNum" type="text" class="form-control" value="<%=a%>" placeholder="authNum">
					<small class="text-warning">고유번호가 있어야 로그인이 가능합니다.</small>
				</div>
			</div>
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
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