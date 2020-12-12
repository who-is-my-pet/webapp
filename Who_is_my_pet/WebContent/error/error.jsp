<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나와 닮은 동물상 찾기</title>
</head>
<body>
<p>처리과정에서 오류가 발생했습니다.</p>
Error Type: <%= exception.getClass().getName() %>
Error Message: <%= exception.getMessage() %>
</body>
</html>