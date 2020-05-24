<%@ include file="/webresources/header.jspf"%>
    <h1>My schedules</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th width="100"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var = "schedule" items="${scheduleList}">
                <tr>
                    <td>${schedule.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/schedule/${schedule.id}" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Info"><i class="fa fa-info-circle fa-fw"></i></a>
                        <a data-toggle="modal" data-target="#confirm_delete_${schedule.id}" href="#" class="btn btn-danger btn-sm" title="Delete"><i class="fa fa-trash fa-fw"></i></a>
                        <div class="modal fade" id="confirm_delete_${schedule.id}" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure to delete schedule?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="${pageContext.request.contextPath}/schedule/remove/${schedule.id}" method="DELETE">
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
    <a href="${pageContext.request.contextPath}/schedule/create" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add</a>

    <c:if test="${role.contains('ADMIN') || role.contains('MODER')}">
        <h1>All schedules</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Account</th>
                <th width="50"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var = "schedule" items="${scheduleListAll}">
                <tr>
                    <td>${schedule.name}</td>
                    <td>${schedule.account.login}</td>
                    <td><a href="${pageContext.request.contextPath}/schedule/other/${schedule.id}" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Info"><i class="fa fa-info-circle fa-fw"></i></a></td>
<%--                    <td>--%>
<%--                        <a href="${pageContext.request.contextPath}/schedule/${schedule.id}" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Done"><i class="fa fa-info-circle fa-fw"></i></a>--%>
<%--                        <a data-toggle="modal" data-target="#confirm_delete_${schedule.id}" href="#" class="btn btn-danger btn-sm"><i class="fa fa-trash fa-fw"></i></a>--%>
<%--                        <div class="modal fade" id="confirm_delete_${schedule.id}" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--                            <div class="modal-dialog">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
<%--                                        <h4 class="modal-title">Confirmation</h4>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        <p>Are you sure to delete schedule?</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <form action="${pageContext.request.contextPath}/schedule/remove/${schedule.id}" method="DELETE">--%>
<%--                                            <a href="#" class="btn" data-dismiss="modal">Cancel</a><button type="submit" class="btn btn-primary">Confirm</button>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
<%@ include file="/webresources/footer.jspf"%>
