<%@ include file="/webresources/header.jspf"%>
    <h1>Task</h1>
    <table class="table table-striped">
        <tbody>
            <tr>
                <td>Name</td>
                <td>${task.name}</td>
            </tr>
            <tr>
                <td>Text</td>
                <td>${task.text}</td>
            </tr>
            <tr>
                <td>Status</td>
                <td>${task.status}</td>
            </tr>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/schedule/other/${task.schedule.id}" class="btn btn-default"><i class="fa fa-reply fa-fw"></i>Back</a>
<%@ include file="/webresources/footer.jspf"%>
