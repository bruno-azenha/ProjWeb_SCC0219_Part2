<%@page language="java" contentType="text/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
		<html lang= "pt-br">
<head>
	<meta charset ="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<title>Bridgeport Main page</title>
</head>
<body>
	<div class= "navbar-wrapper">
		<nav class="navbar navbar-default">
			<div class ="container">
				<div class = "navbar-header ">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
						 <span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class ="navbar-brand" href= "${pageContext.request.contextPath}">Bridgeport Hotel</a>
					</div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
						<li class=""><a href="#">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/signup.jsp">Register</a></li>
						<li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>	
						<a class="btn btn-md btn-primary navbar-btn " href="${pageContext.request.contextPath}/login.jsp" role="button">log in</a>               
						</ul>
					</div>
				</div>
		</nav>
	</div>

	<div class="container">
	<!-- to achieve the carrousel an id is required and the class carousel indicate thata the div contains a carousel(uses bootstrap.js) the data-ride atribbute tells to the slideshow  to start when the page load -->
	<div id="bridgeportCarousel" class="carousel slide col-md-12" data-ride="carousel">
		<!-- Indicators its the dots to indicate the current slide(must be used with an ol-->
		<ol class="carousel-indicators">
		<!-- data target it must be the id of the carousel and data-to-slide tells the browser which slide to show when the dot is clicked -->
		<li data-target="#bridgeportCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#bridgeportCarousel" data-slide-to="1"></li>
		<li data-target="#bridgeportCarousel" data-slide-to="2"></li>
		</ol>
		<!-- The slides are specified in a <div> with class .carousel-inner. The content of each slide is defined in a <div> with class .item. Also, the .active class needs to be added to one of the slides in order to the carousel be visible. -->
		<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img class="first-slide" src="${pageContext.request.contextPath}/imgs/hotel.jpg" alt="hotel photo">
			<div class="container">
			<!-- add a caption to the image -->
			<div class="carousel-caption">
				<h1>Bridgeport Hotel</h1>
				<!--  If the page is loaded via <code> file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules. -->
				<p class = "info">Bridgeport hotel is a great place to stay. A confortable place with  friendly staff which will be happy to take care of you while you are in this beautifull city. Whether you are here to relax, to work or to visit we have a room just for you. Make your reservation today</p>
				<p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/login.jsp" role="button">log in</a></p>
			</div>
			</div>
		</div>
		<div class="item">
			<img class="second-slide" src="${pageContext.request.contextPath}/imgs/facilities1.jpg" alt="bar photo">
			<div class="container">
			<div class="carousel-caption">
				<h1>Want to relax?</h1>
				<p class= "info" > Our lounge bar it's the right spot to meet new people in a relaxed envoriment. Not fancy for a drink? don't worry we still have a spa house for the deep relaxation you are looking for. Don't want to relax? Ok, then, we still hava an olympic pool and a gym if you still have energy to burn. Interested??? then take a look at our galery and see what we've got </p>
				<p><a class="btn btn-lg btn-primary" href="#facilities" role="button">Our Facilites</a></p>
			</div>
			</div>
		</div>
		<div class="item">
			<img class="third-slide" src="${pageContext.request.contextPath}/imgs/bedroom1.jpg" alt="bedroom photo">
			<div class="container">
			<div class="carousel-caption">
				<h1>Let us worry about your stay.</h1>
				<p class="info" >As every hotel should, we have bathroom in every bedroom with free towels at your disposal. Other services, such as, free wifi and cell phone chargers are avilable too. if you are looking for something more see a list of services below </p>
				<p><a class="btn btn-lg btn-primary" href="#" role="button">Our Services</a></p>
			</div>
			</div>
		</div>
		</div>

		<!-- This code adds "left" and "right" buttons that allows the user to go back and forth between the slides manually. The data-slide attribute accepts the keywords "prev" or "next", which alters the slide position relative to its current position. -->
		<a class="left carousel-control" href="#bridgeportCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#bridgeportCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
		</a>
	</div>
	</div>

	<div class="container marketing">
		 <hr class="featurette-divider">
		<div   id= "facilities" class="row featurette ">
		<div class="col-md-7">
			<h2 class="featurette-heading">Awesome Bar. <span class="text-muted">It will blow your mind.</span></h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block" src="${pageContext.request.contextPath}/imgs/bar2.jpg" alt="bar">
		</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
		<div class="col-md-7 col-md-push-5">
			<h2 class="featurette-heading">Deep relaxing. <span class="text-muted">See for yourself.</span></h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img class="featurette-image img-responsive center-block" src="${pageContext.request.contextPath}/imgs/innerspa.jpg" alt="spa">
		</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">The Pump-up gym. <span class="text-muted">Work it out.</span></h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block" src="${pageContext.request.contextPath}/imgs/gym.jpg" alt="Gym">
		</div>
		</div>

		 <hr class="featurette-divider">

		<div class="row featurette">
		<div class="col-md-7 col-md-push-5">
			<h2 class="featurette-heading">The crystal clear pool. <span class="text-muted">Dive in.</span></h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img class="featurette-image img-responsive center-block" src="${pageContext.request.contextPath}/imgs/innerpool.jpg" alt="pool">
		</div>
		</div>

		<hr class="featurette-divider">

		<!-- /END THE FEATURETTES -->


		<!-- FOOTER -->
		<footer>
		<p class="pull-right"><a href="#">Back to top</a></p>
		<p>&copy; 2015 designed by Clayton de Oliveira, All rights reserved &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
		</footer>

	</div><!-- /.container -->
</body>
</html>
