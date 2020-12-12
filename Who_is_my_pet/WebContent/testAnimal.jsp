<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="dto.UserAnimalDTO"%>
<%@ page import="dao.UserAnimalDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/normalize.css" />
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<%
	int user_idx = 0;
	try {
		user_idx = (int) session.getAttribute("idx");

		if (user_idx == 0) {
			response.sendRedirect("LoginPage.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</head>

<body>
	<!-- 전체영역 시작 -->
	<div id="wrap">
		<!-- 상단영역 시작 -->
		<div id="header">
			<div class="globalArea">
				<a href="">Join</a>
				<%
					if (user_idx == 0) {
				%>
				<a href="LoginPage.jsp">Login</a>
				<%
					} else {
				%>
				<a href="Logout.do">Logout</a>
				<%
					}
				%>
				<a href="">MyPage</a> <a href="postInfo.html">Ads</a> <a
					href="startTest.jsp">Home</a>
			</div>
			<div class="logoArea"></div>
		</div>
		<!-- 상단영역 끝 -->

		<!-- 본문영역 시작 -->
		<div id="content">
			<div
				style="text-align: center; font-size: 40px; font-family: Cafe24Ohsquare;">나와
				닮은 동물상 찾기 테스트</div>
			<!--모델 업로드 버튼-->
			<div style="margin-top: 40px; margin-bottom: 20px"></div>
			<!--여기에 html 추가-->
			<script class="jsbin"
				src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
			<div class="file-upload">
				<button class="file-upload-btn" type="button"
					onclick="$('.file-upload-input').trigger( 'click' )">클릭해서
					이미지 추가하기</button>

				<div class="image-upload-wrap">
					<input class="file-upload-input" type='file'
						onchange="readURL(this);" accept="image/*" />
					<div class="drag-text">
						<h3>나의 사진을 불러와 주세요</h3>
					</div>
				</div>
				<div class="file-upload-content">
					<img class="file-upload-image" id="face-image" src="#"
						alt="your image" />
					<div class="image-title-wrap">
						<button type="button" onclick="removeUpload()"
							class="remove-image">
							Remove <span class="image-title">Uploaded Image</span>
						</button>
					</div>
				</div>

			</div>
			<div id="label-container"></div>

			<script type="text/javascript"
				src="https://www.gstatic.com/charts/loader.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
			<!--여기에 javascript 추가-->
			<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.image-upload-wrap').hide();

                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();

                    $('.image-title').html(input.files[0].name);
                };

                reader.readAsDataURL(input.files[0]);
                init().then(function() {
                    console.log("hello");
                    predict();
                });

            } else {
                removeUpload();
            }
        }

        function removeUpload() {
            $('.file-upload-input').replaceWith($('.file-upload-input').clone());
            $('.file-upload-content').hide();
            $('.image-upload-wrap').show();
        }
        $('.image-upload-wrap').bind('dragover', function () {
            $('.image-upload-wrap').addClass('image-dropping');
        });
        $('.image-upload-wrap').bind('dragleave', function () {
            $('.image-upload-wrap').removeClass('image-dropping');
        });
    </script>
			<script type="text/javascript">
        // the link to your model provided by Teachable Machine export panel
        const URL = "https://teachablemachine.withgoogle.com/models/SIvIpcxO8/";

        let model, webcam, labelContainer, maxPredictions;
        var data;
        var chart;
        var animal_id;
        var percentage

        // Load the image model 
        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";

            // load the model and metadata
            model = await tmImage.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            // append elements to the DOM
            labelContainer = document.getElementById("label-container");

            /*
            for (let i = 0; i < maxPredictions; i++) { // and class labels
                labelContainer.appendChild(document.createElement("div"));
            }
            */
        }

        async function predict() {
            // predict can take in an image, video or canvas html element
            var image = document.getElementById("face-image");
            const prediction = await model.predict(image, false);
            prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability));
            for (let i = 0; i < maxPredictions; i++) {
            	/*
                const classPrediction =
                    prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                    */                 
                //labelContainer.childNodes[i].innerHTML = classPrediction;
                if(prediction[i].className=='Dog') prediction[i].className = '강아지상';
                if(prediction[i].className=='Cat') prediction[i].className = '고양이상';
                if(prediction[i].className=='Deer') prediction[i].className = '사슴상';
                if(prediction[i].className=='Rabbit') prediction[i].className = '토끼상';
                if(prediction[i].className=='Fox') prediction[i].className = '여우상';
                if(prediction[i].className=='Frog') prediction[i].className = '개구리상';
                if(prediction[i].className=='Horse') prediction[i].className = '말상';
                if(prediction[i].className=='Sloth') prediction[i].className = '나무늘보상';
                if(prediction[i].className=='Bear') prediction[i].className = '곰상';
                if(prediction[i].className=='Dinosaur') prediction[i].className = '공룡상';
            }
            console.log(prediction[0].className);
            console.log(prediction[0].probability.toFixed(2));
            
            animal_id = prediction[0].className;
            percentage = (prediction[0].probability.toFixed(2))*100;
            
            console.log(animal_id);
            console.log(percentage);
            
            var data = google.visualization.arrayToDataTable([
                ['className', '%', { role: 'style' }],
                [prediction[0].className, (prediction[0].probability.toFixed(2))*100 ,'color: #FA5858'],
                [prediction[1].className, (prediction[1].probability.toFixed(2))*100, 'color: #FF8000'],
                [prediction[2].className, (prediction[2].probability.toFixed(2))*100, 'color: #FFFF00'],
                [prediction[3].className, (prediction[3].probability.toFixed(2))*100, 'color: #BFFF00'],
                [prediction[4].className, (prediction[4].probability.toFixed(2))*100, 'color: #00BFFF'],
                [prediction[5].className, (prediction[5].probability.toFixed(2))*100, 'color: #0040FF'],
                [prediction[6].className, (prediction[6].probability.toFixed(2))*100, 'color: #8000FF'],
                [prediction[7].className, (prediction[7].probability.toFixed(2))*100, 'color: #FF00FF'],
                [prediction[8].className, (prediction[8].probability.toFixed(2))*100, 'color: #FF0080'],
                [prediction[9].className, (prediction[9].probability.toFixed(2))*100, 'color: #6E6E6E'],
             ]);
            
            // Set chart options
            var options = {'title':'인공지능이 분석한 결과 당신의 동물상은 ' +  prediction[0].className + ' 입니다!',
                           'width':700,
                           'height':500, 'is3D':true, 
                           'backgroundColor':'#f9ece8',};

            // Instantiate and draw our chart, passing in some options.
            chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);
            
            return [animal_id, percentage];
          } 

         // Load the Visualization API and the piechart package.
         google.charts.load('current', {'packages':['corechart']});

         // Set a callback to run when the Google Visualization API is loaded.
         setTimeout(() => {google.charts.setOnLoadCallback(predict)},10000);

        function selectHandler() {
           var selectedItem = chart.getSelection()[0];
           var value = data.getValue(selectedItem.row, 0);
           alert('The user selected ' + value);
         }


        function submitInfo(){
            var form = document.createElement("form");
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "./testResultInfoAction.jsp"); //요청 보낼 주소

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "animal_idx");
            hiddenField.setAttribute("value", animal_id);
            form.appendChild(hiddenField);         
            document.body.appendChild(form);
            form.submit();
        }
    </script>
			<!--Div that will hold the pie chart-->
			<div style="width: 100%; text-align: center;">
				<div id="chart_div"
					style="width: 400; height: 300; display: inline-block;"></div>
			</div>

			<button class="next-btn" type="button" onclick="submitInfo()">다음
				화면으로 이동하기</button>
		</div>
		<div></div>
		<!-- 본문영역 끝 -->
	</div>
	<!-- 전체영역 끝 -->
</body>
</html>
