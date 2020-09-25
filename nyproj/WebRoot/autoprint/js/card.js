function getCard() {
  $.ajax({
    dataType: "JSONP",
    type: "get",
    url:
      "http://localhost:8080/docAction.do?method=getUserFlightInfos&idcard=" +
      622102198611119636, //接口服务器地址  参数: Fp=1读证内指纹，PhotoQuality 身份证头像质量，cardImg=1获取身份证正反面图片
    //contentType: "application/x-www-form-urlencoded; charset=utf-8",
    success: function (data) {
      console.log(data)
    },
    error: function (e) {
      //失败执行
      alert(e.status + "," + e.statusText);
    },
  });
}

getCard()
