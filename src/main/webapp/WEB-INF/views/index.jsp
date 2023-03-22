<%--
  Created by IntelliJ IDEA.
  User: gus70
  Date: 2023-03-09
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="layout/header.jsp" %>

<c:forEach var="board" items="${boards.content}">
    <div class="container">
        <div class="card m-2">
            <div class="card-body">
                <h4 class="card-title">${board.title}</h4>
                <a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
            </div>
        </div>
    </div>
</c:forEach>

<ul class="pagination justify-content-center">
    <c:choose>
        <c:when test="${boards.first}">
            <li class="page-item disabled"><a class="page-link" href="?page=${boards.number - 1}">Previous</a></li>
        </c:when>
        <c:otherwise>
            <li class="page-item"><a class="page-link" href="?page=${boards.number - 1}">Previous</a></li>
        </c:otherwise>
    </c:choose>

    <c:forEach var="currentPage" begin="${minPage}" end="${maxPage}">
        <c:choose>
            <c:when test="${currentPage - 1 == boards.number}">
                <li class="page-item active"><a class="page-link" href="?page=${currentPage-1}">${currentPage}</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${currentPage-1}">${currentPage}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${boards.last}">
            <li class="page-item disabled"><a class="page-link" href="?page=${boards.number + 1}">Next</a></li>
        </c:when>
        <c:otherwise>
            <li class="page-item"><a class="page-link" href="?page=${boards.number + 1}">Next</a></li>
        </c:otherwise>
    </c:choose>
</ul>

<%@include file="layout/footer.jsp" %>
