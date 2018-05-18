<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en-us">
<head>
    <!-- Basic Page Needs -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="utf-8">
    <title>Allec - Forms</title>
    <meta name="description" content="A Template by Designzway team">
    <meta name="keywords" content="HTML, CSS, JavaScript">
    <meta name="author" content="Designzway team">

    <!-- Mobile Specific Metas-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="telephone=no" name="format-detection">

    <!-- Fonts -->
    <!-- Open Sans -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300,400italic,600,700italic,400,700,800italic' rel='stylesheet' type='text/css'>
    <!-- VarelaRound -->
    <link href='http://fonts.useso.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <!-- Icon Font - Font Awesome -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Stylesheets -->
    <!-- External -->
    <!-- Mobile menu -->
    <link href="/home/external/z-nav/z-nav.css" rel="stylesheet">
    <!-- Select box -->
    <link href="/home/external/bootstrap-select/bootstrap-select.css" rel="stylesheet">

    <!-- Touch slider - Swiper -->
    <link href="/home/external/swiper/idangerous.swiper.css" rel="stylesheet" />

    <!-- Custom -->
    <link href="/home/css/style.css?v=1" rel="stylesheet" />

    <!-- Basic JavaScript-->
    <!-- Modernizr -->
    <script src="/home/external/modernizr/modernizr.custom.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.js"></script>
    <![endif]-->

    <!--[if lte IE 9]>
    <link href="css/ie9.css?v=1" rel="stylesheet" />
    <![endif]-->
</head>

<body>

<div class="wrapper" id="top">

    <!-- Header section -->
    <header class="header">
        <div class="header-fixed">
            <div class="header-line waypoint" data-animate-down="header-up" data-animate-up="header-down">
                <div class="container">
                    <!-- Contact information about company -->
                    <address class="contact-info pull-left hidden-lower">
						<span class="contact-info__item">
							<i class="fa fa-location-arrow"></i>
							101 West Street, New York, NY 12345
						</span>
						<span class="contact-info__item">
							<i class="fa fa-mobile"></i>
							+1-888-555-5555
						</span>
						<span class="contact-info__item">
							<i class="fa fa-envelope"></i>
							info@allec.com
						</span>
                    </address>
                    <!-- end contact information -->

                    <!-- Search field -->
                    <form class="search pull-right" id="search-form" name="search-form" method="get" action="#">
                        <input class="search__field" name="search-request" type="search" placeholder="search" value="">
                        <button class="search__btn" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                    <!-- end search field -->
                </div>  <!-- end container -->
            </div>

            <div class="fixed-top header-down">
                <div class="container">
                    <!--  Logo  -->
                    <a class="logo" href="../index.html">
                        <!-- Remove comments to choose image and add comment to h1 -->
                        <!--<img src="images/logo-full.png" alt="">-->
                        <h1 class="logo__text">Alle<span class="highlight">c</span><br>
                            <span class="logo__slogan">your business universe</span>
                        </h1>
                    </a>
                    <!-- End Logo -->

                    <!-- Navigation section -->
                    <nav class="z-nav">
                        <!-- Toggle for menu mobile view -->
                        <a href="#" class="z-nav__toggle">
                            <span class="menu-icon"></span>
                            <span class="menu-text">navigation</span>
                            <div class="menu-head"></div>
                        </a>

                        <ul class="z-nav__list">
                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../index.html">Home</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index1.html">Homepage Version 1</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index2.html">Homepage Version 2</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index3.html">Homepage Version 3</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index-host.html">Hosting Homepage</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index-animation.html">Homepage with Canvas Animation</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index.html">Hero Header Version</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../onepage-layout.html">Onepage Version</a></li>

                                    <li class="z-nav__item">
                                        <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                        <a class="z-nav__link" href="#">Dark Headers</a>
                                        <ul class="z-nav__list-secondary z-nav_nested">
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-1.html">Default Header</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-2.html">Header with Social Icons</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-3.html">Header with Centred Logo</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-4.html">Two-row Header with Small Logo</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-5.html">Simplified Header</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-6.html">E-commerce Header</a>
                                        </ul>
                                    </li>
                                    <li class="z-nav__item">
                                        <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                        <a class="z-nav__link" href="#">Light Headers</a>
                                        <ul class="z-nav__list-secondary z-nav_nested">
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-1-light.html">Default Header</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-2-light.html">Header with Social Icons</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-3-light.html">Header with Centred Logo</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-4-light.html">Two-row Header with Small Logo</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-5-light.html">Simplified Header</a>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../header-6-light.html">E-commerce Header</a>
                                        </ul>
                                    </li>
                                    <li class="z-nav__item">
                                        <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                        <a class="z-nav__link" href="#">Dark Footers</a>
                                        <ul class="z-nav__list-secondary z-nav_nested">
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-1.html">Default Footer</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-2.html">Footer with Subscription</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-3.html">Footer with Contact Form</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-4.html">Simplified Footer</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-5.html">Footer with Instagram Feed</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-6.html">Centered Footer</a></li>
                                        </ul>
                                    </li>
                                    <li class="z-nav__item">
                                        <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                        <a class="z-nav__link" href="#">Light Footers</a>
                                        <ul class="z-nav__list-secondary z-nav_nested">
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-1-light.html">Default Footer</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-2-light.html">Footer with Subscription</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-3-light.html">Footer with Contact Form</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-4-light.html">Simplified Footer</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-5-light.html">Footer with Instagram Feed</a></li>
                                            <li class="z-nav__item"><a class="z-nav__link" href="../footer-6-light.html">Centered Footer</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../about.html">About</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../about.html">About</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-employee.html">Single employee</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../careers.html">Careers</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../testimonials.html">Testimonials</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../contact1.html">Contact version 1</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../contact2.html">Contact version 2</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../services.html">Services</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../services.html">Services version 1</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../services2.html">Services version 2</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../services3.html">Services version 3</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-service.html">Single service</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../pricing-tables.html">Pricing</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../support.html">Support</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../dashboard.html">Dashboard</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>


                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../gallery-3col.html">Portfolio</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../gallery-2col.html">Portfolio 2 columns</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../gallery-3col.html">Portfolio 3 columns</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../gallery-4col.html">Portfolio 4 columns</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../gallery-full.html">Portfolio fullwidth</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../case-study.html">Case study</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../index-commerce.html">Shop</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../index-commerce.html">Homepage</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../shop-grid-full.html">Catalog fullwidth grid</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../shop-list-full.html">Catalog fullwidth list</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../shop-grid.html">Catalog grid with sidebar</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../shop-list.html">Catalog list with sidebar</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-product.html">Single product with sidebar</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-product-full.html">Single product fullwidth</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../wishlist.html">Wishlist</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../orders.html">My orders</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../checkout.html">Checkout</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../shopping-cart.html">Shopping cart</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../blog.html">Blog</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog.html">Blog with sidebar</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-full.html">Blog fullwidth</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-masonry.html">Blog masonry</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-timeline.html">Blog timeline</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-post.html">Single post with sidebar</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../single-post-full.html">Single post fullwidth</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-audio.html">Blog audio</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-video.html">Blog video</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../blog-author.html">Post author</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link" href="../forum.html">Forum</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary">
                                    <li class="z-nav__item"><a class="z-nav__link" href="../forum.html">Forum page</a></li>
                                    <li class="z-nav__item"><a class="z-nav__link" href="../forum-thread.html">Forum thread page</a></li>
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>

                            <li class="z-nav__item">
                                <!-- Subsidiary menu toogle button -->
                                <span class="z-nav__toggle-sub plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
                                <a class="z-nav__link z-nav__link--active" href="site-map.html">Additional</a>
                                <!-- Subsidiary menu list-->
                                <ul class="z-nav__list-secondary mega-menu">
                                    <div class="col-sm-3 col-md-2">
                                        <li class="z-nav__item"><a class="z-nav__link" href="accordions-and-tabs.html"><i class="fa fa-plus-circle"></i> Accordions &amp; Tabs</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="charts.html"><i class="fa fa-bar-chart-o"></i> Charts</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="controls.html"><i class="fa fa-arrows"></i> Controls</a></li>
                                    </div>

                                    <div class="col-sm-3 col-md-2">
                                        <li class="z-nav__item"><a class="z-nav__link" href="forms.html"><i class="fa fa-check-square-o"></i> Forms</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="icons.html"><i class="fa fa-user"></i> Icons</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="images.html"><i class="fa fa-picture-o"></i> Images</a></li>
                                    </div>

                                    <div class="col-sm-3 col-md-2">
                                        <li class="z-nav__item"><a class="z-nav__link" href="promo.html"><i class="fa fa-cube"></i> Promoboxes</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="sliders.html"><i class="fa fa-cogs"></i> Sliders</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="tables.html"><i class="fa fa-table"></i> Tables</a></li>
                                    </div>

                                    <div class="col-sm-3 col-md-2">
                                        <li class="z-nav__item"><a class="z-nav__link" href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="../site-map.html"><i class="fa fa-sitemap"></i> Sitemap</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="../404.html"><i class="fa fa-frown-o"></i> 404 error</a></li>
                                    </div>

                                    <div class="clearfix visible-sm"></div>

                                    <div class="col-sm-3 col-md-2">
                                        <li class="z-nav__item"><a class="z-nav__link" href="../comming-soon.html"><i class="fa fa-clock-o"></i> Coming soon</a></li>
                                        <li class="z-nav__item"><a class="z-nav__link" href="../login.html"><i class="fa fa-lock"></i> Login/registration</a></li>
                                    </div>

                                    <!-- <li class="z-nav__item"><a class="z-nav__link" href="#">Shortcodes</a></li> -->
                                </ul>
                                <!-- end subsidiary menu list-->
                            </li>
                        </ul>
                        <!-- end list menu item -->
                    </nav>
                    <!-- end navigation section -->
                </div> <!-- end container -->

                <!-- Colored devider -->
                <div class="devider-color"></div>

            </div> <!-- end fixed top block -->

        </div>
    </header>
    <!-- end header section -->



    <!-- Section show current page and breadcrumb -->
    <section class="page-indecator">
        <div class="container">
            <h2 class="heading">客户备案</h2>

            <!-- Breadcrumb pattern -->
            <ol class="breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li class="active">Shortcodes</li>
            </ol>

            <!-- Default one color devider -->
            <div class="devider"></div>
        </div>
    </section>
    <!-- end section show current page and breadcrumb -->

    <!-- Section with form elements -->
    <section>
        <div class="container">
            <h2 class="heading heading--start">基本信息</h2>

            <div class="row">

                <!-- Contact form -->
                <div class="col-sm-4">
                    <div class="form-wrapper">
                        <form class="contact" id="contact-form" name="contact-form" method="post" action="#" novalidate>

                            <input class="contact__field" name="companyName" type="text" placeholder="企业名称">
                            <input class="contact__field" name="clientId" type="text" placeholder="客户编码">
                            <input class="contact__field" name="organizationCode" type="text" placeholder="组织机构代码">
                            <input class="contact__field" name="licenseCode" type="text" placeholder="营业执照注册号">
                            <input class="contact__field" name="representative" type="text" placeholder="法人代表">
                            <input class="contact__field" name="postCode" type="text" placeholder="工商注册地邮编">
                            <input class="contact__field" name="industry" type="text" placeholder="所属行业">
                            <input class="contact__field" name="product" type="text" placeholder="主要产品">

                            <select class="bootstrap-select" name="enterpriseType" tabindex="0">
                                <option value="0" selected="selected">企业类型</option>
                                <option value="1" >国有企业</option>
                                <option value="2" >集体企业</option>
                                <option value="3" >国有企业改组的股份合作企业</option>
                                <option value="4" >集体企业改组的股份合作企业</option>
                            </select>

                            <select class="bootstrap-select" name="operationMode" tabindex="0">
                                <option value="0" selected="selected">经营方式</option>
                                <option value="1" >综合</option>
                                <option value="2" >收集</option>
                            </select>

                            <select class="select-box" name="operationType" tabindex="0">
                                <option value="0" selected="selected">经营单位类别</option>
                                <option value="1" >利用处置危险废物及医疗废物</option>
                                <option value="2" >只从事收集活动</option>
                                <option value="3" >只利用处置危险废物</option>
                                <option value="4" >只处置医疗废物</option>
                            </select>

                            <select class="select-box" name="contingencyPlan" tabindex="0">
                                <option value="0" selected="selected">事故防范和应急预案</option>
                                <option value="1" >综合</option>
                                <option value="2" >收集</option>
                            </select>

                            <select class="select-box" name="operationRecord" tabindex="0">
                                <option value="0" selected="selected">建立危废经营记录情况</option>
                                <option value="1" >综合</option>
                                <option value="2" >收集</option>
                            </select>
                            <input class="contact__field" name="location" type="text" placeholder="工商注册地址">
                            <input class="contact__field" name="street" type="text" placeholder="所属街道">
                            <select class="select-box" name="applicationStatus" tabindex="0">
                                <option value="0" selected="selected">申报状态</option>
                                <option value="1" >综合</option>
                                <option value="2" >收集</option>
                            </select>

                            <input class="contact__field" name="materialAttachment" type="file" placeholder="原辅材料">
                            <input class="contact__field" name="processAttachment" type="file" placeholder="工艺流程图">
                            <textarea class="contact__field contact__area" name="processDesp" placeholder="工艺描述"></textarea>

                            <input class="contact__field" name="contactName" type="text" placeholder="联系人">
                            <input class="contact__field" name="phone" type="text" placeholder="联系电话">
                            <input class="contact__field" name="mobile" type="text" placeholder="手机号">
                            <input class="contact__field" name="email" type="email" placeholder="邮箱">

                            <button class="btn btn-primary btn--decorated btn-present btn-submit" type="submit">保  存</button>
                            <button class="btn btn-info btn--decorated btn-present btn-submit" type="submit">提  交</button>
                            <button class="btn btn-warning btn--decorated btn-present btn-submit" type="button">返  回</button>
                        </form>
                    </div><!-- end wrapper -->
                </div><!-- end col -->

            </div><!-- end row -->
        </div><!-- end container -->
    </section>
    <!-- end section with form elements -->

    <!-- Default one color devider -->
    <div class="devider devider--top"></div>
    <!-- end section with alerts -->

    <!-- Colored devider -->
    <div class="devider-color bottom-space"></div>

    <!-- Footer section -->
    <footer class="footer">
        <div class="container">
            <!-- Twitter carousel -->
            <div class="swiper-container">
                <div class="swiper-wrapper" id="twitter-feed"></div>
                <!-- Slider pagination -->
                <div class="swiper-pagination"></div>
            </div>

            <div class="row">

                <!-- Latest post -->
                <div class="col-sm-4">
                    <h3 class="heading-info">Latest from blog:</h3>

                    <div class="row">
                        <div class="col-xs-6 col-sm-12 one-column">
                            <article class="post post--latest">
                                <h3 class="not-visible">Latest post</h3>
                                <a class="post__images" href="#">
                                    <img src="../images/blog/latest/1.jpg" alt="">
                                </a>
                                <p class="post__text">Mauris orci purus, ultrices dapibus justo non, eleifend consequat lorem. </p>
                                <time datetime="2014-07-17" class="post__date">July 17, 2014</time>
                            </article>
                        </div>

                        <div class="col-xs-6 col-sm-12 one-column">
                            <article class="post post--latest">
                                <h3 class="not-visible">Latest post</h3>
                                <a class="post__images" href="#">
                                    <img src="../images/blog/latest/2.jpg" alt="">
                                </a>
                                <p class="post__text">Pellentesque et magna malesuada, scelerisque elit ac, convallis lacus. </p>
                                <time datetime="2014-07-16" class="post__date">July 16, 2014</time>
                            </article>
                        </div>
                    </div>
                </div>
                <!-- end latest post -->

                <!-- Contact info about company -->
                <div class="col-sm-4">
                    <h3 class="heading-info heading-info--mobile">Contact info:</h3>
                    <!-- Contact information about company -->
                    <address class="contact-info contact-info--list">
                        <div class="row">
                            <div class="col-xs-6 col-sm-12 one-column">
									<span class="contact-info__item">
										<i class="fa fa-location-arrow"></i>
										101 West Street, New York, NY 12345
									</span>
									<span class="contact-info__item">
										<i class="fa fa-mobile"></i>
										+1-888-555-5555 / +1-888-123-3535
									</span>
                            </div>

                            <div class="col-xs-6 col-sm-12 one-column">
									<span class="contact-info__item">
										<i class="fa fa-envelope"></i>
										info@allec.com / sales@allec.com
									</span>
									<span class="contact-info__item">
										<i class="fa fa-skype"></i>
										allec-support
									</span>
                            </div>
                        </div>
                    </address>
                    <!-- end contact information -->
                </div>
                <!-- end contact info -->

                <!-- Social links -->
                <div class="col-sm-4">
                    <h3 class="heading-info heading-info--mobile">We’re social:</h3>
                    <div class="social social--default">
                        <!-- List with social icons -->
                        <ul>
                            <li class="social__item"><a class="social__link" href="https://twitter.com/OliaGozha" target="_blank"><i class="social__icon fa fa-twitter"></i></a></li>
                            <li class="social__item"><a class="social__link" href="https://www.facebook.com/olia.gozha" target="_blank"><i class="social__icon fa fa-facebook"></i></a></li>
                            <li class="social__item"><a class="social__link" href="https://plus.google.com/u/0/+OliaGozha/posts" target="_blank"><i class="social__icon fa fa-google-plus"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-pinterest"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-tumblr"></i></a></li>
                            <li class="social__item"><a class="social__link" href="http://www.linkedin.com/pub/olia-gozha/49/b91/268" target="_blank"><i class="social__icon fa fa-linkedin"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-youtube"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-github-alt"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-flickr"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-vimeo-square"></i></a></li>
                            <li class="social__item"><a class="social__link" href="http://dribbble.com/OliaGozha" target="_blank"><i class="social__icon fa fa-dribbble"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-stumbleupon"></i></a></li>
                            <li class="social__item"><a class="social__link" href="http://instagram.com/olechka_dumka#" target="_blank"><i class="social__icon fa fa-instagram"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-soundcloud"></i></a></li>
                            <li class="social__item"><a class="social__link" href="http://www.behance.net/olia_gozha" target="_blank"><i class="social__icon fa fa-behance"></i></a></li>
                            <li class="social__item"><a class="social__link" href="#" target="_blank"><i class="social__icon fa fa-vine"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- end social links -->
            </div><!-- end row -->

            <div class="copy">
                &copy; Allec, 2014. All rights reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
            </div>

        </div><!-- end container -->
    </footer>
    <!-- end footer section -->

    <div class="top-scroll"><i class="fa fa-angle-up"></i></div>

</div>

<!-- JavaScript-->
<!-- External-->
<!-- jQuery 1.10.1-->
<script src="http://ajax.useso.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../external/jquery/jquery-1.10.1.min.js"><\/script>')</script>
<!-- Bootstrap 3-->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<!-- Mobile menu -->
<script src="/home/external/z-nav/jquery.mobile.menu.js"></script>
<!-- Touch slider - Swiper -->
<script src="/home/external/swiper/idangerous.swiper.js"></script>

<!-- Twitter feed -->
<script src="/home/external/twitterfeed/twitterfeed.js"></script>
<!-- Scroll to piugin -->
<script src="/home/external/scrollto/jquery.scrollTo.min.js"></script>

<!-- Waypoints -->
<script src="/home/external/waypoint/waypoints.min.js"></script>
<!-- Select box -->
<script src="/home/external/bootstrap-select/bootstrap-select.js"></script>

<!-- Custom -->
<script src="/home/js/custom.js"></script>

<script>
    $(document).ready(function() {
        selectBox();
    });
</script>

</body>
</html>



