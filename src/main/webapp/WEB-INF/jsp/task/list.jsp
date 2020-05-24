<%@ include file="/webresources/header.jspf"%>
    <h1>Task list</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Text</th>
<%--                <c:if test="${role.contains('ADMIN') || role.contains('MODER')}">--%>
                    <th width="140"></th>
<%--                </c:if>--%>
<%--                <c:if test="${role.contains('DRIVER') || role.contains('PASSENGER')}">--%>
                    <th width="50"></th>
<%--                </c:if>--%>
            </tr>
        </thead>
        <tbody>
            <c:forEach var = "task" items="${taskList}">
                <tr>
                    <td>${task.name}</td>
                    <td>${task.text}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/task/${task.id}" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Tooltip on top"><i class="fa fa-info-circle fa-fw"></i></a>
                        <a href="${pageContext.request.contextPath}/task/update/${task.id}" class="btn btn-warning btn-sm"><i class="fa fa-pencil-square fa-fw"></i></a>
                        <a data-toggle="modal" data-target="#confirm_delete_${task.id}" href="#" class="btn btn-danger btn-sm"><i class="fa fa-trash fa-fw"></i></a>
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
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/task/create" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add</a>
<%@ include file="/webresources/footer.jspf"%>
