<%@ include file="/webresources/header.jspf"%>
<h1>Create schedule</h1>
<div class="panel-body">
    <div class="row">
        <div class="col-lg-12">
            <form role="form" action="${contextPath}/schedule/create" method="POST">
                <div class="form-group">
                    <label for="text">Name</label>
                    <input class="form-control" type="text" name="name" path="name" autocomplete="off" />
                </div>
                <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                <a href="${pageContext.request.contextPath}/schedule" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Cancel</a>
            </form>
        </div>
    </div>
</div>
<%@ include file="/webresources/footer.jspf"%>
