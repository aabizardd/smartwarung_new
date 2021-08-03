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


   <!-- ::::::  Start  Breadcrumb Section  ::::::  -->
   <div class="page-breadcrumb">
       <div class="container">
           <div class="row">
               <div class="col-12">
                   <ul class="page-breadcrumb__menu">
                       <li class="page-breadcrumb__nav"><a href="#">Home</a></li>
                       <li class="page-breadcrumb__nav active">Hubungi</li>
                   </ul>
               </div>
           </div>
       </div>
   </div> <!-- ::::::  Start  Breadcrumb Section  ::::::  -->

   <!-- ::::::  Start  Main Container Section  ::::::  -->
   <main id="main-container" class="main-container">
       <div class="container">
           <div class="row">

               <!--
                <div class="col-12">
                    <div id="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2136.986005919501!2d-73.9685579655238!3d40.75862446708152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c258e4a1c884e5%3A0x24fe1071086b36d5!2sThe%20Atrium!5e0!3m2!1sen!2sbd!4v1585132512970!5m2!1sen!2sbd" allowfullscreen></iframe>
                    </div>
                </div>
            -->
               <div class="col-lg-4 col-md-5">

                   <div class="contact-info-wrap gray-bg m-t-40">
                       <div class="single-contact-info">
                           <div class="contact-icon">
                               <i class="fab fa-whatsapp"></i>
                           </div>
                           <div class="contact-info-dec">
                               <a target="_blank" href="https://api.whatsapp.com/">+62 82149638130</a>
                           </div>
                       </div>
                       <div class="contact-social m-t-40">
                           <div class="section-content">
                               <h5 class="section-content__title">Follow Us</h5>
                           </div>
                           <div class="social-link m-t-30">
                               <ul>
                                   <li>
                                       <a href="#"><i class="fab fa-facebook-f"></i></a>
                                   </li>
                                   <li>
                                       <a href="#"><i class="fab fa-twitter"></i></a>
                                   </li>
                                   <li>
                                       <a href="#"><i class="fab fa-youtube"></i></a>
                                   </li>
                                   <li>
                                       <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                   </li>
                                   <li>
                                       <a href="#"><i class="fab fa-instagram"></i></a>
                                   </li>
                               </ul>
                           </div>
                       </div>
                   </div>

                   <div class="contact-info-wrap gray-bg m-t-40">
                       <div class="single-contact-info">

                           <div class="contact-info-dec">
                               <h5>Layanan Lainnya</h5>
                           </div>
                       </div>
                       <div class="contact-social m-t-40">

                           <div class="list-group">

                               <a href="req_aktif" class="list-group-item list-group-item-action active">
                                   Aktifkan kembali akun warung</a>
                               <!-- <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                               <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                               <a href="#" class="list-group-item list-group-item-action disabled">Vestibulum at
                                   eros</a> -->
                           </div>
                       </div>
                   </div>
               </div>

               <div class="col-lg-8 col-md-7">

                   <div class="contact-form gray-bg m-t-40">

                       <?php if ($this->session->flashdata('errors') != ''): ?>
                       <div class="alert alert-danger text-center" role="alert">
                           <?php echo $this->session->flashdata('errors'); ?>
                       </div>
                       <?php endif;?>
                       <?php if ($this->session->flashdata('success') != ''): ?>
                       <div class="alert alert-success text-center" role="alert">
                           <?php echo $this->session->flashdata('success') ?>
                       </div>
                       <?php endif;?>

                       <a class="btn btn-danger text-white" href="<?=base_url('hubungi')?>"><i
                               class="fas fa-arrow-left"></i> Kembali</a>

                       <div class="section-content mt-2">
                           <center>
                               <h5 class="section-content__title">Pengajuan Pengaktifan Akun</h5>
                           </center>

                       </div>
                       <form action="<?php echo base_url(); ?>/hubungi/req_aktif" class="contact-form-style"
                           method="post" id="form-comment" enctype="multipart/form-data">
                           <div class="row">

                               <small class="text-danger ">*Wajib diisi</small>

                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-name">Nama Lengkap <font class="text-danger">*</font>
                                       </label>
                                       <input class="form-control" id="comment-name" type="text" name="nama"
                                           value="<?=set_value('nama');?>">

                                   </div>
                                   <?=form_error('nama', '<small class="text-danger font-italic">*', '</small>');?>

                               </div>

                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-name">Username Akun Warung <font class="text-danger">*</font>
                                       </label>
                                       <input class="form-control" id="comment-name" type="text" name="akun"
                                           value="<?=set_value('akun');?>">

                                   </div>
                                   <small style="font-size: 11px;">Akun SmartWarung anda</small> <br>
                                   <?=form_error('akun', '<small class="text-danger font-italic">*', '</small>');?>
                               </div>

                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-name">Alamat Email <font class="text-danger">*</font></label>
                                       <input class="form-control" id="comment-name" type="email" name="email"
                                           value="<?=set_value('email');?>">
                                   </div>
                                   <small style="font-size: 11px;">Alamat email yang terhubung dengan akun SmartWarung
                                       anda / alamat email yang dapat dihubungi</small> <br>
                                   <?=form_error('email', '<small class="text-danger font-italic">*', '</small>');?>
                               </div>

                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-name">Nomor Handphone yang Bisa Dihubungi <font
                                               class="text-danger">*</font></label>
                                       <input class="form-control" name="no_hp" value="<?=set_value('no_hp');?>"
                                           type="number">
                                   </div>
                                   <small style="font-size: 11px;">Pastikan kamu mengisi handphone dengan benar dan
                                       diawali dengan angka 62 (Contoh: 62XXXXXXXXX)</small> <br>
                                   <?=form_error('no_hp', '<small class="text-danger font-italic">*', '</small>');?>
                               </div>

                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-name">Kendala yang Dihadapi <font class="text-danger">*
                                           </font></label>
                                       <input class="form-control" type="text" name="kendala"
                                           value="<?=set_value('kendala');?>">
                                   </div>
                                   <small style="font-size: 11px;">Mohon jelaskan kendala yang dihadapi</small> <br>
                                   <?=form_error('kendala', '<small class="text-danger font-italic">*', '</small>');?>
                               </div>


                               <div class="col-lg-12">
                                   <div class="form-box__single-group">
                                       <label for="comment-file">Upload Bukti</label>
                                       <input id="comment-file" type="file" name="file">
                                   </div>
                                   <small style="font-size: 11px;">Bukti screenshot tentang kendala yang
                                       dihadapi</small>
                               </div>


                               <div class="col-lg-12">


                                   <button type="submit"
                                       class="btn btn--box btn--small btn--blue btn--uppercase btn--weight m-t-30">Kirim</button>
                               </div>

                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
   </main> <!-- ::::::  End  Main Container Section  ::::::  -->
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
        $.ajax({
            type: 'POST',
            url: "<?php echo base_url(); ?>/comment/send",
            data: data,
            dataType: "json",
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                $("#inp_comment").val("");
                alert("Terimakasih telah menghubungi/memberi kami pesan kami");
            },
            error: (e) => {
                console.log(e);

                alert("Error, something wrong.");
            }
        });
    });
});
   </script>
