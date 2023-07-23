<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favourite.aspx.cs" Inherits="Cafe_Barcode.Favourite" %>

<%@ Import Namespace="Cafe_Barcode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Tasty bites | Favourites</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet" />

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />

    <%-- menu style --%>
    <%--<link rel="stylesheet" type="text/css" href="css/menucss/bootstrap.css" />--%>

    <!--owl slider stylesheet -->
    <%-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />--%>
    <!-- nice select  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
    <!-- font awesome style -->
    <%-- <link href="css/menucss/font-awesome.min.css" rel="stylesheet" />--%>

    <!-- Custom styles for this template -->
    <link href="css/menucss/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/menucss/responsive.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-absolute p-0" id="hero">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Tasty Bites</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <style>
                    .nav-item .nav-link:focus {
                        color: black;
                    }

                    #hero {
                        background-color: black;
                    }

                    .navbar {
                        background-color: black;
                    }

                    .navbar-nav {
                        background-color: #0F172B;
                    }

                    .container-xxl {
                        background-color: #0F172B;
                    }
                </style>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="index.aspx#hero" class="nav-item nav-link ">Home</a>
                        <a href="index.aspx#service" class="nav-item nav-link">Service</a>
                        <a href="index.aspx#about" class="nav-item nav-link">About</a>
                        <a href="index.aspx#menu" class="nav-item nav-link">Menu</a>
                        <a href="#favourite" class="nav-item nav-link active"><i class="bi bi-heart"></i>Favourite</a>
                        <a href="index.aspx#footer" class="nav-item nav-link" style="margin-right: 10px">Contact</a>

                        <asp:Button class="nav-item nav-link" ID="btnLogout" runat="server" CssClass="btn btn-primary" OnClick="btnLogout_Click" Text=" LOGOUT " />

                        <%-- script to activate clicked nav link --%>
                        <script>
                            $(document).ready(function () {
                                $('.nav-link').click(function () {
                                    $('.nav-link').removeClass('active');
                                    $(this).addClass('active');
                                });
                            });
                        </script>

                    </div>
                </div>
            </nav>
        </div>

        <section class="food_section layout_padding-bottom">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2 style="margin-top: 20px;">Our Menu
                    </h2>
                </div>

                <ul class="filters_menu">
                </ul>
                <div class="filters-content">
                    <div class="row grid">

                        <asp:Repeater ID="rProducts" runat="server" OnItemCommand="rProducts_ItemCommand">
                            <ItemTemplate>
                                <div class="col-sm-6 col-lg-4">
                                    <div class="box">
                                        <div>
                                            <div class="img-box" style="background-color: #FFF1BC;">
                                                <img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                            </div>
                                            <div class="detail-box" style="background-color: #A4D0A4;">
                                                <h5><%# Eval("Name") %></h5>
                                                <p><%# Eval("Description") %></p>
                                                <div class="options">
                                                    <h6><%# Eval("Price") %></h6>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="delete" CssClass="badge bg-danger"
                                                        CommandArguement='<%#Eval("ProductId") %>' CommandName="delete" OnClientClick="return confirm('Delete from favourite?');">
                                                        <asp:HiddenField ID="hdnProdId" runat="server" Value='<%#Eval("ProductId") %>' />
                                                        <i class="ti-trash"></i>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
                <div class="btn-box">
                </div>
            </div>
        </section>

    </form>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="js/main.js"></script>
    <%-- menu js --%>
    <!-- jQery -->
    <%--<script src="css/menujs/jquery-3.4.1.min.js"></script>--%>
    <!-- popper js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>
    <!-- bootstrap js -->
    <script src="css/menujs/bootstrap.js"></script>
    <!-- owl slider -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
    </script>
    <!-- isotope js -->
    <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
    <!-- nice select -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <!-- custom js -->
    <%--<script src="css/menujs/custom.js"></script>--%>

    <script>

        // isotope js
        $(window).on('load', function () {
            $('.filters_menu li').click(function () {
                $('.filters_menu li').removeClass('active');
                $(this).addClass('active');

                var data = $(this).attr('data-filter');
                $grid.isotope({
                    filter: data
                })
            });

            var $grid = $(".grid").isotope({
                itemSelector: ".all",
                percentPosition: false,
                masonry: {
                    columnWidth: ".all"
                }
            })
        });

        // nice select
        $(document).ready(function () {
            $('select').niceSelect();
        });



    </script>

</body>
</html>
