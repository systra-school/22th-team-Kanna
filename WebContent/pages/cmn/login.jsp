<!-- login.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:define id="pageTitle" value="���O�C��" type="java.lang.String"/>
<bean:define id="pageName" value="login" type="java.lang.String"/>

<%@ include file="../header.jsp" %>
<%-- �w�b�_�[�̓Ǎ� --%>
<!-- <img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud1.png" alt="cloud" style="widht: 80px; height: 200px; opacity: 0.7; position: absolute; top: -50px; left: -150px;">
<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud2.png" alt="cloud" style="widht: 80px; height: 150px; opacity: 0.7; position: absolute; top: 25px; left: 100px;">
<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud1.png" alt="cloud" style="widht: 80px; height: 200px; opacity: 0.7; position: absolute; top: -50px; left: 300px;">
<img id="cloud1" src="http://localhost:8080/kikin/pages/cmn/img/cloud2.png" alt="cloud" style="widht: 80px; height: 150px; opacity: 0.7; position: absolute; top: 25px; left: 500px;">
 -->

		<div class="animation-area">
			<img id="dragon" src="http://localhost:8080/kikin/pages/cmn/img/dragon.gif" alt="dragon" width="800px" height="400px" style="position: absolute; top: 150px; left: -800px; z-index: 10;">
			
			<audio loop id="btn_audio">
				<source src="http://localhost:8080/kikin/pages/cmn/audio/dragon_fly1.mp3" type="audio/mp3">
			</audio>
			<div class="rains">
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			    <span></span><span></span><span></span><span></span><span></span>
			</div>
		</div>
		
		<main class="main rain"> 
		  <div align="center">
		    <div style="position: relative; z-index: 20;">ID�E�p�X���[�h����͂��Ă��������B</div>
		    <html:form action="/login" onsubmit="return validateLoginForm(this)">
		      <html:text property="shainId" size="16" style="width: 250px; height: 35px; margin-top: 30px; border-radius: 5px; position: relative; z-index: 20;"/>
		      <br/>
		      <html:password property="password" size="16" redisplay="false" style="width: 250px; height: 35px; margin-top: 30px; border-radius: 5px; position: relative; z-index: 20;"/>
		      <br/>
		       <%-- �G���[���b�Z�[�W��\�� --%>
		      <%
		      String errorMsg =(String) session.getAttribute("error");
		      if (errorMsg != null && !errorMsg.isEmpty()) {
		      %>
		      <script>
		      showMessage('E-MSG-000002', 'errorMessage');
		      </script>
		      <%
		      // �G���[���b�Z�[�W���N���A
		      session.removeAttribute("error");
		      }
		      %>
		      <br/>
		      <div style="width: 250px; padding-top: 20px;  font-size: 13px;">
			      <html:submit onclick="audio()" styleId="start" property="submit" value="���M" style="width: 70px; height: 35px; border-radius: 5px; position: relative; z-index: 20;" />
			      <html:reset value="���Z�b�g" style="width: 70px; height: 35px; border-radius: 5px; position: relative; z-index: 20;" />
		      </div>
		    </html:form>
		    <%--
		    �s�v�ȃe�L�X�g���\���ɂ��܂����B�i2024/02/22�@���c�j
		    sh0001<BR>
		    sh0002<BR>
		    sh0003<BR>
		    sh0004<BR>
		    sh0005<BR>
		     --%>
		  </div>
		</main>
	</div><%-- wrapper --%>
		
		<html:javascript formName="loginForm" />
		<script>
			// --�h���S���𓮂�������-- //
			const start = document.getElementById('start'); // �J�n�{�^��
			const image = document.getElementById('dragon'); // ���S�摜
	
			// �X�^�[�g�{�^�����N���b�N������
			start.addEventListener('click', () => {
			  // �摜�����[����200px�E�ɓ�����
			  image.animate(
			    // �r���̏�Ԃ�\���z��
			    [
			      { transform: 'translateX(0)'}, // �J�n���̏�ԁi���[�j
			      { transform: 'translateX(2000px)' } // �I�����̏�ԁi���[����200px�̈ʒu�j
			    ], 
			    // �^�C�~���O�Ɋւ���ݒ�
			    {
			      fill: 'backwards', // �Đ��O��̏�ԁi�Đ��O�A�J�n���̏�Ԃ�K�p�j
			      duration: 2000, // �Đ����ԁi1000�~���b�j
			    },
			  );
			});
			
			
			// --�����Đ�-- //
			function audio(){
				document.getElementById('btn_audio').play();
			}
			
			
			// --����
			window.onload = function(){
			    document.getElementById('wrap').classList.add('is-show');
			}
			/*
			// --�_��\���A����������-- //
			const image2 = document.getElementById('cloud1'); // �_�摜
			
			image2.animate(
			    // �r���̏�Ԃ�\���z��
			    [
			      { transform: 'translateX(0)'}, // �J�n���̏�ԁi���[�j
			      { transform: 'translateX(2000px)' } // �I�����̏�ԁi���[����200px�̈ʒu�j
			    ], 
			    // �^�C�~���O�Ɋւ���ݒ�
			    {
			      fill: 'backwards', // �Đ��O��̏�ԁi�Đ��O�A�J�n���̏�Ԃ�K�p�j
			      duration: 200000, // �Đ����ԁi1000�~���b�j
			    },
			);
			*/
			
		</script>
	
</body>
</html>