<%@ include file="/webresources/header.jspf"%>
    <h1>Update account</h1>
    <form role="form" action="${contextPath}/account/update" method="POST">
        <div class="form-group"<%-- style="display: none"--%>>
            <label for="id">Id</label>
            <input class="form-control" type="number" name="id" readonly value="${account.id}" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="login">Login</label>
            <input class="form-control" type="text" name="login" value="${account.login}" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input class="form-control" type="text" name="password" autocomplete="off" />
        </div>
        <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
        <a href="${pageContext.request.contextPath}/schedule" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
    </form>
<%@ include file="/webresources/footer.jspf"%>