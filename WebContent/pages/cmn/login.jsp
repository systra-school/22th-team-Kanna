<!-- login.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
	<html:javascript formName="loginForm" />
	<title>ログイン画面Login</title>
	<link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/kikin/pages/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0;">
	<div id="wrapper">
        <div id="header" style="height: 100px; line-height: 100px; font-size: 24px; text-align:center; background-color: #ccc;">
        	ログイン
        	<!-- <img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud1.png" alt="cloud" style="widht: 80px; height: 200px; opacity: 0.7; position: absolute; top: -50px; left: -150px;">
        	<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud2.png" alt="cloud" style="widht: 80px; height: 150px; opacity: 0.7; position: absolute; top: 25px; left: 100px;">
        	<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud1.png" alt="cloud" style="widht: 80px; height: 200px; opacity: 0.7; position: absolute; top: -50px; left: 300px;">
        	<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud2.png" alt="cloud" style="widht: 80px; height: 150px; opacity: 0.7; position: absolute; top: 25px; left: 500px;">
        	 -->
        </div>
        
        <div class="animation-area">
  			<img id="dragon" src="http://localhost:8080/kikin/pages/cmn/img/dragon-54.gif" alt="dragon" width="800px" height="400px" style="position: absolute; top: 150px; left: -800px; z-index: 10;">
			
			<audio loop id="btn_audio">
				<source src="audio/dragon_fly1.mp3" type="audio/mp3">
			</audio>
			<div class="rains">
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			</div>
		</div>
		
		<div id="gymBody" class="rain" style="display: flex; justify-content: center; align-items: center; overflow: hidden; background-color: #fff;"> 
		  <div align="center">
		    <div style="position: relative; z-index: 20;">ID・パスワードを入力してください。</div>
		    <html:form action="/login" onsubmit="return validateLoginForm(this)">
		      <html:text property="shainId" size="16" value="sh0001" style="width: 250px; height: 35px; margin-top: 30px; border-radius: 5px; position: relative; z-index: 20;"/>
		      <br/>
		      <html:password property="password" size="16" redisplay="false" value="sh0001" style="width: 250px; height: 35px; margin-top: 30px; border-radius: 5px; position: relative; z-index: 20;"/>
		      <br/>
		      <%-- エラーメッセージを表示 --%>
		      ${error}
		      <br/>
		      <div style="width: 250px; padding-top: 20px;">
			      <html:submit onclick="audio()" styleId="start" property="submit" value="送信" style="width: 70px; height: 35px; border-radius: 5px; position: relative; z-index: 20;" />
			      <html:reset value="リセット" style="width: 70px; height: 35px; border-radius: 5px; position: relative; z-index: 20;" />
		      </div>
		    </html:form>
		    <%--
		    不要なテキストを非表示にしました。（2024/02/22　太田）
		    sh0001<BR>
		    sh0002<BR>
		    sh0003<BR>
		    sh0004<BR>
		    sh0005<BR>
		     --%>
		  </div>
		</div>
	    <div id="footer" style="background-color: #fff;">
	        <table>
	          <tr>
	              <td id="footLeft">
	                　
	              </td>
	              <td id="footCenter">
	                　
	              </td>
	              <td id="footRight">
	                　
	              </td>
	          </tr>
	        </table>
	    </div>

	</div>
		
		<script>
			// --ドラゴンを動かす処理-- //
			const start = document.getElementById('start'); // 開始ボタン
			const image = document.getElementById('dragon'); // ロゴ画像
	
			// スタートボタンをクリックしたら
			start.addEventListener('click', () => {
			  // 画像を左端から200px右に動かす
			  image.animate(
			    // 途中の状態を表す配列
			    [
			      { transform: 'translateX(0)'}, // 開始時の状態（左端）
			      { transform: 'translateX(2000px)' } // 終了時の状態（左端から200pxの位置）
			    ], 
			    // タイミングに関する設定
			    {
			      fill: 'backwards', // 再生前後の状態（再生前、開始時の状態を適用）
			      duration: 2000, // 再生時間（1000ミリ秒）
			    },
			  );
			});
			
			
			// --音声再生-- //
			function audio(){
				document.getElementById('btn_audio').play();
			}
			
			
			// --雷の
			window.onload = function(){
			    document.getElementById('wrap').classList.add('is-show');
			}
			/*
			// --雲を表示、動かす処理-- //
			const image2 = document.getElementById('cloud1'); // 雲画像
			
			image2.animate(
			    // 途中の状態を表す配列
			    [
			      { transform: 'translateX(0)'}, // 開始時の状態（左端）
			      { transform: 'translateX(2000px)' } // 終了時の状態（左端から200pxの位置）
			    ], 
			    // タイミングに関する設定
			    {
			      fill: 'backwards', // 再生前後の状態（再生前、開始時の状態を適用）
			      duration: 200000, // 再生時間（1000ミリ秒）
			    },
			);
			*/
			
		</script>
	
</body>
</html>