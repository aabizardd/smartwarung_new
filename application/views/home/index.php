    <!-- ::::::  Start  Main Container Section  ::::::  -->
    <main id="main-container" class="main-container m-t-30">
        <div class="container">
            <div class="row flex-column-reverse flex-lg-row">
                <div class="col-lg-3 col-xl-3">
                    <!-- menu content -->
                    <div class="header-menu-vertical d-lg-block d-none">
                        <h4 class="menu-title link--icon-left"><i class="far fa-align-left"></i> Kategori</h4>
                        <ul class="menu-content">
                            <li class="menu-item"><a href="<?php echo site_url('category') ?>">Semua Kategori</a></li>
                            <?php $categories = $this->categories->get_all();
foreach ($categories as $category): ?>
                            <li class="menu-item"><a
                                    href="<?php echo site_url('category/show/') . $category['id'] ?>"><?php echo $category['name'] ?></a>
                            </li>
                            <?php endforeach;?>
                        </ul>

                    </div>

                    <!-- ::::::  Start  Product Style - Segment Section  ::::::  -->
                    <div class="product product--1">
                        <div class="row">
                            <!-- Start Single Segment Area -->
                            <div class="col-12">
                                <div class="swiper-outside-arrow-hover">
                                    <div class="section-content section-content--border">
                                        <h5 class="section-content__title">Produk Pilihan</h5>
                                    </div>

                                    <div class="swiper-outside-arrow-fix pos-relative">
                                        <div class="product-segment-slider-2 overflow-hidden  m-t-50">
                                            <div class="swiper-wrapper">
                                                <!-- Start Single Segment Product -->
                                                <?php for ($i = 0; $i < count($items); $i++): ?>
                                                <div class="product__box product__box--segment  swiper-slide">
                                                    <div class="row">
                                                        <div class="col-xl-5 col-lg-12">
                                                            <div class="product__img-box">
                                                                <a href="<?php echo site_url('item/show/') . $items[$i]['id'] ?>"
                                                                    class="product__img--link">
                                                                    <img class="product__img" src="<?php $photos = explode(',', $items[$i]['photo']);
echo base_url('assets/uploads/') . $photos[0]?>" alt="">
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-7 col-lg-12">
                                                            <div class="product__price m-t-10">
                                                                <?php
if ($items[$i]['discount'] > 0) {
    echo "<span class='product__price-del'>Rp " . number_format($items[$i]['price'], 0, ".", ".") . "</span> " . "<br><span class='product__price-reg'>Rp " . number_format($items[$i]['price'] - (($items[$i]['discount'] / 100) * $items[$i]['price']), 0, ".</span>", ".");
} else {
    echo "<span class='product__price-reg'>Rp " . number_format($items[$i]['price'], 0, ".</span>", ".");
}
?>
                                                            </div>
                                                            <p>
                                                                <?php echo $items[$i]['name'] ?>
                                                            </p>
                                                            <p>
                                                                <?php echo $items[$i]['stock'] ?> Tersedia
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php endfor;?>
                                                <!-- Start Single Segment Product -->
                                            </div>
                                            <div class="swiper-buttons">
                                                <!-- Add Arrows -->
                                                <div class="swiper-button-next default__nav default__nav--next"><i
                                                        class="fal fa-chevron-right"></i></div>
                                                <div class="swiper-button-prev default__nav default__nav--prev"><i
                                                        class="fal fa-chevron-left"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- End Single Segment Area -->
                        </div>
                    </div> <!-- ::::::  Start  Product Style - Segment Section  ::::::  -->
                </div>

                <div class="col-lg-9 col-xl-9">
                    <!-- ::::::  Start Hero Section  ::::::  -->
                    <div class="hero hero-slider hero---2">
                        <div class="swiper-wrapper">
                            <!-- Start Hero Image -->
                            <div class="hero-img hero-img--2 swiper-slide"
                                style="background-image: url(<?php echo base_url('assets/images/') ?>/deliverybg.jpg);">
                                <div class="hero__content">
                                    <div class="row">
                                        <div class="col-9 offset-1" align="right">
                                            <div class="title title--normal title--white title--regular">Gratis Ongkir*
                                            </div>
                                            <div class="title title--normal title--white title--thin"></div>
                                            <div class="title title--description title--white">*Untuk transaksi pertama
                                            </div>
                                            <a href="category"
                                                class="btn btn--box btn--large btn--blue btn--uppercase btn--weight">Belanja
                                                Sekarang</a>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- End Hero Image -->
                            <!-- Start Hero Image -->
                            <div class="hero-img hero-img--2  swiper-slide"
                                style="background-image: url(<?php echo base_url('assets/images/') ?>/warungbg.jpg);">
                                <div class="hero__content">
                                    <div class="row">
                                        <div class="col-9 offset-1">
                                            <div class="title title--normal title--white title--thin">Daftar Warung
                                                Terdekat</div>
                                            <div class="title title--description title--white">Semua ada di sini</div>
                                            <a href="category"
                                                class="btn btn--box btn--large btn--blue btn--uppercase btn--weight">Belanja
                                                Sekarang</a>
                                        </div>
                                    </div>
                                </div> <!-- End Hero Image -->
                            </div>

                            <!-- Add Pagination -->
                            <div class="swiper-pagination hero__dots hero__dots--2"></div>
                            <!-- Add Arrows -->
                            <div class="swiper-buttons">
                                <!-- Add Arrows -->
                                <div class="swiper-button-next hero__nav hero__nav--next"><i
                                        class="far fa-chevron-right"></i></div>
                                <div class="swiper-button-prev hero__nav hero__nav--prev"><i
                                        class="far fa-chevron-left"></i></div>
                            </div>
                        </div> <!-- ::::::  End Hero Section  ::::::  -->
                    </div> <!-- ::::::  ENd Hero Section  ::::::  -->

                    <!-- ::::::  Start  Product Style - Default Section [2column]  ::::::  -->
                    <div class="product product--1 swiper-outside-arrow-hover">
                        <div class="row">
                            <div class="col-12">
                                <div
                                    class="section-content section-content--border d-md-flex align-items-center justify-content-between">
                                    <h5 class="section-content__title">Obral Minggu ini
                                        (<?php echo date("d M Y", strtotime($week_sale[0]['date_week_sale'])) . " s/d " . date("d M Y", strtotime("+7 days", strtotime($week_sale[0]['date_week_sale']))); ?>)
                                    </h5>
                                    <a href="<?php echo base_url('home/week_sale') ?>">Lihat semua <i
                                            class="icon-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="swiper-outside-arrow-fix pos-relative">
                                    <div class="product-default-slider-4grid-2row overflow-hidden  m-t-50">
                                        <div class="swiper-wrapper">
                                            <!-- Start Single Default Product -->
                                            <?php for ($i = 0; $i < count($week_sale); $i++): ?>
                                            <div
                                                class="product__box product__box--default product__box--border-hover swiper-slide text-center">
                                                <div class="product__img-box">
                                                    <a href="<?php echo site_url('item/show/') . $week_sale[$i]['id'] ?>"
                                                        class="product__img--link">
                                                        <img class="product__img" src="<?php $photos = explode(',', $week_sale[$i]['photo']);
echo base_url('assets/uploads/') . $photos[0]?>" alt="">
                                                    </a>

                                                    <div class="product__counter-box">
                                                        <div class="product__counter-item"
                                                            data-countdown="<?php echo date("Y/m/d", strtotime("+7 days", strtotime($week_sale[0]['date_week_sale']))); ?>">
                                                        </div>
                                                    </div>
                                                    <span class="product__tag product__tag--new">Disc</span>
                                                </div>
                                                <div class="product__price m-t-10">
                                                    <?php
if ($week_sale[$i]['discount'] > 0) {
    echo "<span class='product__price-del'>Rp " . number_format($week_sale[$i]['price'], 0, ".", ".") . "</span> " . "<span class='product__price-reg'>Rp " . number_format($week_sale[$i]['price'] - (($week_sale[$i]['discount'] / 100) * $week_sale[$i]['price']), 0, ".</span>", ".");
} else {
    echo "Rp " . number_format($week_sale[$i]['price'], 0, ".", ".");
}
?>
                                                </div>
                                                <a href="<?php echo site_url('item/show/') . $week_sale[$i]['id'] ?>"
                                                    class="product__link product__link--underline product__link--weight-light m-t-15">
                                                    <?php echo $week_sale[$i]['name'] ?>
                                                </a>
                                            </div> <!-- End Single Default Product -->
                                            <?php endfor;?>
                                        </div>
                                        <div class="swiper-buttons">
                                            <!-- Add Arrows -->
                                            <div class="swiper-button-next default__nav default__nav--next"><i
                                                    class="fal fa-chevron-right"></i></div>
                                            <div class="swiper-button-prev default__nav default__nav--prev"><i
                                                    class="fal fa-chevron-left"></i></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div> <!-- ::::::  End  Product Style - Default Section [2column]  ::::::  -->

                    <!-- ::::::  Start banner Section  ::::::  -->
                    <div class="banner banner--1">
                        <div class="row">
                            <div class="col-12">
                                <div class="banner__box">
                                    <a class="banner__link">
                                        <img src="<?php echo base_url('assets/images/') ?>/warungbg2.jpg" alt=""
                                            class="banner__img">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- ::::::  End banner Section  ::::::  -->

                    <!-- ::::::  Start  Product Style - Default Section  ::::::  -->
                    <div class="product product--1 swiper-outside-arrow-hover">
                        <div class="row">
                            <div class="col-12">
                                <div
                                    class="section-content section-content--border d-flex  align-items-center justify-content-between">
                                    <h5 class="section-content__title">Warung Terdekat </h5>
                                    <!--<a href="single-1.html">Lihat semua <i class="icon-chevron-right"></i></a>-->
                                    <!-- <p class="msg"></p> -->
                                </div>
                                <p style="font-size: 12px;">Alamat anda sekarang: <font class="msg"></font>
                                </p>

                                <?php
function distance($lat1, $lon1, $lat2, $lon2)
{
    $pi80 = M_PI / 180;
    $lat1 *= $pi80;
    $lon1 *= $pi80;
    $lat2 *= $pi80;
    $lon2 *= $pi80;
    $r = 6372.797; // mean radius of Earth in km
    $dlat = $lat2 - $lat1;
    $dlon = $lon2 - $lon1;
    $a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlon / 2) * sin($dlon / 2);
    $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
    $km = $r * $c;
    //echo ' '.$km;
    return $km;
}
?>


                                <div class="swiper-outside-arrow-fix pos-relative">
                                    <div class="product-default-slider-4grid overflow-hidden  m-t-50">
                                        <div class="swiper-wrapper">
                                            <!-- Start Single Default Product -->
                                            <?php $count = count($warungs);for ($i = 0; $i < $count; $i++): ?>
                                            <?php if (isset($_COOKIE['longg'])): ?>
                                            <?php $jarak = round(distance($_COOKIE['lontt'], $_COOKIE['longg'], $warungs[$i]['lat'], $warungs[$i]['lng']));?>
                                            <?php if ($jarak < 10): ?>
                                            <div
                                                class="product__box product__box--default product__box--border-hover swiper-slide text-center">
                                                <div class="product__img-box">
                                                    <a href="<?php echo site_url('profile/show/') . $warungs[$i]['username'] ?>"
                                                        class="product__img--link">
                                                        <img class="product__img" src="<?php $photos = explode(',', $warungs[$i]['photo']);
echo base_url('assets/uploads/') . $photos[0]?>" alt="">
                                                    </a>
                                                    <span class="product__tag product__tag--new">Dekat</span>
                                                </div>
                                                <div class="product__price m-t-10">
                                                    <a
                                                        href="<?php echo site_url('profile/show/') . $warungs[$i]['username'] ?>"><span
                                                            class="product__price-reg"><?php echo $warungs[$i]['name'] ?></span></a>
                                                    <p style="font-size: 12px;">(<?=$jarak?> Km
                                                        dari anda)</p>
                                                </div>
                                                <p
                                                    class="product__link product__link--underline product__link--weight-light m-t-15">
                                                    <?php

$phrase = $warungs[$i]['address'];
echo implode(' ', array_slice(str_word_count($phrase, 2), 0, 5));

?>
                                                </p>
                                            </div>

                                            <?php endif;?>
                                            <?php else: ?>
                                            <div
                                                class="product__box product__box--default product__box--border-hover swiper-slide text-center">
                                                <div class="product__img-box">
                                                    <a href="<?php echo site_url('profile/show/') . $warungs[$i]['username'] ?>"
                                                        class="product__img--link">
                                                        <img class="product__img" src="<?php $photos = explode(',', $warungs[$i]['photo']);
echo base_url('assets/uploads/') . $photos[0]?>" alt="">
                                                    </a>
                                                    <span class="product__tag product__tag--new">Dekat</span>
                                                </div>
                                                <div class="product__price m-t-10">
                                                    <a
                                                        href="<?php echo site_url('profile/show/') . $warungs[$i]['username'] ?>"><span
                                                            class="product__price-reg"><?php echo $warungs[$i]['name'] ?></span></a>
                                                </div>
                                                <p
                                                    class="product__link product__link--underline product__link--weight-light m-t-15">
                                                    <?php

$phrase = $warungs[$i]['address'];
echo implode(' ', array_slice(str_word_count($phrase, 2), 0, 5));

?>
                                                </p>
                                            </div>
                                            <?php endif;?>


                                            <?php endfor;?>
                                            <!-- End Single Default Product -->
                                        </div>
                                        <div class="swiper-buttons">
                                            <!-- Add Arrows -->
                                            <div class="swiper-button-next default__nav default__nav--next"><i
                                                    class="fal fa-chevron-right"></i></div>
                                            <div class="swiper-button-prev default__nav default__nav--prev"><i
                                                    class="fal fa-chevron-left"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- ::::::  End  Product Style - Default Section  ::::::  -->
                </div>



                <!-- Modal -->
                <div class="modal" id="my-modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-center-dialog modal-sm float-right p-2" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h9 class="modal-title"><i class="fas fa-exclamation-circle"></i> Update Status
                                    Pengiriman!</h9>
                                <button type="button" class="close" id="close-modal">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div id="printable">
                                <div class="modal-body" id="content">

                                    <p>
                                        Mohon untuk selalu melakukan update status pengiriman
                                        jika pesanan anda sudah
                                        diterima!
                                    </p>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>




            </div>

            <div class="row">
                <div class="col-12">
                    <!-- ::::::  Start CMS Section  ::::::  -->
                    <div class="cms cms--1">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-12">
                                <!-- Start Single CMS box -->
                                <div class="cms__content">
                                    <div class="cms__icon">
                                        <img class="cms__icon-img"
                                            src="<?php echo base_url('assets_user/') ?>img/icon/cms/icon1.png" alt="">
                                    </div>
                                    <div class="cms__text">
                                        <h6 class="cms__title">Pengiriman Cepat</h6>
                                        <span class="cms__des">Antar langsung pesananmu</span>
                                    </div>
                                </div>
                            </div> <!-- End Single CMS box -->
                            <!-- Start Single CMS box -->
                            <div class="col-md-3 col-sm-6 col-12">
                                <div class="cms__content">
                                    <div class="cms__icon">
                                        <img class="cms__icon-img"
                                            src="<?php echo base_url('assets_user/') ?>img/icon/cms/icon2.png" alt="">
                                    </div>
                                    <div class="cms__text">
                                        <h6 class="cms__title">Pembayaran Aman</h6>
                                        <span class="cms__des">Bisa bayar ditempat</span>
                                    </div>
                                </div>
                            </div> <!-- End Single CMS box -->
                            <!-- Start Single CMS box -->
                            <div class="col-md-3 col-sm-6 col-12">
                                <div class="cms__content">
                                    <div class="cms__icon">
                                        <img class="cms__icon-img"
                                            src="<?php echo base_url('assets_user/') ?>img/icon/cms/icon3.png" alt="">
                                    </div>
                                    <div class="cms__text">
                                        <h6 class="cms__title">Belanja Dengan Aman</h6>
                                        <span class="cms__des">Tinggal order tanpa ke warung</span>
                                    </div>
                                </div>
                            </div> <!-- End Single CMS box -->
                            <!-- Start Single CMS box -->
                            <div class="col-md-3 col-sm-6 col-12">
                                <div class="cms__content">
                                    <div class="cms__icon">
                                        <img class="cms__icon-img"
                                            src="<?php echo base_url('assets_user/') ?>img/icon/cms/icon4.png" alt="">
                                    </div>
                                    <div class="cms__text">
                                        <h6 class="cms__title">Pusat Bantuan 24/7</h6>
                                        <span class="cms__des">Tanya kapan saja</span>
                                    </div>
                                </div>
                            </div> <!-- End Single CMS box -->
                        </div>
                    </div> <!-- ::::::  End CMS Section  ::::::  -->
                </div>
            </div>



        </div>

        <?php if(isset($order_terima['jml'])) :?>
        <?php if ($order_terima['jml'] > 0): ?>
        <script>
        $(document).ready(function() {
            $('#my-modal').modal();
        });
        </script>
        <?php endif?>
        <?php endif?>

        <script>
        $('#close-modal').on('click', function() {
            // alert('jaha')
            $('#my-modal').modal('hide');
        });
        </script>

        <input type="hidden" id="latt">
        <input type="hidden" id="longg">

        <?php if (!isset($_COOKIE['longg'])): ?>
        <script>
        function initGeolocation() {
            if (navigator.geolocation) {
                // Call getCurrentPosition with success and failure callbacks
                navigator.geolocation.getCurrentPosition(success);
            } else {
                alert("Sorry, your browser does not support geolocation services.");
            }
        }
        </script>
        <?php endif?>


        <script>
        function success(position) {
            var long = position.coords.longitude;
            var lat = position.coords.latitude;

            createCookie("longg", long, "10");
            createCookie("lontt", lat, "10");

            GetAddress(long, lat);
        }

        function createCookie(name, value, days) {
            var expires;

            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toGMTString();
            } else {
                expires = "";
            }

            document.cookie = escape(name) + "=" +
                escape(value) + expires + "; path=/";
        }
        </script>

        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnAQMVvRRzgVVF5DKMkQqjWRr-R70vsXg&libraries=places&callback=GetAddress">
        </script>



        <script type="text/javascript">
        function GetAddress(long, lat) {

            var lat = <?=$_COOKIE['lontt']?>;
            var lng = <?=$_COOKIE['longg']?>;

            // console.log(lng)

            var latlng = new google.maps.LatLng(lat, lng);
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                'latLng': latlng
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        $('.msg').html(results[1].formatted_address);
                        console.log("Location: " + results[1].formatted_address);
                    }
                }
            });
        }
        </script>
    </main> <!-- ::::::  End  Main Container Section  ::::::  -->