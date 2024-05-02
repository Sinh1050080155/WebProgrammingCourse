<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

        <title>Blog - Programming Course</title>


        <link href="blogcss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="blogcss/assets/css/flex-slider.css" rel="stylesheet" type="text/css"/>
        <link href="blogcss/assets/css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link href="blogcss/assets/css/owl.css" rel="stylesheet" type="text/css"/>
        <link href="blogcss/assets/css/templatemo-stand-blog.css" rel="stylesheet" type="text/css"/>


    </head>

    <body>
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.html"><h2>Programming Course<em>.</em></h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.html">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="about.html">Khóa học</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="post-details.html">Lộ trình</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Liên hệ</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="BlogManagement">Blogs</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>


        <div class="main-banner header-text">
            <div class="container-fluid">
                <div class="owl-banner owl-carousel">
                    <c:forEach items="${blogList}" var="blog">
                        <div class="item">
                            <img src="${blog.img}" alt="${blog.name}" style="width: 420px; height: 220px; object-fit: cover;">

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>




        <section class="blog-posts">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <c:forEach items="${blogList}" var="blog">
                            <c:if test="${blog.id >= 1 and blog.id <= 3}">
                                <div class="all-blog-posts">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="blog-post">
                                                <div class="blog-thumb">
                                                    <img src="${blog.img}" alt="${blog.name}" style="width: 730px; height: 365px; object-fit: cover;" >
                                                </div>
                                                <div class="down-content">
                                                    <a href="blogContent?blogId=${blog.id}"><h4>${blog.name}</h4></a>

                                                    <c:choose>
                                                        <c:when test="${fn:length(blog.description) > 450}">
                                                            ${fn:substring(blog.description, 0, 450)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${blog.description}
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div class="post-options">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <ul class="post-tags">
                                                                    <li><i class="fa fa-tags"></i></li>
                                                                    <li><a href="#">Beauty</a>,</li>
                                                                    <li><a href="#">Nature</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-6">
                                                                <ul class="post-share">
                                                                    <li><i class="fa fa-share-alt"></i></li>
                                                                    <li><a href="#">Facebook</a>,</li>
                                                                    <li><a href="#"> Twitter</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="sidebar-item search">
                                        <form id="search_form" name="gs" method="GET" action="#">
                                            <input type="text" name="search" class="searchText" placeholder="type to search..." autocomplete="on">
                                        </form>
                                    </div>


                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item recent-posts">
                                        <div class="sidebar-heading">
                                            <h2>Recent Posts</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="post-details.html">
                                                        <h5>Vestibulum id turpis porttitor sapien facilisis scelerisque</h5>
                                                        <span>May 31, 2020</span>
                                                    </a></li>
                                                <li><a href="post-details.html">
                                                        <h5>Suspendisse et metus nec libero ultrices varius eget in risus</h5>
                                                        <span>May 28, 2020</span>
                                                    </a></li>
                                                <li><a href="post-details.html">
                                                        <h5>Swag hella echo park leggings, shaman cornhole ethical coloring</h5>
                                                        <span>May 14, 2020</span>
                                                    </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item categories">
                                        <div class="sidebar-heading">
                                            <h2>Categories</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="#">- Nature Lifestyle</a></li>
                                                <li><a href="#">- Awesome Layouts</a></li>
                                                <li><a href="#">- Creative Ideas</a></li>
                                                <li><a href="#">- Responsive Templates</a></li>
                                                <li><a href="#">- HTML5 / CSS3 Templates</a></li>
                                                <li><a href="#">- Creative &amp; Unique</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item tags">
                                        <div class="sidebar-heading">
                                            <h2>Tag Clouds</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="#">Lifestyle</a></li>
                                                <li><a href="#">Creative</a></li>
                                                <li><a href="#">HTML5</a></li>
                                                <li><a href="#">Inspiration</a></li>
                                                <li><a href="#">Motivation</a></li>
                                                <li><a href="#">PSD</a></li>
                                                <li><a href="#">Responsive</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="social-icons">
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Behance</a></li>
                            <li><a href="#">Linkedin</a></li>
                            <li><a href="#">Dribbble</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>


        <script src="blogcss/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="blogcss/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>


        <script src="blogcss/assets/js/custom.js"></script>
        <script src="blogcss/assets/js/owl.js"></script>
        <script src="blogcss/assets/js/slick.js"></script>
        <script src="blogcss/assets/js/isotope.js"></script>
        <script src="blogcss/assets/js/accordions.js"></script>

        <script language = "text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0;
            function clearField(t) {
                if (!cleared[t.id]) {
                    cleared[t.id] = 1;
                    t.value = '';
                    t.style.color = '#fff';
                }
            }
        </script>

        <script>
            var pageNo = 1;
            function loadMoreBlogs() {
                pageNo++;
                $.ajax({
                    url: 'BlogServlet',
                    type: 'GET',
                    data: {page: pageNo},
                    success: function (response) {
                        $('.all-blog-posts > .row').append(response);
                        if (!response.trim()) {
                            $('#loadMore').hide();
                        }
                    },
                    error: function () {
                        alert('Không thể tải thêm bài viết');
                    }
                });
            }

            $(document).ready(function () {
                $('#loadMore').click(function () {
                    loadMoreBlogs();
                });
            });
        </script>


      



    </body>
</html>