﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MARIAC STORE</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700%7CPlayfair+Display:400italic,400,900%7COpen+Sans%7CCrimson+Text:400italic%7CLato:400,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="assets/css/jquery.selectbox.css" media="screen">

    <!-- Linea Icons -->
    <link rel="stylesheet" type="text/css" href="assets/css/linea.css" media="screen">

    <!-- Elegant Icons -->
    <link rel="stylesheet" type="text/css" href="assets/css/eleganticon.css" media="screen">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" media="screen">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.fancybox.css" media="screen">

    <link rel="stylesheet" type="text/css" href="assets/css/dropdown.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/global.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" media="screen">
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
                                            <a ID="btnGoToShopping" runat="server" href="/CarritoCompras.aspx" class="checkout">IR A COMPRAR</a>
                                        </div>
                                    </div>
                                </div>
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
            <div class="common-banner product-page-banner forcefullwidth_wrapper_tp_banner">
                <div class="container">
                    <div class="row">
                        <div class="main-banner-text">
                            <span>CONFIGURABLE PRODUCT</span>
                            <ul class="banner-nav">
                                <li>
                                    <a href="Home.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="shopping-cart.html">Shop</a>
                                </li>
                                <li>
                                    <a href="#">Configurable Product</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--Content Area Start-->
            <a id="main">&nbsp;&nbsp;&nbsp;</a>
            <div class="content">
                <div class="deatail-block container">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="product-slider-sec clearfix">
                                <div class=" large-slide">
                                    <img runat="server" id="imgProductMain" src="assets/images/product-img1.jpg" alt="image" />
                                </div>
                                <div class="slideshow vertical small-slide" data-cycle-fx="carousel" data-cycle-timeout="0" data-cycle-next="#next3" data-cycle-prev="#prev3" data-cycle-carousel-visible="4" data-cycle-carousel-vertical="true">
                                    <img class="item-slide" runat="server" id="imgProduct1" src="assets/images/product-img2.jpg" alt="image" />
                                    <img class="item-slide" runat="server" id="imgProduct2" src="assets/images/product-img3.jpg" alt="image" />
                                    <img class="item-slide" runat="server" id="imgProduct3" src="assets/images/product-img4.jpg" alt="image" />
                                    <img class="item-slide" runat="server" id="imgProduct4" src="assets/images/product-img6.jpg" alt="image" />
                                </div>
                                <button id="prev3">
                                    <i class="eicon fs1" data-icon="3"></i>
                                </button>
                                <button id="next3">
                                    <i class="eicon fs1" data-icon="2"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="product-detail">
                                <h3 runat="server" id="lblProductName">Shirt Jean Retro Blue </h3>
                                <span class="product-price" runat="server" id="lblProductPrice">$40.000</span>
                                <div class="available-item">
                                    <span class="available-stock"><span class="available">Disponible:</span> <strong class="stock">SI</strong></span>
                                </div>
                            </div>
                            <div class="product-text">
                                <p runat="server" id="lblProductDescrition">
                                    A t-shirt that comes in three colors (red, white and blue) and three sizes (small, medium, large) is a configurable product. A configurable product is made up of other simple products. you can create a configurable product that ties them all together, and gives the end user the choice, usually from a drop-down menu.
                                </p>
                            </div>
                            <form class="product-form">
                                <ul class="form-links">
                                    <li class="clearfix">
                                        <label>COLOR</label>
                                        <label runat="server" id="lblColors">BLANCO</label>
                                    </li>
                                    <li class="clearfix">
                                        <label>TALLA<i class="mendatory">*</i></label>
                                        <div class="select-option">
                                            <asp:DropDownList runat="server" ID="ddlProductSizes" CssClass="select">
                                            </asp:DropDownList>
                                            <i class="fa fa-angle-down"></i>
                                        </div>
                                    </li>
                                </ul>
                            </form>
                            <div class="cart-options clearfix">
                                <asp:Button ID="btnBuyProduct" runat="server" CssClass="btn add-cart" OnClick="btnBuyProduct_Click" Text="AGREGAR AL CARRITO"/>
                                <%--<a href="#" class="btn add-cart">COMPRAR</a>--%>
                                <div class="product-view clearfix">                                    
                                    <a runat="server" id="hlProductZoom" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="new-product container">
                    <div class="row">
                        <div class="block-heading">
                            <h2>OTROS PRODUCTOS</h2>
                            <span class="border-image">
                                <img src="assets/svg/shape.svg" alt="image" class="svg" />
                            </span>
                        </div>
                        <div class="product-section">
                            <%--Inicio Otros Productos 1--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgOtherProduct1" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">                                                
                                                <a runat="server" id="hlOtherProductZoom1" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyOtherProduct1" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlOtherProduct1" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPriceOtherProduct1" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Otros Productos 1--%>
                            <%--Inicio Otros Productos 2--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgOtherProduct2" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlOtherProductZoom2" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyOtherProduct2" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>                                    
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlOtherProduct2" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPriceOtherProduct2" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Otros Productos 2--%>
                            <%--Inicio Otros Productos 3--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgOtherProduct3" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlOtherProductZoom3" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyOtherProduct3" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlOtherProduct3" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPriceOtherProduct3" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Otros Productos 3--%>
                            <%--Inicio Otros Productos 4--%>
                            <div class="col-md-3 col-sm-3 col-xs-12 product-description">
                                <figure class="product-image">
                                    <img runat="server" id="imgOtherProduct4" src="assets/images/img-six.png" alt="product" />
                                    <div class="overlay">
                                        <div class="product-view-block">
                                            <div class="product-view clearfix">
                                                <a runat="server" id="hlOtherProductZoom4" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                            </div>
                                            <a runat="server" id="hlBuyOtherProduct4" href="#" class="btn add-cart">COMPRAR</a>
                                        </div>
                                    </div>                                    
                                </figure>
                                <div class="about-product">
                                    <h4><a runat="server" id="hlOtherProduct4" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                    <span class="price">
                                        <asp:Label ID="lblPriceOtherProduct4" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <%--Fin Otros Productos 4--%>
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
        <script type="text/javascript" src="assets/js/jquery.cycle2.js"></script>
        <script type="text/javascript" src="assets/js/jquery.cycle2.carousel.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.js"></script>

        <script type="text/javascript" src="assets/js/site.js"></script>

        <script>
            $.fn.cycle.defaults.autoSelector = '.slideshow';
        </script>

        <script>
            var x;
            x = $(document); // Se genera una nueva copia del objeto document.
            x.ready(inicializar); // Cuando el documento este preparado en tal caso ejecutara la función inicializar.

            function inicializar() { // Se especifica el código que tiene la función inicializar.
                var x;
                x = $(".item-slide"); // Hacemos que "x" se refiera a aquellos elementos que tienen como id "hola". 
                x.click(clickHecho); // Se especifica la función que se ejecutara cuando haya hecho click sobre el elemento que tenga como id "#hola".  
            }

            function clickHecho() {
                var $input = $(this);
                $ruta = $input.attr("src");
                $('#imgProductMain').attr('src', $ruta);
            }
        </script>

        <script>
            $(document).ready(function () {
                // The slider being synced must be initialized first
                $('.slideshow img').on('click', function () {
                    var banner_slide = $(this).attr('datasrc');
                    //alert(banner_slide)
                    $('.large-slide img').attr('src', banner_slide);
                })
                $(".select").selectbox();
            });
        </script>
    </form>
</body>
</html>
