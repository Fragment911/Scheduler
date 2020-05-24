<%@ include file="/webresources/header.jspf"%>
    <h1>Create account</h1>
    <form role="form" action="${contextPath}/account/create" method="POST">
        <div class="form-group">
            <label for="login">Login</label>
            <input class="form-control" type="text" name="login" path="login" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input class="form-control" type="text" name="password" path="password" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="role">Example select</label>
            <select path="role" name="role" class="form-control" id="role">
                <c:forEach var = "role" items="${roleList}">
                    <option>${role.name()}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
        <a href="${pageContext.request.contextPath}/account" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
    </form>
<%@ include file="/webresources/footer.jspf"%>