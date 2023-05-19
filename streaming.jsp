<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="height=device-height">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="./js/paho-mqtt.js"></script>
	<script type="text/javascript">
	$(function() {
		//클라이언트 인스턴스 생성(MQTT 서버의 주소를 입력해야 함)
		client = new Paho.MQTT.Client("localhost", 61614, new Date().getTime().toString());

		// 이벤트 핸들러 설정
		client.onConnectionLost = onConnectionLost;
		client.onMessageArrived = onMessageArrived;

		// 클라이언트 연결, 연결 성공하면 onConnect() 함수를 실행함
		client.connect({onSuccess:onConnect});
	})

	// 클라이언트가 연결되었을 때 호출되는 콜백함수
	function onConnect() {
		console.log("mqtt broker subscriber connected");
		client.subscribe("/#");
	}

	// 클라이언트가 커넥션을 읽을 때 호출되는 콜백함수
	function onConnectionLost(responseObject) {
	  if (responseObject.errorCode !== 0) {
	    console.log("onConnectionLost:"+responseObject.errorMessage);
	  }
	}

	// 메시지가 도착했을 때 호출되는 콜백함수
	function onMessageArrived(message) {
		if(message.destinationName == "/camerapub") {
			$("#cameraView").attr("src", "data:image/jpg;base64, " + message.payloadString);
		}
	}
	</script>
	<title>모니터링 AI 서비스</title>
	<style>
	div {
		width: 100%;
		height: 100%;
	}
	img#cameraView {
		max-width: 100%;
		max-height: 100%;
		bottom: 0;
		left: 0;
		margin: auto;
		overflow: auto;
		position: fixed;
		right: 0;
		top: 0;
		}
	</style>
</head>
<body>
	<!--h5 class="alert alert-info">AI 실증 서비스</h5-->
	<div align="center">
		<img id="cameraView" width=100% height=100%/>
	</div>
</body>
</html>
