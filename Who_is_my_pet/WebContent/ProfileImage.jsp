<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 이미지 변경</title>
	<script src="/Scripts/jquery-1.10.2.js"></script>
    <script src="http://sdk.amazonaws.com/js/aws-sdk-2.1.24.min.js"></script>

    <script type="text/javascript">

        AWS.config.update({

            accessKeyId: 'AKIATRUSRWZLGFXJHUUD',
            secretAccessKey: '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'

        });

        AWS.config.region = 'ap-northeast-2';
    </script>
    
    <script>

        $(function () {
            $("#fileUploadForm").submit(function () {
                
                var bucket = new AWS.S3({ params: { Bucket: 'whosmypetuserimage' } });
                var fileChooser = document.getElementById('file');
                var file = fileChooser.files[0];

                if (file) {
                    var params = {
                        Key: file.name,
                        ContentType: file.type,
                        Body: file,
                        ACL: 'public-read' // 접근 권한
                    };

                    bucket.putObject(params, function (err, data) {
                        // 업로드 성공
                    });

                    //bucket.putObject(params).on('httpUploadProgress',
                    //    function (evt) {
                    //        console.log("Uploaded :: " + parseInt((evt.loaded * 100) / evt.total) + '%');
                    //    }).send(function (err, data) {
                    //        alert("File uploaded successfully.");
                    //    });
                } return false;
            });
        });
    </script>
</head>
<body>
	<form id="fileUploadForm" method="post" enctype="multipart/form-data">
        <input type="file" name="file" id="file" value="파일 업로드 하기" required="">
        <input type="submit" value="업로드 하기" />
    </form>
</body>
</html>