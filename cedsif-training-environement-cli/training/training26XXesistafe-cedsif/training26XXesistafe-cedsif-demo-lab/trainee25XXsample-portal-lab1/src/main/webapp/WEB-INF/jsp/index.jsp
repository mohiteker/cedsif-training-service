
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="trainee24xxshifu" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CloudTS</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Custom Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="assets/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/main.css" type="text/css">

</head>


<body id="page-top">
  <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top"> <i class="fa fa-6x fa-cloud">Start</i></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
               
               <!-- construcao de um menu dinamico utilizando lista atraves do objecto Menu (url,description) -->
               <trainee24xxshifu:forEach items="${menuList}" var="menu">
	                <li>
	                    <a class="page-scroll" href="${menu.url}">${menu.description}</a>
	                </li>
               </trainee24xxshifu:forEach>
               
               <!-- construcao de um menu dinamico utilizando maps atraves do objecto menu -->
               <trainee24xxshifu:forEach var="entry" items="${menuMap}">
               		<li>
	                    <a class="page-scroll" href="${entry.value}">${entry.key}</a>
	                </li>
               </trainee24xxshifu:forEach>
                
                 <li>
                     <a class="page-scroll" href="${loginUrl}"><trainee24xxshifu:out value="${login}"/></a>
                </li>
                
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

  <header>
    <div class="header-content">
        <div class="header-content-inner">
            <h3>CloudTS is the best Mozambican cloud training experience.</h3>
            <hr>
            <p>Start with CloudTS and build a better cloud enviroment using distributed systems and cloud native principles! Just run
            </hr>
            </br> ssh user@training24XXj8-node02 and joy.</p>
            <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
        </div>
    </div>
</header>

<!--  <section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">We've got what you need!</h2>
                <hr class="light">
                <p class="text-faded">Start Bootstrap has everything you need to get your new website up and running in no time! All of the templates and themes on Start Bootstrap are open source, free to download, and easy to use. No strings attached!</p>
                <a href="#" class="btn btn-default btn-xl">Get Started!</a>
            </div>
        </div>
    </div>
</section>
 -->
  <section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Services that we Provide</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-server wow bounceIn text-primary"></i>
                    <h3>Hosting Service </br>(HoS)</h3>
                    <p class="text-muted">We can store and configure your <i>website</i> over our hosting service and garante a best effort of your application. Checkout the <a>Plan.</a></p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-cloud wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    <h3>Cloud training Service (CloudTS)</h3>
                    <p class="text-muted">We have an innovated laboratory with a cloudroom environemnt to train you remotely in different areas. Checkout the <a>Plan.</a></p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-laptop wow bounceIn text-primary" data-wow-delay=".2s"></i>
                    <h3>Computer support Service </br>(CompS)</h3>
                    <p class="text-muted">We have tools to organize and help you to solve all problems around your computer. ContactUs.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-hdd-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                    <h3>Developing Softwares </br>(DevSoft)</h3>
                    <p class="text-muted">We Develop applications and soluctions based on DistributedSystem which covers all CloudNative Principles. MailUs.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!--  <section class="no-padding" id="portfolio">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/2.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/3.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/4.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/5.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="img/portfolio/6.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>
 -->
<!--    <aside class="bg-dark">
      <div class="container text-center">
          <div class="call-to-action">
              <h2>Free Download at Start Bootstrap!</h2>
              <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
          </div>
      </div>
  </aside>
 -->
  <!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <ul class="list-inline text-center">
                    <!-- kill the Facebook and Weibo -->
                    <li>
                        <a href="/feed.xml">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-rss fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="https://twitter.com/@shifu">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    

                    
                    <li>
                        <a href="http://www.dmj-it.net/git/shifu/trainingRoom24XX">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    
                    
                    <!--
                    
                    -->

                    <!--
                    
                    -->

                    
                    <!--
                    
                    -->

                </ul>
                <p class="copyright text-muted"> &copy; 2024 <a href=""><code>shifu@dmj-it.net</code></a>.
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src=""></script>

<!-- Bootstrap Core JavaScript -->
<script src=""></script>

<!-- Custom Theme JavaScript -->
<script src=""></script>



<!-- Highlight.js -->
<script>
    async("http://cdn.bootcss.com/highlight.js/8.6/highlight.min.js",function(){
        hljs.initHighlightingOnLoad();
    })
</script>
<link href="http://cdn.bootcss.com/highlight.js/8.6/styles/github.min.css" rel="stylesheet">

  <!-- jQuery -->
<script src="assets/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/jquery.fittext.js"></script>
<script src="assets/js/wow.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/js/creative.js"></script>
</body>

</html>
