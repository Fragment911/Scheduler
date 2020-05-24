<%@ include file="/webresources/header.jspf"%>
    <h1>Accounts</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Login</th>
                <th width="300">Role</th>
                <th width="100"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var = "account" items="${accountList}">
                <tr>
                    <td>${account.login}</td>
                    <td>${account.role}</td>
                    <td>
                        <c:if test="${account.role.equals('ROLE_USER')}">
                            <a href="${pageContext.request.contextPath}/account/moder/${account.id}" class="btn btn-info btn-sm" title="Make moder"><i class="fa fa-arrow-up"></i></a>
                        </c:if>
                        <c:if test="${account.role.equals('ROLE_MODER')}">
                            <a href="${pageContext.request.contextPath}/account/user/${account.id}" class="btn btn-info btn-sm" title="Make user"><i class="fa fa-arrow-down"></i></a>
                        </c:if>
                        <a data-toggle="modal" data-target="#confirm_delete_${account.id}" href="#" class="btn btn-danger btn-sm" title="Delete"><i class="fa fa-trash fa-fw"></i></a>
                        <div class="modal fade" id="confirm_delete_${account.id}" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure to delete account?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="${pageContext.request.contextPath}/account/remove/${account.id}" method="DELETE">
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
<%@ include file="/webresources/footer.jspf"%>
