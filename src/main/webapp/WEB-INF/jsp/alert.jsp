<%--
  Created by IntelliJ IDEA.
  User: hoy
  Date: 2015. 5. 26.
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<script type="text/javascript">
  var message ='${msg}';
  var returnUrl = '${url}';
  alert(message);
  document.location.href =returnUrl;
</script>
</body>
</html>
