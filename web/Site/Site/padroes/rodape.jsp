<!-- footer -->
<br><br><br><br>
<div class="footer">
    <div class="container">
         <div class="col-md-12">
        <br><div class="col-md-6 w3agile_footer_grid">
            <h3>Sobre nós</h3>
            <p>Este site foi criado como projeto de conclusão de curso no
                <a href="http://www.ifsul.edu.br/">Instituto Federal de Educação, Ciência e Tecnologia Sul-rio-grandense </a>na cidade de Bagé no ano de 2017.</p>

        </div>
        <div class="col-md-6 w3agile_footer_grid">
            <h3>Links</h3>
            <ul>
                <li class="inline"><a href="index.jsp">Grupos       </a></li>
                <li class="inline"><a href="eventos.jsp">Eventos        </a></li>
                <li class="inline"><a href="convitesg.jsp">Convites de grupos       </a></li>
                <li class="inline"><a href="convitese.jsp">Convites de eventos      </a></li>
            </ul>
        </div>
             </div>
        <div class="agileinfo_copy_right">
            <br><div class="container">
                <div class="agileinfo_copy_right_left">
                    <br><p>© 2017 Farm. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
    </div>
<!-- //footer -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<!-- //js -->
<script src="js/jquery.vide.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: true,
            nav: false,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>

<!-- Stats-Number-Scroller-Animation-JavaScript -->
<script src="js/waypoints.min.js"></script>
<script src="js/index.js"></script>
<script src="js/counterup.min.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000,
        });
    });
</script>
<!-- //Stats-Number-Scroller-Animation-JavaScript -->

<!-- flexSlider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!-- //flexSlider -->
<!-- //load-more -->
<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>