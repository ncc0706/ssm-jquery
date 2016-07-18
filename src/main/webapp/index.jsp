<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/plugins/datatables/dataTables.bootstrap.css"
	rel="stylesheet">

</head>
<body>

	<table class="table table-bordered table-striped mg-t datatable">
		<thead>
			<tr>
				<th>日志类型</th>
				<th>日志内容</th>
				<th>执行类</th>
				<th>操作人</th>
				<th>操作时间</th>
				<th>操作IP</th>
	</table>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/webjars/jquery/1.11.1/dist/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/plugins/datatables/dataTables.bootstrap.js"></script>

	<script type="text/javascript">
		var datatable;
		function initDatatable() {
			datatable = $('.datatable').DataTable(
					{
						"dom" : '<"toolbar">frtip',
						"searching" : false,
						"processing" : false,
						"serverSide" : true,
						"select" : true,
						"ordering" : true,
						"language" : {
							"url" : "${pageContext.request.contextPath }/assets/plugins/datatables/cn.json"
						},
						"preDrawCallback" : function() {
							//sublime.showLoadingbar($(".main-content"));
						},
						"drawCallback" : function() {
							//sublime.closeLoadingbar($(".main-content"));
						},
						"ajax" : {
							"url" : "${pageContext.request.contextPath }/assets/data/log.json",
							"type" : "post",
							"data" : function(d) {
							}
						},
						"order" : [ [ 4, "desc" ] ],
						"columns" : [ {
							"data" : "tag",
							"bSortable" : true
						}, {
							"data" : "msg",
							"bSortable" : false
						}, {
							"data" : "src",
							"bSortable" : false
						}, {
							"data" : "nickname",
							"bSortable" : true
						}, {
							"data" : "opAt",
							"bSortable" : true
						}, {
							"data" : "ip",
							"bSortable" : true
						} ],
						"columnDefs" : [ 
						                 /* {
							"render" : function(data, type, row) {
								if (data) {
									return moment(parseInt(data * 1000))
											.format("YYYY-MM-DD HH:mm:ss");
									;
								}
							},
							"targets" : 4 } */
						]
					});
			datatable.on('click', 'tr', function() {
				$(this).toggleClass('selected');
			});
			$("#searchBtn").on('click', function() {
				datatable.ajax.reload();
			});
		}

		$(function() {
			initDatatable();
		});
	</script>


</body>
</html>
