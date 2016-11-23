<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Пользователи</title>
    </head>
    <body>
        <h1>Список пользователей</h1>
        <a class="add" href="<c:url value="/useradd" />">Добавить пользователя</a>
        <table >
            <tr class="table_title">
                <th width="100">Id</th>
                <th width="150">Имя</th>
                <th width="150">Возраст</th>
                <th width="100">Админ</th>
                <th width="200">Дата добавления</th>
                <th width="150"></th>
            </tr>
            <c:if test="${!empty allUsers}">
                <c:forEach items="${allUsers.pageList}" var="user">
                    <tr >
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                        <td>${user.formatedAdmin}</td>
                        <td>${user.formatedDate}</td>
                        <td>
                            <a href="<c:url value='/useredit/${user.id}'/>">Редактировать</a><br>
                            <a href="<c:url value='/delete/${user.id}'/>">Удалить</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <c:if test="${allUsers.pageCount > 1}" >
            <div class="pagenator">
                <ul>
                    <c:forEach begin="1" end="${allUsers.pageCount}" step="1" varStatus="i">
                        <c:url value="/" var="url">
                            <c:param name="page" value="${i.index-1}"/>
                        </c:url>

                        <li>
                            <a href='<c:out value="${url}" />'>${i.index}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </body>
</html>