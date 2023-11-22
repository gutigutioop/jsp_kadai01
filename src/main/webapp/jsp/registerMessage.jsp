<%@ page contentType="text/html; charset=UTF-8" %>
<%
   //ログアウトするまではメッセージの情報を保持し続ける。
   // セッションの有効期限設定
  session.setMaxInactiveInterval(180);
  String logout = (String)request.getParameter("logout"); //「logout true」 が変数logoutの中に入る。//logout=trueはgetParameter?
  String message = null;
  if (logout != null && logout.equals("true")) {
    // セッションの破棄
    session.invalidate();
  } else {
    // GETパラメータから「メッセージ」を取り出す
    message = (String)request.getParameter("message");  //フォーム入力名が"message"に飛ぶ。
    if (message != null) {
      // 「メッセージ」が送信されていたので、セッションに保存
      session.setAttribute("message", message);
    } else {
      // 「メッセージ」が送信されていなかったので、セッションからメッセージを取得
      message = (String)session.getAttribute("message");
    }
  }
  if (message == null){
	  message = "";
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMessage</title>
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
  <form method="GET" action="registerMessage.jsp">
    <ul>
      <li><label for="message">メッセージ</label><input type="text" name="message" value="<%= message %>"/></li>
      <li>
        <input type="submit" value="登録" />
        <a href="registerMessage.jsp?logout=true">ログアウト</a>  
      </li>
    </ul>
  </form>
</body>
</html>
