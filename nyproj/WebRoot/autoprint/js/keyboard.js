//定义当前是否大写的状态
var CapsLockValue = 0;
var curEditName;
var check;
//document.write (' ------字母----');
document.write(
  ' <DIV class="softkeyboard" id="softkeyboard" name="softkeyboard" style="display:; ">'
);
document.write(' <input class="softkeyinout" id="softkeyinout" type="text">');
document.write(' <div class="c_panel zimu" id="zimu">');
document.write(
  ' <table align="center" width="98%" border="0" cellspacing="0" cellpadding="0">'
);

document.write(" <tr> ");
document.write(
  ' <td><input class="i_button i_button_fh" type=button onclick="addValue(\'1\');" value="1">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'2\');" value="2">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'3\');" value="3">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'4\');" value="4">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'5\');" value="5">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'6\');" value="6">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'7\');" value="7">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'8\');" value="8">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'9\');" value="9">'
);
document.write(
  ' <input class="i_button i_button_fh" type=button onclick="addValue(\'0\');" value="0">'
);
document.write(
  ' <input class="i_button i_button_btn" type=button onClick="commitValue(this);" value="确定">'
);
document.write(
  ' <input class="i_button i_button_btn" type=button onClick="rebackValue(this);" value="返回"></td>'
);
document.write(" </tr>");

document.write(" <tr> ");

document.write(
  ' <td><input class="i_button i_button_zm" type=button onclick="addValue(\'q\');" value="q">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'w\');" value=" w ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'e\');" value=" e ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'r\');" value=" r ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'t\');" value=" t ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'y\');" value=" y ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'u\');" value=" u ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'i\');" value=" i ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'o\');" value=" o ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'p\');" value=" p ">'
);
document.write(
  ' <input class="i_button i_button_btn" type=button onclick="clearValue();"  value=清空 ></td>'
);

document.write(" </tr>");
document.write(" <tr> ");
document.write(
  ' <td><input class="i_button i_button_zm" type=button onclick="addValue(\'a\');" value=" a ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'s\');" value=" s ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'d\');" value=" d ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'f\');" value=" f ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'g\');" value=" g ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'h\');" value=" h ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'j\');" value=" j ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'k\');" value=" k ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'l\');" value=" l ">'
);

document.write(
  ' <input class="i_button i_button_bs" type=button value=" BackSpace" onclick="backspace();"></td>'
);
document.write(" </tr>");

document.write(" <tr> ");
document.write(
  ' <td><input class="i_button i_button_zm" type=button onclick="addValue(\'z\');" value=" z ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'x\');" value=" x ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'c\');" value=" c ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'v\');" value=" v ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'b\');" value=" b ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'n\');" value=" n ">'
);
document.write(
  ' <input class="i_button i_button_zm" type=button onclick="addValue(\'m\');" value=" m ">'
);
document.write(
  ' <input class="i_button i_button_btn" type=button onClick="setCapsLock(this);" value="切换大写"></td>'
);

document.write(" </tr>");

document.write(" </table>");
document.write(" </div>");
//document.write ('--------------------------------------------');
document.write("</DIV>");

//给输入的密码框添加新值
function addValue(newValue) {
  CapsLockValue == 0
    ? $("#softkeyinout").val($("#softkeyinout").val() + newValue)
    : $("#softkeyinout").val($("#softkeyinout").val() + newValue.toUpperCase());
}
//清空
function clearValue() {
  $("#softkeyinout").val("");
}

function commitValue() {
  //$("#idInput").val($("#softkeyinout").val());
  $("#softkeyboard").hide();
  CARD = $("#softkeyinout").val();
  moveInfo();
  //   submitCard($("#softkeyinout").val());
}
function rebackValue() {
  //   $("#softkeyinout").val("");
  $("#softkeyboard").hide();
}
//实现BackSpace键的功能
function backspace() {
  var longnum = $("#softkeyinout").val().length;
  var num;
  num = $("#softkeyinout")
    .val()
    .substr(0, longnum - 1);
  $("#softkeyinout").val(num);
}
function changePanl(oj) {
  $("#" + oj)
    .siblings("div")
    .hide();
  $("#" + oj).show();
}
//设置是否大写的值
function setCapsLock(o) {
  if (CapsLockValue == 0) {
    CapsLockValue = 1;
    $(o).val("转化小写");
    $.each($(".i_button_zm"), function (b, c) {
      $(c).val($(c).val().toUpperCase());
    });
  } else {
    CapsLockValue = 0;
    $(o).val("转化大写");
    $.each($(".i_button_zm"), function (b, c) {
      $(c).val($(c).val().toLowerCase());
    });
  }
}

window.onload = function () {
  //	changePanl("zimu");
};
