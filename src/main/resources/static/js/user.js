let index = {
    init: function () {
        $("#btn-save").on("click", () => {
            this.save();
        });

        /*$("#btn-login").on("click", () => {
            this.login();
        });*/
    },

    save: function () {
        // alert("user의 save함수 호출됨");
        let data = {
            username: $("#username").val(),
            password: $("#password").val(),
            email: $("#email").val()
        };

        // console.log(data);

        // ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청
        // 요청에 대한 응답을 html이 아닌 Data(Json)를 받기 위해 ajax 사용
        // ajax 호출시 default가 비동기 호출
        $.ajax({
            // 회원가입 수행 요청
            type: "POST",
            url: "/auth/joinProc",
            data: JSON.stringify(data), // http body 데이터
            contentType: "application/json; charset=utf-8", // body 데이터의 MIME 타입
            dataType: "json"
        }).done(function (resp) {
            alert("회원가입이 완료되었습니다.");
            // console.log(resp);
            location.href = "/";
        }).fail(function (error) {
            alert(JSON.stringify(error))
        });
    },

    /*login: function () {
        let data = {
            username: $("#username").val(),
            password: $("#password").val(),
        };

        $.ajax({
            type: "POST",
            url: "/api/user/login",
            data: JSON.stringify(data), // http body 데이터
            contentType: "application/json; charset=utf-8", // body 데이터의 MIME 타입
            dataType: "json"
        }).done(function (resp) {
            alert("로그인이 완료되었습니다.");
            location.href = "/";
        }).fail(function (error) {
            alert(JSON.stringify(error))
        });
    }*/
}

index.init();