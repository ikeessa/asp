<!--#include virtual="/common/const.do"-->
<%
	'Call LoginChk("page")
	menucode = "Z0000"
	Call PageLog(menucode)
%>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<%=Html_meta%>
		<title><%=SiteTitle%></title>
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/font-awesome.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-skins.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/style.css">

		<!--#include virtual="/common/inc/inc_pageIcon.do"-->
		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">


	</head>
	<style>
	#main {
    margin-left: 0px;
	
	}
	#val_tbl span {
	margin-right: 5px;
	margin-bottom: 5px;
	}
	</style>
	
	<body>

		

		<div id="main" role="main">

				<ol class="breadcrumb">
				</ol>

			<div id="content">

					<!-- row -->
					<div class="row">
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-blue" id="wid-id-1" data-widget-editbutton="false" role="widget" style="position: relative; opacity: 1; left: 0px; top: 0px;">
								<header role="heading"><div class="jarviswidget-ctrls" role="menu"></div>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>DB INSERT</h2>
								<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span></header>
								<!-- widget div-->
								<div role="content">
									<form class="form-horizontal" name="mstfrm" id="mstfrm" action="insert_proc.do" method="post" target="hiddenifm" novalidate="novalidate">
											<input type="hidden" name="wtype" id="wtype" value="insert">
										<div class="form-group row ">
											<label class="col-sm-1 control-label">
										Report or Protocol</label> 
											<div class="col-sm-11 has-feedback inCell_11"> 
													<select class="form-control form-control-sm" name="rp" id="rp">
														<option value="Report" selected>Report</option>
														<option value="Protocol">Protocol</option>
													</select>
											</div>
										</div>
										<div class="form-group row ">
											<label class="col-sm-1 control-label">
										Remark</label> 
											<div class="col-sm-11 has-feedback inCell_9"> 
													<textarea rows="5" cols="5" class="form-control" placeholder="" name="prodesc"></textarea>
											</div>
										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<span class="btn btn-primary">
														<i class="fa fa-save"></i>
														Submit
													</span>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</article>
					</div>
					<!-- end row -->
				<!-- end widget grid -->
			</div>
		<!-- Footer include  생략함 -->
		<!--#include virtual="/common/inc/inc_defaultJs.do"-->
		<script type="text/javascript">
		</script>
	</body>
</html>
<script>
	//$('#clickme').click(function() { $('#book').toggle('slow', function() { // Animation complete. }); });




	function timesheetbtn() {
		window.open("http://duqm_mysql.erns.co.kr/member/timesheet/timesheet_input.do", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=1000,width=1500,height=1000");
	}
	function timesheetviewbtn(){
		window.open("http://duqm_mysql.erns.co.kr/member/timesheet/timesheet_view.do", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=1000,height=800");
	}

	$(document).ready(function() {
		pageSetUp();
		runAllForms();
		LoadCode();
	
		//LoadMenu();
		
	});
	//메뉴 호출,url 경로 설정 할 것
	/*
	function LoadMenu(){
		$.ajax({
			  type: 'post'
			, async: false
			, url: '/common/inc/inc_pageLeft_proc.do'
			, data: {}
			, dataType: "text"
			, success: function (result) {
				console.log("ajax 연결 성공");
				console.log("result : " + result);
				$("nav").html(result);
			  }
		});
	}
	*/

	/* 트리 스크립트	
	$(document).ready(function() {
			
			// PAGE RELATED SCRIPTS
			$('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
			
		
		});

	$('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse  this branch').on('click', function(e) {
		var children = $(this).parent('li.parent_li').find(' > ul > li');
		if (children.is(':visible')) {
			children.hide('fast');
			$(this).attr('title', 'Expand this branch').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
		} else {
			children.show('fast');
			$(this).attr('title', 'Collapse this branch').find(' > i').removeClass().addClass('fa fa-lg fa-minus-circle');
		}
		e.stopPropagation();
	});
	*/
	</script>
	
	<script>
	$(document).on("click","span",function(){
		
		var textarea = $('textarea').val()
		var rp = $(":selected").val();
		$.ajax({
				  type: 'post'
				, async: false
				, url: 'insert_proc.do'
				, data: {"textarea" : textarea
						,"wtype":"insert" 
						,"rp":rp
				} 
				, dataType: "text"
				, success: function (result) {
					$('div:last()').after(result)


					
				}
			});
	
	});

	
	
</script>
<%
Dbcon.close
set Dbcon = nothing
%>