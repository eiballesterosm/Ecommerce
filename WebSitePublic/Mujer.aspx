﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mujer.aspx.cs" Inherits="Mujer" %>

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
    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css" media="screen">

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
        <div id="wrapper" class="categories">
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
                                            <a href="carro-compras.html" class="checkout">IR A COMPRAR</a>
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
            <div class="common-banner forcefullwidth_wrapper_tp_banner">
                <div class="container">
                    <div class="row">
                        <div class="main-banner-text">
                            <span>shop grid with left sidebar</span>
                            <ul class="banner-nav">
                                <li>
                                    <a href="Home.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="shopping-cart.html">Shop</a>
                                </li>
                                <li class="active">
                                    <a href="#">Shop Grid with Left Sidebar</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--Content Area Start-->
            <a id="main">&nbsp;&nbsp;&nbsp;</a>
            <div class="content">
                <!-- Categories Shop Starts Here -->
                <div class="categories-shop">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 hidden-sm">
                                <div class="filter-btn">
                                    <a href="#">FILTRAR POR</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 mobile-view">
                                <div class="categories-filtering">
                                    <div class="categories-list">
                                        <h3 class="heading">ROPA MUJER</h3>
                                        <ul runat="server" class="main-list" id="ulProductTypesMan">
                                        </ul>
                                    </div>
                                    <div class="filter-list">
                                        <h3 class="heading">Filtrar Por:</h3>
                                        <div class="select-range">
                                            <p>
                                                <label for="amount">PRECIO</label>
                                                <input type="text" id="amount" readonly style="border: 0; color: #f6931f; font-weight: bold;">
                                            </p>
                                            <div id="slider-meter" class="slider-meter"></div>
                                            <div class="range-price">
                                                <span>Range: <span id="amount2" class="first-price">$0.00</span> - <span id="amount1" class="second-price">$300.000</span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="color-selection">
                                        <h4>color</h4>
                                        <ul class="clearfix">
                                            <li class="active">
                                                <a href="#" class="black"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="white"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="blue"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="pink"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="purple"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="green"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="red"></a>
                                            </li>
                                            <li>
                                                <a href="#" class="yellow"></a>
                                            </li>
                                        </ul>
                                        </ul>
                                    </div>
                                    <div class="size-selection">
                                        <h4>TALLA</h4>
                                        <ul class="clearfix">
                                            <li>
                                                <a href="#" class="active">06</a>
                                            </li>
                                            <li>
                                                <a href="#">08</a>
                                            </li>
                                            <li>
                                                <a href="#">10</a>
                                            </li>
                                            <li>
                                                <a href="#">12</a>
                                            </li>
                                            <li>
                                                <a href="#">14</a>
                                            </li>
                                            <li>
                                                <a href="#">16</a>
                                            </li>
                                        </ul>
                                        <ul class="clearfix">
                                            <li>
                                                <a href="#">s</a>
                                            </li>
                                            <li>
                                                <a href="#">m</a>
                                            </li>
                                            <li>
                                                <a href="#">l</a>
                                            </li>
                                            <li>
                                                <a href="#">xl</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-9">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <ul class="categories-section">
                                            <li>
                                                <%--TODO--%>
                                                <%--<span>Mostrando 1 de 16 <small>páginas</small></span>--%>
                                            </li>
                                            <li class="select-name">
                                                <span>ORDENAR POR <em>:</em></span>
                                                <asp:DropDownList runat="server" ID="ddOrderBy" CssClass="select" AutoPostBack="true" OnSelectedIndexChanged="ddOrderBy_SelectedIndexChanged">
                                                    <asp:ListItem Text="NOMBRE (A -Z)" Value="0" />
                                                    <asp:ListItem Text="NOMBRE (Z -A)" Value="1" />
                                                    <asp:ListItem Text="MENOR PRECIO" Value="2" />
                                                    <asp:ListItem Text="MAYOR PRECIO" Value="3" />
                                                </asp:DropDownList>
                                                <%--<select class="select">
                                                    <option value="1">NOMBRE (A -Z)</option>
                                                    <option value="2">NOMBRE (Z -A)</option>
                                                    <option value="3">MENOR PRECIO</option>
                                                    <option value="4">MAYOR PRECIO</option>
                                                </select>--%>
                                            </li>
                                        </ul>
                                    </div>

                                    <%--Inicio Productos--%>
                                    <div id="pnlProducts" runat="server">
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct1" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct2" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct3" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct4" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct5" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct6" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct7" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct8" src="assets/images/product-img1.jpg" alt="image" />
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
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="product-display product-description">
                                                <figure class="product-image">
                                                    <img runat="server" id="imgProduct9" src="assets/images/product-img1.jpg" alt="image" />
                                                    <div class="overlay">
                                                        <div class="product-view-block">
                                                            <div class="product-view clearfix">
                                                                <a runat="server" id="hlProductZoom9" href="assets/images/img-six.png" class="zoom icon_zoom-in_alt single_image"></a>
                                                            </div>
                                                            <a runat="server" id="hlBuyProduct9" href="#" class="btn add-cart">COMPRAR</a>
                                                        </div>
                                                    </div>
                                                </figure>
                                                <div class="about-product">
                                                    <h4><a runat="server" id="hlProduct9" href="producto.html" class="item-name">T-Shirt Retro White</a></h4>
                                                    <span class="price">
                                                        <asp:Label ID="lblPrice9" runat="server"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--Fin Productos--%>

                                    <%--TODO--%>
                                    <%--                                    <div class="col-xs-12">
                                        <div class="categories-shop-pagging">
                                            <ul>
                                                <li class="active">
                                                    <a href="javascript:void(0)">1</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)">2</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)">3</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)">...</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)">5</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)"><i class="fa fa-angle-right"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Categories Shop Ends Here -->
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
        <script type="text/javascript" src="assets/js/jquery-ui.js"></script>

        <script type="text/javascript" src="assets/js/site.js"></script>
        <script type="text/javascript" src="assets/js/touch-enable.js"></script>
    </form>
</body>
</html>
