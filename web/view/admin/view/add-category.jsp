<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:url value="/view/admin/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Category </title>
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<link href="${url}/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/view/admin/view/nav-bar.jsp"></jsp:include>
		<jsp:include page="/view/admin/view/slide-bar.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>ADD CATEGORY</h2>
                                              
					</div>
				</div>
			
				<hr />
				<div class="row">
					<div class="col-md-12">
					
						<div class="panel panel-default">
							<div class="panel-heading">Add Category</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Category</h3>
										
										<form  action="add"  method="post" >
							
											Name: <input type="text" class="form-control" placeholder="Enter name of category" name="name" />
										
											
											<button type="submit" class="btn btn-default">Add</button>
											<button type="reset" class="btn btn-primary">Reset</button>
										</form>


									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>

</body>
</html>