<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Cafe_Barcode.WebForm5" EnableEventValidation="false" %>

<%@ Import Namespace="Cafe_Barcode" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Tasty bites</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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
    <%-- script for scrolling to the section from another page --%>
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const url = window.location.href;
            if (url.indexOf('#') !== -1) {
                const sectionId = url.substring(url.indexOf('#') + 1);
                const section = document.getElementById(sectionId);
                if (section) {
                    section.scrollIntoView();
                }
            }
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Navbar & Hero Start -->
            <div class="container-xxl position-relative p-0" id="hero">
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

                        .transparent-button {
                            background-color: transparent;
                            border-color: transparent;
                            /* Add any additional styling if needed */
                        }

                        #fav {
                            background-color: transparent;
                            border-color: transparent;
                            font-size: 15px;
                            color: white;
                            font-weight:bold;
                        }
                        #fav:hover{
                            color:#ffbe33;
                        }
                        .bi bi-heart :hover{

                            background-color:white;
                        }
                    </style>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0 pe-4">
                            <a href="#hero" class="nav-item nav-link active">Home</a>
                            <a href="#service" class="nav-item nav-link">Service</a>
                            <a href="#about" class="nav-item nav-link">About</a>
                            <a href="#menu" class="nav-item nav-link">Menu</a>
                            <a href="#favourite" class="nav-item nav-link"> 
                                <asp:Button  ID="fav" runat="server" OnClick="fav_Click" Text="FAVOURITE" CssClass="link-primary" /></a>
                            <%--<asp:LinkButton ID="fav2" runat="server" OnClick="fav2_Click"><i class="bi bi-heart"></i></asp:LinkButton>--%>
                            <%--<a href="Favourite.aspx" class="nav-item nav-link"><i class="bi bi-heart"></i>Favourite</a>--%>
                            <a href="#footer" class="nav-item nav-link" style="margin-right: 10px">Contact</a>

                            <asp:Button class="nav-item nav-link" ID="btnLogout" runat="server" CssClass="btn btn-primary" OnClick="Unnamed_Click" Text=" LOGOUT " />
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

                <div class="container-xxl py-5 bg-dark hero-header mb-5">
                    <div class="container my-5 py-5">
                        <div class="row align-items-center g-5">
                            <div class="col-lg-6 text-center text-lg-start">
                                <h1 class="display-3 text-white animated slideInLeft">Enjoy Our<br>
                                    Delicious Meal</h1>
                                <p class="text-white animated slideInLeft mb-4 pb-2">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                                <%--<a href="" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book A Table</a>--%>
                            </div>
                            <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                                <img class="img-fluid" src="img/hero.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Navbar & Hero End -->

            <!-- Service Start -->

            <div class="container-xxl py-5" id="service">
                <div class="container">
                    <div class="row g-4">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Our Services</h5>
                        <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-primary me-2"></i>Tasty Bites</h1>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                                    <h5>Master Chefs</h5>
                                    <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
                                    <h5>Quality Food</h5>
                                    <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                                    <h5>24/7 Service</h5>
                                    <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Service End -->


            <!-- About Start -->
            <div class="container-xxl py-5" id="about">
                <div class="container">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-6">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="img/about-1.jpg">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.jpg" style="margin-top: 25%;">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.jpg">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h5 class="section-title ff-secondary text-start text-primary fw-normal">About Us</h5>
                           
                            <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos erat ipsum et lorem et sit, sed stet lorem sit.</p>
                            <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                            <div class="row g-4 mb-4">
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                        <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">15</h1>
                                        <div class="ps-4">
                                            <p class="mb-0">Years of</p>
                                            <h6 class="text-uppercase mb-0">Experience</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                        <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">50</h1>
                                        <div class="ps-4">
                                            <p class="mb-0">Popular</p>
                                            <h6 class="text-uppercase mb-0">Master Chefs</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About End -->


            <!-- food section -->

            <section class="food_section layout_padding" id="menu">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>Our Menu
                        </h2>
                    </div>

                    <ul class="filters_menu">
                        <li class="active" data-filter="*">All</li>
                        <asp:Repeater ID="rCategory" runat="server">
                            <ItemTemplate>
                                <li data-filter=".<%# Regex.Replace(Eval("Name").ToString().ToLower(),@"\s+","") %>"><%# Eval("Name") %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                    <div class="filters-content">
                        <div class="row grid">
                            <asp:Repeater ID="rProducts" runat="server" OnItemCommand="rProducts_ItemCommand">
                                <ItemTemplate>
                                    <div class="col-sm-6 col-lg-4  all <%# Regex.Replace(Eval("CategoryName").ToString().ToLower(),@"\s+","") %>">
                                        <div class="box" >
                                            <div>
                                                <div class="img-box"style="background-color:#f4f719;">
                                                    <img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                                </div>
                                                <div class="detail-box" style="background-color:#FF5B00;">
                                                    <h5 style="color:white;"><%# Eval("Name") %></h5>
                                                    <p style="color:white;"><%# Eval("Description") %></p>
                                                    <div class="options">
                                                        <h6 style="color:white;"><%# Eval("Price") %>৳</h6>
                                                        <asp:LinkButton runat="server" ID="lblAddToFav" CommandName="addToFav"
                                                            CommandArgument='<%# Eval("ProductId") %>'>
                                                            <asp:HiddenField ID="hdnProdId" Value='<%#Eval("ProductId")%>' runat="server" />
                                                            
                                                            <i class="bi bi-heart" href="#menu" style="color: black;"></i>
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
                   
                </div>
            </section>


            <!-- Team Start -->
            <div class="container-xxl pt-5 pb-3">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Team Members</h5>
                        <h1 class="mb-5">Our Master Chefs</h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="team-item text-center rounded overflow-hidden">
                                <div class="rounded-circle overflow-hidden m-4">
                                    <img class="img-fluid" src="img/team-1.jpg" alt="">
                                </div>
                                <h5 class="mb-0">Full Name</h5>
                                <small>Designation</small>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="team-item text-center rounded overflow-hidden">
                                <div class="rounded-circle overflow-hidden m-4">
                                    <img class="img-fluid" src="img/team-2.jpg" alt="">
                                </div>
                                <h5 class="mb-0">Full Name</h5>
                                <small>Designation</small>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="team-item text-center rounded overflow-hidden">
                                <div class="rounded-circle overflow-hidden m-4">
                                    <img class="img-fluid" src="img/team-3.jpg" alt="">
                                </div>
                                <h5 class="mb-0">Full Name</h5>
                                <small>Designation</small>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                            <div class="team-item text-center rounded overflow-hidden">
                                <div class="rounded-circle overflow-hidden m-4">
                                    <img class="img-fluid" src="img/team-4.jpg" alt="">
                                </div>
                                <h5 class="mb-0">Full Name</h5>
                                <small>Designation</small>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Team End -->


            <!-- Testimonial Start -->
            <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="text-center">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
                        <h1 class="mb-5">Our Clients Say!!!</h1>
                    </div>
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-1.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Client Name</h5>
                                    <small>Profession</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-2.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Client Name</h5>
                                    <small>Profession</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-3.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Client Name</h5>
                                    <small>Profession</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-4.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Client Name</h5>
                                    <small>Profession</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Testimonial End -->

            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" id="footer" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                            <a class="btn btn-link" href="#about">About Us</a>
                            <a class="btn btn-link" href="#contact">Contact Us</a>
                            <a class="btn btn-link" href="#">Privacy Policy</a>
                            <a class="btn btn-link" href="#">Terms & Condition</a>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>mirpur-12,Dhaka</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+880-1609195010</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>nasimhridoy695@gmail.com</p>
                            <div class="d-flex pt-2">
                                <a class="btn btn-outline-light btn-social" href="https://www.twitter.com/"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                            <h5 class="text-light fw-normal">Monday - Saturday</h5>
                            <p>09AM - 09PM</p>
                            <h5 class="text-light fw-normal">Sunday</h5>
                            <p>10AM - 08PM</p>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                            <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                            <div class="position-relative mx-auto" style="max-width: 400px;">
                                <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email"/>
                                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="copyright">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                &copy; <a class="border-bottom" href="#home">Tasty Bites</a>, All Right Reserved. 
							
							
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

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
