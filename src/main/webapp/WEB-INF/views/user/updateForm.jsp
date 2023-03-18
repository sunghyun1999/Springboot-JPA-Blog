<%--
  Created by IntelliJ IDEA.
  User: gus70
  Date: 2023-03-09
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../layout/header.jsp" %>

<div class="container">
    <form>
        <input type="hidden" id="id" value="${principal.user.id}">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter username" id="username" readonly>
        </div>

        <c:if test="${empty principal.user.oauth}">
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" placeholder="Enter password" id="password">
            </div>
        </c:if>

        <c:choose>
            <c:when test="${empty principal.user.oauth}">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email" id="email">
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email" readonly>
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <button id="btn-update" class="btn btn-primary">회원수정완료</button>
</div>

<script src="/js/user.js"></script>
<%@include file="../layout/footer.jsp" %>
