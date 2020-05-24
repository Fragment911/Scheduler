<%@ include file="/webresources/header.jspf"%>
    <h1><a href="${pageContext.request.contextPath}/schedule/update/${schedule.id}">${schedule.name}<i class="fa fa-pencil-square fa-fw"></i></a></h1>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Text</th>
            <th width="200">Status</th>
            <th width="140"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var = "task" items="${taskList}">
            <tr>
                <td>${task.name}</td>
                <td>${task.text}</td>
                <td>${task.status}</td>
                <c:if test="${role.contains('ADMIN') || role.contains('USER')}">
                    <td>
                        <c:if test="${task.status.equals('IN_PROCESS')}">
                            <a href="${pageContext.request.contextPath}/task/done/${task.id}" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Done"><i class="fa fa-check fa-fw"></i></a>
                        </c:if>
                        <c:if test="${task.status.equals('DONE')}">
                            <a href="${pageContext.request.contextPath}/task/inprocess/${task.id}" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" title="In process"><i class="fa fa-reply fa-fw"></i></a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/task/update/${task.id}" class="btn btn-warning btn-sm" title="Update"><i class="fa fa-pencil-square fa-fw"></i></a>
                        <a data-toggle="modal" data-target="#confirm_delete_${task.id}" href="#" class="btn btn-danger btn-sm" title="Delete"><i class="fa fa-trash fa-fw"></i></a>
                        <div class="modal fade" id="confirm_delete_${task.id}" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure to delete task?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="${pageContext.request.contextPath}/task/remove/${task.id}" method="DELETE">
                                            <a href="#" class="btn" data-dismiss="modal">Cancel</a><button type="submit" class="btn btn-primary">Confirm</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/task/create/${schedule.id}" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add</a>
    <a href="${pageContext.request.contextPath}/schedule" class="btn btn-default"><i class="fa fa-reply fa-fw"></i>Back</a>
<%@ include file="/webresources/footer.jspf"%>
