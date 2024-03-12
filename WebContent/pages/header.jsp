<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<html>
<head>
	<title><%= pageTitle %></title>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="/kikin/pages/js/common.js"></script>
	<script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
	<script type="text/javascript" src="/kikin/pages/js/message.js"></script>
	<script type="text/javascript" src="/kikin/pages/js/table.js"></script>
	<link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/kikin/pages/css/sanitize.css" rel="stylesheet" type="text/css" />
	<link href="/kikin/pages/css/<%= pageName %>.css" rel="stylesheet" type="text/css" />
	<style>
		body {
			overflow: auto;
		}
		.body {
			background-color: #66CCFF;
		}
		
		/* header */
		.header {
			position: relative;
			width: 96%;
			height: 28px;
			margin: 40px auto 50px;
		}
		.header .title {
			font-size: 24px;
		    color: #FFFF00;
		    text-align: center;
		}
		.header_left,
		.header_right {
			position: absolute;
			top: 50%;
			transform: translateY(-100%);
		}
		.header_left {
			left: 0;
		}
		.header_right {
			right: 0;
		}
		
		/* footer */
		.footer {
			width: 96%;
			margin: 60px auto 40px;
		}
		.footer_btn {}
		.footer_btn__left {
			left: 0;
		}
		.footer_btn__right {
			right: 0;
		}
		.copy {
		    color: #fff;
		    font-size: 11px;
			text-align: center;
		}
		
		
		/* main */
		.formStyle {
			width: 90%;
			margin: 20px auto;
		}
		
		.paging {
			margin-bottom: 6px;
		}
		.paging select {
			padding: 0 8px 0 3px;
		}
		.paging_pre_next {
			display: inline-block;
			margin-left: 12px;
		}
		.paging_pre_next .pre {}
		.paging_pre_next .nwxt {}
		.paging_num {
			display: inline-block;
			margin-left: 8px;
		}
	</style>
</head>

<body class="body">
	<div id="wrapper">
		<header class="header">
			<div class="header_left">
				<input value="戻る" type="button" class="smlButton"  onclick="doSubmit('/kikin/tsukibetsuShiftKakuninBack.do')" />
		</div>
		<h1 class="title"><%= pageTitle %></h1>
		<div class="header_right">
			<input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
			</div>
		</header><%-- header --%>
