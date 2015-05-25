<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean
      id="User"
      class="Bridgeport.User"
      scope="session"/>

<jsp:setProperty
      name="User"
      property="*"/>

<jsp:forward page="listUser.jsp"/>