<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home_" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MARIAC STORE</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700%7CPlayfair+Display:400italic,400,900%7COpen+Sans' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="assets/css/jquery.selectbox.css" media="screen">

    <!-- Linea Icons -->
    <link rel="stylesheet" type="text/css" href="assets/css/linea.css" media="screen">

    <!-- Elegant Icons -->
    <link rel="stylesheet" type="text/css" href="assets/css/eleganticon.css" media="screen">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" media="screen">

    <!-- RS5.0 Main Stylesheet -->
    <link rel="stylesheet" type="text/css" href="assets/css/settings.css">

    <!-- RS5.0 Layers and Navigation Styles -->
    <link rel="stylesheet" type="text/css" href="assets/css/layers.css">
    <link rel="stylesheet" type="text/css" href="assets/css/navigation.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" media="screen">

    <!-- owl carousel -->
    <link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.fancybox.css" media="screen">

    <link rel="stylesheet" type="text/css" href="assets/css/dropdown.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/global.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/homepage1.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css" media="screen">
    <link href="assets/css/skin.less" rel="stylesheet/less">
    <!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <!-- Loader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->
        <!--Page Wrapper Start-->
        <div id="wrapper">
            <!--container Start-->
            <!--Header Section Start-->
            <header class="header1" id="header">
                <div class="top-header hidden-xs">
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-xs-12">
                                <ul class="top-header-left clearfix">
                                    <li class="register-link clearfix">
                                        <i class="lock-icon icon_lock"></i><a href="login.html" class="login">Mi Cuenta</a>
                                        <span>/&nbsp;</span><a href="login.html" class="register">Registrarme</a>
                                    </li>
                                </ul>
                                <ul class="top-header-right clearfix">
                                    <li class="profile">
                                        <a href="#"><i class="icon_profile"></i>Nombre</a>
                                    </li>
                                    <li class="checkout">
                                        <a href="#"><i class=" icon_close_alt2"></i>Salir</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="middle-header">
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-xs-12 middle-header-content">
                                <div class="middle-header-left">
                                    <form class="clearfix">
                                        <input type="text" name="search" placeholder="Buscar... " />
                                        <button type="submit">
                                            <i class="icon_search"></i>
                                        </button>
                                    </form>
                                </div>
                                <%--Inicio Carrito de compras en menú--%>
                                <div class="middle-header-right clearfix">
                                    <div class="open-cart">
                                        <i class="icon_bag_alt"></i>
                                        <span class="item-count">0  &nbsp; Producto(s)<i class="arrow_carrot-down"></i></span>
                                    </div>
                                    <div class="item-block">
                                        <ul class="item-list">
                                            <li>
                                                <figure class="item-image">
                                                    <a href="#">
                                                        <img src="assets/images/img-one.jpg" alt="t-shirt" /></a>
                                                </figure>
                                                <div class="item-description">
                                                    <h4><a href="#" class="item-name">T-Shirt Retro Black</a></h4>
                                                    <span class="price">$ 40.000</span>
                                                </div>
                                                <span class="delete fa fa-trash"></span>
                                            </li>
                                            <li>
                                                <figure class="item-image">
                                                    <a href="#">
                                                        <img src="assets/images/img-two.jpg" alt="t-shirt" /></a>
                                                </figure>
                                                <div class="item-description">
                                                    <h4><a href="#" class="item-name">T-Shirt Retro Black</a></h4>
                                                    <span class="price">$ 40.000</span>
                                                </div>
                                                <span class="delete fa fa-trash"></span>
                                            </li>
                                            <li>
                                                <figure class="item-image">
                                                    <a href="#">
                                                        <img src="assets/images/img-three.jpg" alt="t-shirt" /></a>
                                                </figure>
                                                <div class="item-description">
                                                    <h4><a href="#" class="item-name">T-Shirt Retro White</a></h4>
                                                    <span class="price">$ 40.000</span>
                                                </div>
                                                <span class="delete fa fa-trash"></span>
                                            </li>
                                        </ul>
                                        <div class="total-amount clearfix">
                                            <span class="total">Total</span>
                                            <span class="amount">$ 120.000</span>
                                        </div>
                                        <div class="butn-group clearfix">
                                            <a href="carro-compras.html" class="checkout">IR A COMPRAR</a>
                                        </div>
                                    </div>
                                </div>
                                <%--Fin Carrito de compras en menú--%>
                                <a href="Home.aspx" class="logo">
                                    <img src="assets/images/img-marca-header.png" alt="MC" /></a>
                            </div>
                        </div>
                    </div>
                </div>
                <nav class="navigation">
                    <div class="container">
                        <div id="cssmenu">
                            <a href="javascript:void(0);" class="main-menu menu-image"></a>
                            <ul class="menu-links">
                                <li class="active has-sub">
                                    <a href="#">NOSOTROS</a>
                                </li>
                                <li>
                                    <a href="Hombre.aspx">HOMBRE</a>
                                    <i class="fs1 mmenu eicon visible-xs" data-icon="3"></i>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="index.html">Camisas</a>
                                        </li>
                                        <li>
                                            <a href="homepage-two.html">Polos</a>
                                        </li>
                                        <li>
                                            <a href="homepage-two.html">Camisetas</a>
                                        </li>
                                        <li>
                                            <a href="homepage-three.html">Jeans</a>
                                        </li>
                                        <li>
                                            <a href="homepage-three.html">Pantalones</a>
                                        </li>
                                        <li>
                                            <a href="homepage-three.html">Bermudas</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="Mujer.aspx">MUJER</a>
                                    <i class="fs1 mmenu eicon visible-xs" data-icon="3"></i>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="index.html">Vestidos</a>
                                        </li>
                                        <li>
                                            <a href="homepage-two.html">Jeans</a>
                                        </li>
                                        <li>
                                            <a href="homepage-two.html">Pijamas</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="nino.html">NIÑO</a>
                                    <i class="fs1 mmenu eicon visible-xs" data-icon="3"></i>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="index.html">Camisas</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="promociones.html">PROMOCIONES</a>
                                </li>
                                <li>
                                    <a href="contactanos.html">CONTACTANOS</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <!--Header Section End-->
            <div class="banner forcefullwidth_wrapper_tp_banner">
                <div class="rev_slider_wrapper">
                    <div id="slider1" class="rev_slider" data-version="5.0">
                        <ul>
                            <li data-transition="cube">
                                <!-- MAIN IMAGE -->
                                <img src="assets/images/main/fashion3.jpg" alt="" width="1920" height="1280">
                                <div class="banner-content">
                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme title" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-50" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1000" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        DESIGN &amp; FASHION
                                    </div>
                                    <div class="tp-caption NotGeneric-Title tp-resizeme banner-text" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1500" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        Transformer theme is an elegant, powerful and fully responsive prestashop theme with modern design. Suitable for every type of store.
                                    </div>
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme banner-btn" data-x="center" data-hoffset="-100px" data-y="center" data-voffset="150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1900" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        <a href="#">View Collection</a>
                                    </div>
                                </div>
                            </li>

                            <li data-transition="cube">
                                <!-- MAIN IMAGE -->
                                <img src="assets/images/main/fashion.jpg" alt="" width="1920" height="1280">
                                <div class="banner-content">
                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme title" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-50" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1000" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        DESIGN &amp; FASHION
                                    </div>
                                    <div class="tp-caption NotGeneric-Title tp-resizeme banner-text" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1500" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        Transformer theme is an elegant, powerful and fully responsive prestashop theme with modern design. Suitable for every type of store.
                                    </div>
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme banner-btn" data-x="center" data-hoffset="-100px" data-y="center" data-voffset="150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1900" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        <a href="#">View Collection</a>
                                    </div>
                                </div>
                            </li>
                            <li data-transition="cube">
                                <!-- MAIN IMAGE -->
                                <img src="assets/images/main/fashion4.jpg" alt="" width="1920" height="1280">
                                <div class="banner-content">
                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme title" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-50" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1000" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        DESIGN &amp; FASHION
                                    </div>
                                    <div class="tp-caption NotGeneric-Title tp-resizeme banner-text" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1500" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        Transformer theme is an elegant, powerful and fully responsive prestashop theme with modern design. Suitable for every type of store.
                                    </div>
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme banner-btn" data-x="center" data-hoffset="-100px" data-y="center" data-voffset="150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1900" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        <a href="#">View Collection</a>
                                    </div>
                                </div>
                            </li>
                            <li data-transition="cube">
                                <!-- MAIN IMAGE -->
                                <img src="assets/images/main/fashion2.jpg" alt="" width="1920" height="1280">
                                <div class="banner-content">
                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme title" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-50" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1000" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        DESIGN &amp; FASHION
                                    </div>
                                    <div class="tp-caption NotGeneric-Title tp-resizeme banner-text" data-x="left" data-hoffset="-100px" data-y="center" data-voffset="-150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1500" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        Transformer theme is an elegant, powerful and fully responsive prestashop theme with modern design. Suitable for every type of store.
                                    </div>
                                    <div class="tp-caption NotGeneric-Title   tp-resizeme banner-btn" data-x="center" data-hoffset="-100px" data-y="center" data-voffset="150" data-width="['auto','auto','auto','auto']"
                                        data-height="['auto','auto','auto','auto']"
                                        data-transform_idle="o:1;"
                                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power3.easeInOut;" data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                        data-start="1900" data-splitin="none"
                                        data-splitout="none"
                                        data-responsive_offset="on">
                                        <a href="#">View Collection</a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <!-- END REVOLUTION SLIDER -->
                </div>
            </div>
            <!--Content Area Start-->
            <div class="content">
                <div class="information-block container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="info-item">
                                <a href="#"><i class="icon-line" data-icon=">"></i><strong>ENVÍOS A TODO EL PAÍS</strong> <span class="information">Guaranteed Delivery In 7 Days</span></a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="info-item">
                                <a href="#"><i class="icon icon-basic-life-buoy"></i><strong>24/24 SUPPORT SERVICES</strong> <span class="information">Call Hotline 1900-888999</span></a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="info-item">
                                <a href="#"><i class="icon icon-basic-anticlockwise"></i><strong>HORARIO DE ATENCIÓN</strong> <span class="information">Send Within 30 Days</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="new-product container">
                    <div class="row">
                        <div class="block-heading">
                            <h2>EXCELENTES PRENDAS</h2>
                            <span class="border-image">
                                <img src="assets/svg/shape.svg" alt="image" class="svg" />
                            </span>
                        </div>
                        <div class="product-section">
                            <%--Inicio Producto 1--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct1" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom1" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct1" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct1" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice1" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 1--%>
                            <%--Inicio Producto 2--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct2" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom2" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct2" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct2" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice2" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 2--%>
                            <%--Inicio Producto 3--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct3" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom3" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct3" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct3" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice3" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 3--%>
                            <%--Inicio Producto 4--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct4" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom4" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct4" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct4" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice4" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 4--%>
                            <%--Inicio Producto 5--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct5" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom5" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct5" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct5" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice5" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 5--%>
                            <%--Inicio Producto 6--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct6" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom6" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct6" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct6" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice6" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 6--%>
                            <%--Inicio Producto 7--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct7" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom7" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct7" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct7" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice7" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 7--%>
                            <%--Inicio Producto 8--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgProduct8" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlProductZoom8" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyProduct8" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlProduct8" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPrice8" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Producto 8--%>
                        </div>
                    </div>
                </div>
                <div class="parallax testimonial-section">
                    <div class="container">
                        <div id="owl-demo" class="owl-carousel owl-theme">
                            <div class="item">
                                <div class="testimonial-block">
                                    <figure class="author-image">
                                        <img src="assets/images/round-image.png" alt="image" />
                                    </figure>
                                    <blockquote class="author-text">
                                        <p>
                                            Mil y mil gracias super la atención q le brindan al cliente... Totalmente feliz por hacer llegar mi regalo hasta la puerta de la casa.
                                        </p>
                                        <span class="author-name">Maria Jose Lorduy</span>
                                    </blockquote>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-block">
                                    <figure class="author-image">
                                        <img src="assets/images/round-image.png" alt="image" />
                                    </figure>
                                    <blockquote class="author-text">
                                        <p>
                                            Súper, llego rápido, en muy buen estado, tal cual en la foto, bonito y muy económico.
                                        </p>
                                        <span class="author-name">Yinneth Pacheco Navarro</span>
                                    </blockquote>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-block">
                                    <figure class="author-image">
                                        <img src="assets/images/round-image.png" alt="image" />
                                    </figure>
                                    <blockquote class="author-text">
                                        <p>
                                            Excelente atención, muy buenos precios, totalmente recomendable. Gracias
                                        </p>
                                        <span class="author-name">Danny Abaunza</span>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="subscribe-section container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="subscribe-content">
                                <span class="ticking-time">NEWSLETTER</span>
                                <strong class="subscribe-heading">SUSCRIBETE</strong>
                                <span class="subsribe-offer">Recibe Descuentos y Ofertas en tu Email</span>
                            </div>
                            <form class="subscribe-form clearfix">
                                <input type="text" name="email" placeholder="Tú Correo Electrónico" />
                                <button type="submit">
                                    Suscribirme
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--Content Area End-->
            <!--Footer Section Start-->
            <footer class="footer">
                <div class="primary-footer">
                    <div class="container">
                        <div class="row">
                            <div class="footer-content col-md-3 col-sm-3 col-xs-12">
                                <div class="footer-border">
                                    <h4>TIENDA ONLINE </h4>
                                    <ul class="footer-nav">
                                        <li>
                                            <a href="hombre.html">HOMBRE</a>
                                        </li>
                                        <li>
                                            <a href="mujer.html">MUJER</a>
                                        </li>
                                        <li>
                                            <a href="nino.html">NIÑO</a>
                                        </li>
                                        <li>
                                            <a href="promociones.html">PROMOCIONES</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer-content col-md-3 col-sm-3 col-xs-12">
                                <div class="footer-border">
                                    <h4>FORMAS DE PAGO</h4>
                                    <ul class="footer-nav">
                                        <li>
                                            <a href="#">EFECTY</a>
                                        </li>
                                        <li>
                                            <a href="#">BANCOLOMBIA</a>
                                        </li>
                                        <li>
                                            <a href="#">PUNTOS VIA BOLOTO</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer-content col-md-3 col-sm-3 col-xs-12">
                                <div class="footer-border">
                                    <h4>SIGUENOS EN</h4>
                                    <ul class="footer-nav footer-nav-social-media">
                                        <li>
                                            <a href="https://www.facebook.com/mariac.store.co" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                                            <a href="https://www.facebook.com/mariac.store.co" target="_blank"><i class="fa fa-instagram fa-2x"></i></a>
                                            <a href="https://www.facebook.com/mariac.store.co" target="_blank"><i class="fa fa-pinterest-square fa-2x"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer-content col-md-3 col-sm-3 col-xs-12">
                                <div class="footer-border">
                                    <h4>MEDIOS DE CONTACTO</h4>
                                    <div class="info-block">
                                        <address class="address-info">
                                            CALLE 25 # 03w-60  
											<br />
                                            Barrio VillaNueva
											<br />
                                            Montería, Córdoba
											<br />
                                            COLOMBIA
                                        </address>
                                        <span class="call-info"><a href="callto:3013979464">(57) 301 3979464</a></span>
                                        <span class="mail-info"><a href="mailto:mariac.store@gmail.com">mariac.store@gmail.com</a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="secondary-footer">
                    <span class="copy-right">MARIAC STORE © 2018. Todos los derechos reservados.</span>
                </div>
            </footer>
            <!--Footer Section End-->
            <!--container End-->
        </div>
        <!--Page Wrapper End-->
        <script type="text/javascript" src="assets/js/jquery-1.12.0.min.js"></script>
        <script src="assets/js/less.js"></script>
        <script type="text/javascript" src="assets/js/jquery.selectbox-0.2.js"></script>
        <script type="text/javascript" src="assets/js/jquery.fancybox.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.js"></script>
        <script type="text/javascript" src="assets/js/owl.carousel.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
        <script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
        <!-- RS5.0 Core JS Files -->

        <script type="text/javascript" src="assets/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.revolution.js"></script>

        <script type="text/javascript" src="assets/js/site.js"></script>

        <script type="text/javascript" src="assets/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="assets/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="assets/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="assets/extensions/revolution.extension.navigation.min.js"></script>
    </form>
</body>
</html>
