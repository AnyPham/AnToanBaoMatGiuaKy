<%@ page import="model.Log" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Log log = (Log) request.getSession().getAttribute("log");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <%@ include file="./common.jsp" %>
    <link href="./css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./css/dangKi.css">
</head>
<body>
<%@ include file="headerAdmin.jsp" %>
<div class="container-fluid">
    <div class="row">
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="container_form">
                <form class="form-container" action="pageAdmin_Log.jsp">

                    <h3 class="text-center text-success">Chi tiết Log #<%=log.getId()%>
                    </h3>

                    <table class="table">
                        <tr>
                            <td>Level</td>
                            <td><c:if test="${log.level eq 'infor'}">
                                <div class="badge text-bg-success text-wrap" style="width: 6rem;">
                                    Infor
                                </div>
                            </c:if>
                                <c:if test="${log.level eq 'warning'}">
                                    <div class="badge text-bg-warning text-wrap" style="width: 6rem;">
                                        Warning
                                    </div>
                                </c:if>
                                <c:if test="${log.level eq 'danger'}">
                                    <div class="badge text-bg-danger text-wrap" style="width: 6rem;">
                                        Danger
                                    </div>
                                </c:if></td>

                        </tr>

                        <tr>
                            <td>#ID</td>
                            <td><%=log.getId()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Action</td>
                            <td><%=log.getAction()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Table</td>
                            <td><%=log.getTable()%>
                            </td>
                        </tr>
                        <tr>
                            <td>UserId</td>
                            <td><%=log.getUser_id()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Thời gian</td>
                            <td>
                                <fmt:formatDate value="<%=log.getTime()%>" pattern="dd/MM/yyyy hh:MM:ss"/>
                        </tr>

                    </table>
                    <div class="mb-3">
                        <label for="before" class="form-label">Before Data </label>
                        <textarea type="text" class="form-control" id="before"
                                  placeholder="" rows="5"
                                  cols="50" readonly> <%=log.getBeforeData()%> </textarea>

                    </div>
                    <div class="mb-3">
                        <label for="after" class="form-label"> After Data </label>
                        <textarea type="text" class="form-control" id="after"
                                  placeholder="" rows="5"
                                  cols="50" readonly> <%=log.getAfterData()%> </textarea>

                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary width-btn">Quay về quản lý log</button>
                    </div>

                </form>
            </div>
        </main>
    </div>
</div>

</body>
</html>