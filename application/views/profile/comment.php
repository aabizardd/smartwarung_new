<?php
$name = '';
$email = '';
if ($this->session->userdata('login', true)) {
    if ($this->session->userdata('role') == 0) {
        $name = $this->session->userdata('name');
        $email = $this->session->userdata('username');
    }
}
?>
<!-- ::::::  Start  Main Container Section  ::::::  -->
<div class="container">
    <div class="row">
        <!--
                <div class="col-12">
                    <div id="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2136.986005919501!2d-73.9685579655238!3d40.75862446708152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c258e4a1c884e5%3A0x24fe1071086b36d5!2sThe%20Atrium!5e0!3m2!1sen!2sbd!4v1585132512970!5m2!1sen!2sbd" allowfullscreen></iframe>
                    </div>
                </div>
            -->
        <div class="col-lg-3">
        </div>
        <div class="col-lg-9">



            <div class="contact-form gray-bg">
                <div class="section-content">
                    <h5 class="section-content__title">Kritik Saran/Hubungi Warung <?php echo $user['name']; ?></h5>
                </div>
                <form action="<?php echo base_url(); ?>/comment/send_review_warung" class="contact-form-style"
                    method="post" id="form-comment" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="review-box">
                                <span>Kualitas*</span>
                                <span class="gl-star-rating">
                                    <select name="rating" id="glsr-prebuilt" class="star-rating-prebuilt">
                                        <option value="">Select a rating</option>
                                        <option value="5">Bintang 5</option>
                                        <option value="4">Bintang 4</option>
                                        <option value="3">Bintang 3</option>
                                        <option value="2">Bintang 2</option>
                                        <option value="1">Bintang 1</option>
                                    </select>
                                    <span class="gl-star-rating--stars">
                                        <span data-value="1" class=""><svg xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24" class="gl-emote" style="pointer-events: none;">
                                                <circle class="gl-emote-bg" fill="#FFA98D" cx="12" cy="12" r="10">
                                                </circle>
                                                <path fill="#393939"
                                                    d="M12 14.6c1.48 0 2.9.38 4.15 1.1a.8.8 0 01-.79 1.39 6.76 6.76 0 00-6.72 0 .8.8 0 11-.8-1.4A8.36 8.36 0 0112 14.6zm4.6-6.25a1.62 1.62 0 01.58 1.51 1.6 1.6 0 11-2.92-1.13c.2-.04.25-.05.45-.08.21-.04.76-.11 1.12-.18.37-.07.46-.08.77-.12zm-9.2 0c.31.04.4.05.77.12.36.07.9.14 1.12.18.2.03.24.04.45.08a1.6 1.6 0 11-2.34-.38z">
                                                </path>
                                            </svg></span>
                                        <span data-value="2" class=""><svg xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24" class="gl-emote" style="pointer-events: none;">
                                                <circle class="gl-emote-bg" fill="#FFC385" cx="12" cy="12" r="10">
                                                </circle>
                                                <path fill="#393939"
                                                    d="M12 14.8c1.48 0 3.08.28 3.97.75a.8.8 0 11-.74 1.41A8.28 8.28 0 0012 16.4a9.7 9.7 0 00-3.33.61.8.8 0 11-.54-1.5c1.35-.48 2.56-.71 3.87-.71zM15.7 8c.25.31.28.34.51.64.24.3.25.3.43.52.18.23.27.33.56.7A1.6 1.6 0 1115.7 8zM8.32 8a1.6 1.6 0 011.21 2.73 1.6 1.6 0 01-2.7-.87c.28-.37.37-.47.55-.7.18-.22.2-.23.43-.52.23-.3.26-.33.51-.64z">
                                                </path>
                                            </svg></span>
                                        <span data-value="3" class=""><svg xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24" class="gl-emote" style="pointer-events: none;">
                                                <circle class="gl-emote-bg" fill="#FFD885" cx="12" cy="12" r="10">
                                                </circle>
                                                <path fill="#393939"
                                                    d="M15.33 15.2a.8.8 0 01.7.66.85.85 0 01-.68.94h-6.2c-.24 0-.67-.26-.76-.7-.1-.38.17-.81.6-.9zm.35-7.2a1.6 1.6 0 011.5 1.86A1.6 1.6 0 1115.68 8zM8.32 8a1.6 1.6 0 011.21 2.73A1.6 1.6 0 118.33 8z">
                                                </path>
                                            </svg></span>
                                        <span data-value="4" class=""><svg xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24" class="gl-emote" style="pointer-events: none;">
                                                <circle class="gl-emote-bg" fill="#FFD885" cx="12" cy="12" r="10">
                                                </circle>
                                                <path fill="#393939"
                                                    d="M15.45 15.06a.8.8 0 11.8 1.38 8.36 8.36 0 01-8.5 0 .8.8 0 11.8-1.38 6.76 6.76 0 006.9 0zM15.68 8a1.6 1.6 0 011.5 1.86A1.6 1.6 0 1115.68 8zM8.32 8a1.6 1.6 0 011.21 2.73A1.6 1.6 0 118.33 8z">
                                                </path>
                                            </svg></span>
                                        <span data-value="5" class=""><svg xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24" class="gl-emote" style="pointer-events: none;">
                                                <circle class="gl-emote-bg" fill="#FFD885" cx="12" cy="12" r="10">
                                                </circle>
                                                <path fill="#393939"
                                                    d="M16.8 14.4c.32 0 .59.2.72.45.12.25.11.56-.08.82a6.78 6.78 0 01-10.88 0 .78.78 0 01-.05-.87c.14-.23.37-.4.7-.4zM15.67 8a1.6 1.6 0 011.5 1.86A1.6 1.6 0 1115.68 8zM8.32 8a1.6 1.6 0 011.21 2.73A1.6 1.6 0 118.33 8z">
                                                </path>
                                            </svg></span>
                                    </span>
                                </span>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-box__single-group">
                                <label for="comment-name">Nama Lengkap</label>

                                <input class="form-control" id="comment-to=whom" type="hidden" name="to_whom"
                                    value="<?=$this->uri->segment(3)?>" required>

                                <input class="form-control" id="comment-name" type="text" name="name" value="<?=$name?>"
                                    required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-box__single-group">
                                <label for="comment-usname">Username / Email</label>
                                <input class="form-control" id="comment-usname" type="text" name="usname"
                                    value="<?=$email?>" required>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-box__single-group">
                                <label for="comment-file">Upload Bukti</label>
                                <input id="comment-file" type="file" name="file" required>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-box__single-group">
                                <label for="inp_comment">Pesan Anda</label>
                                <textarea class="form-control" name="comment" id="inp_comment" rows="10"
                                    required></textarea>
                            </div>

                            <div class="form-box__single-group">
                                <div class="g-recaptcha" data-sitekey="6Lf2K4sbAAAAACnfnehFp8UdnhwcePKM_wWzt5PI">
                                </div>
                            </div>

                            <button type="submit"
                                class="btn btn--box btn--small btn--blue btn--uppercase btn--weight m-t-30">Kirim</button>
                        </div>



                        <link rel="stylesheet" href="<?php echo base_url('assets_user/css/plugin/star-rating.css') ?>">




                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- ::::::  End  Main Container Section  ::::::  -->
<!-- <script type="text/javascript" src="https://cdn.rawgit.com/lamhotsimamora/Filter-Kata-Kotor/master/filter-bad-word.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
    const _badWord = ['Anjing', 'Babi', 'Kunyuk', 'Bajingan', 'Asu', 'Bangsat', 'Kampret', 'Kontol', 'Memek',
        'Ngentot', 'Pentil', 'Perek', 'Pepek', 'Pecun', 'Bencong', 'Banci', 'Maho', 'Gila', 'Sinting',
        'Tolol', 'Sarap', 'Setan', 'Lonte', 'Hencet', 'Taptei', 'Kampang', 'Pilat', 'Keparat', 'Bejad',
        'Gembel', 'Brengsek', 'Tai', 'Anjrit', 'Bangsat', 'Fuck', 'Tetek', 'Ngulum', 'Jembut', 'Totong',
        'Kolop', 'Pukimak', 'Bodat', 'Heang', 'Jancuk', 'Burit', 'Titit', 'Nenen', 'Bejat', 'Silit',
        'Sempak', 'Fucking', 'Asshole', 'Bitch', 'Penis', 'Vagina', 'Klitoris', 'Kelentit', 'Borjong',
        'Dancuk', 'Pantek', 'Taek', 'Itil', 'Teho', 'Bejat', 'Pantat', 'Bagudung', 'Babami', 'Kanciang',
        'Bungul', 'Idiot', 'Kimak', 'Henceut', 'Kacuk', 'Blowjob', 'Pussy', 'Dick', 'Damn', 'Ass'
    ];
    String.prototype._replaceAllString = function(s, r) {
        return this.split(s).join(r);
    };

    function _filterBadWord(str, txt, dt) {
        if (str) {
            var str = str.toLowerCase();
            txt = txt ? txt : "***";
            dt = dt ? dt : _badWord;
            for (var i = 0; i < dt.length; i++) {
                var kk = dt[i].toLowerCase();
                var ii = str.search(kk);
                if (ii != -1) {
                    // str = str._replaceAllString(kk, txt);
                    return false
                }
            }
            return true;
        } else {
            return undefined;
        }
    }
    $("#tombol_tambah").click(function() {
        event.preventDefault();
        // var data = $('#form-comment').serialize();

        var data = new FormData($('#form-comment')[0]);
        var inp_comment = $("#inp_comment").val();

        var result = _filterBadWord(inp_comment);
        console.log(result);
        if (result == false) {
            alert("Pesan Anda Berisi Kata-Kata Buruk, Harap Hapus Kata-Kata Buruk Sebelum Melanjutkan");
            // $("#inp_comment").val("");
            return false;
        }

    });
});
</script>

<script src="<?php echo base_url('assets_user/js/plugin/star-rating.js?ver=4.1.3') ?>"></script>
<script>
var destroyed = false;
var starratingPrebuilt = new StarRating('.star-rating-prebuilt', {
    prebuilt: true,
    maxStars: 5,
});
var starrating = new StarRating('.star-rating', {
    stars: function(el, item, index) {
        el.innerHTML =
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect class="gl-star-full" width="19" height="19" x="2.5" y="2.5"/><polygon fill="#FFF" points="12 5.375 13.646 10.417 19 10.417 14.665 13.556 16.313 18.625 11.995 15.476 7.688 18.583 9.333 13.542 5 10.417 10.354 10.417"/></svg>';
    },
});
var starratingOld = new StarRating('.star-rating-old');
document.querySelector('.toggle-star-rating').addEventListener('click', function() {
    if (!destroyed) {
        starrating.destroy();
        starratingOld.destroy();
        starratingPrebuilt.destroy()
        destroyed = true;
    } else {
        s
        tarrating.rebuild();
        starratingOld.rebuild();
        starratingPrebuilt.rebuild()
        destroyed = false;
    }
});
</script>