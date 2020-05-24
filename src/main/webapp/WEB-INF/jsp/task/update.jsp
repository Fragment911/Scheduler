<%@ include file="/webresources/header.jspf"%>
    <h1>Update task</h1>
    <form role="form" action="${contextPath}/task/update" method="POST">
        <div class="form-group" style="display: none">
            <label for="id">Id</label>
            <input class="form-control" type="number" name="id" readonly value="${task.id}" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" type="text" name="name" value="${task.name}" autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="text">Text</label>
            <input class="form-control" type="text" name="text" value="${task.text}" autocomplete="off" />
        </div>
        <div class="form-group" style="display: none">
            <label for="status">Status</label>
            <input class="form-control" type="text" name="status" readonly value="${task.status}" autocomplete="off" />
        </div>
        <div class="form-group" style="display: none">
            <label for="schedule">Schedule</label>
            <input class="form-control" id="schedule" path="schedule" type="text" name="schedule" readonly value="${task.schedule.id}" autocomplete="off" />
        </div>
        <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
        <a href="${pageContext.request.contextPath}/schedule/${task.schedule.id}" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
    </form>
<%@ include file="/webresources/footer.jspf"%>
