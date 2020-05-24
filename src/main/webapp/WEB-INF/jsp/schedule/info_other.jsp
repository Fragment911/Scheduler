<%@ include file="/webresources/header.jspf"%>
    <h1>${schedule.name}</h1>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Text</th>
            <th width="200">Status</th>
            <th width="50"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var = "task" items="${taskList}">
            <tr>
                <td>${task.name}</td>
                <td>${task.text}</td>
                <td>${task.status}</td>
                <td><a href="${pageContext.request.contextPath}/task/${task.id}" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Info"><i class="fa fa-info-circle fa-fw"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/schedule" class="btn btn-default"><i class="fa fa-reply fa-fw"></i>Back</a>
<%@ include file="/webresources/footer.jspf"%>
