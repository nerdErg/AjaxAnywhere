<%@ taglib prefix="aa" uri="http://com.nerderg/ajaxanywhere" %>
<%--
  Created by IntelliJ IDEA.
  User: rui008
  Date: 11/04/15
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>




      /* Declarative */
      <a aa-refresh-zones="zoneToRefresh"
         href="url to get content">
        Do something
      </a>

      <aa:zone id="zoneToRefresh">
        // This content will be refreshed asynchronously
      </aa:zone>



      /* Imperative */
      <a id="refreshButton"
         href="url to get content">
        Do something
      </a>

      <script>
        $('#refreshButton').click(function(event) {
          event.preventDefault();
          $.ajax({
            url: $(this).attr('href'),
            success: function(content){
              $("#zoneToRefresh").html(content);
            }
          });
        });
      </script>

      <div id="zoneToRefresh">
        // This content will be refreshed asynchronously
      </div>



</body>
</html>
