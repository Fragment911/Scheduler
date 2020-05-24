<%@ include file="/webresources/header.jspf"%>
    <h1>Update schedule name</h1>
    <form role="form" action="${contextPath}/schedule/update" method="POST">
        <div class="form-group" style="display: none">
            <label for="id">Id</label>
            <input class="form-control" type="number" name="id" readonly value="${schedule.id}" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="text">Name</label>
            <input class="form-control" type="text" name="name" value="${schedule.name}" autocomplete="off" />
        </div>
        <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
        <a href="${pageContext.request.contextPath}/schedule/${schedule.id}" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
    </form>
<%@ include file="/webresources/footer.jspf"%>
