<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
    <head>
        <title>Добавить пользователя</title>
    </head>
    <body>
    <br/>
    <br/>
        <c:if test="${user.id > 0}" >
            <h1>Редактировать пользователя - ${user.name}</h1>
        </c:if>
        <c:if test="${user.id == 0}" >
            <h1>Добавить позьзователя:</h1>
        </c:if>
    <c:url var="addAction" value="/useredit/add"/>

    <form:form action="${addAction}" commandName="user">
        <table width="100%" border="0" class="forms">
            <c:if test="${user.id > 0}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Имя:"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name" />
                    <form:errors cssClass="formError" path="name"/>

                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Возраст:"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age" />
                    <form:errors path="age" cssClass="formError" />
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="admin">
                        <spring:message text="Админ"/>
                    </form:label>
                </td>
                <td>
                    <form:radiobutton path="admin"  value="0" />Нет
                    <form:radiobutton path="admin" value="1" />Да
                </td>
            </tr>
            <tr>
                <td colspan="2">
                        <input class="send_button" type="submit" value="<spring:message text="Добавить"/>"/>
                </td>
            </tr>
        </table>
    </form:form>
        </div>
    </body>
</html>
