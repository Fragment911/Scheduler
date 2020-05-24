<%@ include file="/webresources/header.jspf"%>
    <h1>Account</h1>
    <table class="table table-striped">
        <tbody>
            <tr>
                <td>Id</td>
                <td>${account.id}</td>
            </tr>
            <tr>
                <td>Login</td>
                <td>${account.login}</td>
            </tr>
            <tr>
                <td>Password</td>
                <td>${account.password}</td>
            </tr>
            <tr>
                <td>Role</td>
                <td>${account.role}</td>
            </tr>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/account/update/${account.id}" class="btn btn-warning"><i class="fa fa-pencil-square fa-fw"></i>Update</a>
    <a href="${pageContext.request.contextPath}/account" class="btn btn-default"><i class="fa fa-reply fa-fw"></i>Back</a>
<%@ include file="/webresources/footer.jspf"%>
