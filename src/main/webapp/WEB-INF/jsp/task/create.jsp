<%@ include file="/webresources/header.jspf"%>
    <h1>Create task</h1>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <form role="form" action="${contextPath}/task/create" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" type="text" name="name" path="name" autocomplete="off" />
                    </div>
                    <div class="form-group">
                        <label for="text">Text</label>
                        <input class="form-control" type="text" name="text" path="text" autocomplete="off" />
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="schedule">Schedule</label>
                        <input class="form-control" type="text" name="schedule" path="schedule" value="${schedule_id}" autocomplete="off" />
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                    <a href="${pageContext.request.contextPath}/schedule/${id}" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
                </form>
            </div>
        </div>
    </div>
<%@ include file="/webresources/footer.jspf"%>
