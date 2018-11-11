<%--The page gotten when going to "/sendbet".--%>
<%--Used just for creating bets.--%>
<%--Todo: sort out time and date resolve. Using HTML5, won't be compatible with every browser--%>
<%--probably better to create a time and date picker with js.--%>
<%--Todo: make sure that errors are given to the user.--%>
<%--Maybe only allow the user to send a bet with two decimal points, amount and odds.--%>
<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<body>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/button.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css"/>"/>
    <link href="https://fonts.googleapis.com/css?family=Krub" rel="stylesheet">
</head>

<%@ include file="blocks/header.jsp" %>

<h1>Send bet</h1>

<div class="box makeBetBox">
    <sf:form method="POST" modelAttribute="pendingBet" action="/sendbet" autocomplete="off" onkeypress="return event.keyCode != 13;">
        <input type="hidden" value="${username}" name="sender" required>
        <legend>Name of bet</legend>
        <input type="text" placeholder="Bet name" name="title" required>
        <legend>Description</legend>
        <input type="text" placeholder="Description" name="description" required>

        <%--date and time virka ekki a ollum browserum t.d. firefox!!!!!!!--%>
        <lengend>Date and time for bet to be resolved</lengend>

        <%--<legend>The format dd-MON-yyyyThh:mm</legend>--%>
        <input type="datetime-local" name="dateAndTimeResolve" required>
        <%--You can only send to users that exist.--%>
        <legend>Opponent</legend>
        <div id="users-dropdown">
            <input type="text" id="opponent" placeholder="Opponent" name="receiver" required>
        </div>


        <%--This is used to deliver all the users to the jsp.--%>
        <c:forEach items="${users}" var="user">
            <c:if test="${pageContext.request.userPrincipal.name != user.getUsername()}">
                <span class="get-users" hidden>${user.getUsername()}</span>
            </c:if>
        </c:forEach>


        <legend>Your Amount</legend>
        <input id="your-amount" type="number" step="0.001" placeholder="Your amount" name="amountSender" required>

        <legend>Your Odds</legend>
        <input id="your-odds" type="number" step="0.001" placeholder="Your Odds" name="oddsSender" required>
        <span id="your-odds-percentage"></span>

        <%--Here we calculate the amount and odds the other user will have to send to match what the sender--%>
        <%--wants to bet. The calculations that are put in the database are made in the betservice again, for security--%>
        <%--purposes.--%>
        <span>Opponent-odds</span>
        <span id="opponent-odds"></span>
        <br>
        <br>

        <span>Opponent-amount</span>
        <span id="opponent-amount"></span>

        <br>

        <span class="credits-error"></span>
        <br>
        <button class="button submit" type="submit">
            <span>
                Send bet
            </span>
        </button>
    </sf:form>
    <span id="user-credits" hidden>${user.getCredit()}</span>


</div>
</body>
<script src="<c:url value="/javascript/autofillbox.js" />"></script>
<script src="<c:url value="/javascript/calcOdds.js" />"></script>
</html>
