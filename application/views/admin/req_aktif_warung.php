<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<div class="main-content">

    <div class="page-content">

        <!-- Page-Title -->
        <div class="page-title-box">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h4 class="page-title mb-1">Request Aktivasi Akun Warung</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item active">Request Aktivasi Akun Warung</li>
                        </ol>
                    </div>
                </div>

            </div>
        </div>
        <!-- end page title end breadcrumb -->

        <div class="page-content-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

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

                                <table id="datatable-buttons"
                                    class="table myTablesss table-striped table-bordered dt-responsive nowrap"
                                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama Lengkap</th>
                                            <th>Username Warung</th>
                                            <th>Email</th>
                                            <th>Nomor Hp</th>
                                            <th>Kendala</th>
                                            <th>Bukti</th>
                                            <th>Status</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $no = 1;?>
                                        <?php foreach ($pengajuan_aktivasi as $item): ?>
                                        <tr>
                                            <td><?=$no++?></td>
                                            <td><?=$item->nama_lengkap?></td>
                                            <td><?=$item->username?></td>
                                            <td><?=$item->email?></td>
                                            <td><?=$item->no_hp?></td>
                                            <td><?=$item->kendala?></td>
                                            <td>
                                                <a href="<?=base_url('assets_admin/foto_pengajuan/') . $item->bukti?>"
                                                    target="_blank">
                                                    <img src="<?=base_url('assets_admin/foto_pengajuan/') . $item->bukti?>"
                                                        alt="" srcset="" width="300">
                                                </a>
                                            </td>
                                            <td>
                                                <?php if ($item->status == 0): ?>
                                                <a class="badge badge-info text-white">Request Aktivasi</a>
                                                <?php elseif ($item->status == 1): ?>
                                                <a class="badge badge-success text-white">Aktivasi diterima</a>
                                                <?php else: ?>
                                                <a class="badge badge-danger text-white">Aktivasi ditolak</a>
                                                <?php endif?>
                                            </td>

                                            <td>
                                                <?php if ($item->status == 0): ?>
                                                <a href="<?=base_url('admin/pengajuan/') . $item->username . '/' . $item->email . '/terima'?>"
                                                    class="btn btn-success btn-sm">Terima</a>
                                                <a class="btn btn-danger btn-sm text-white" data-toggle="modal"
                                                    data-target="#modal_tolak" id="tolak-modal"
                                                    data-email=<?=$item->email?>
                                                    data-username=<?=$item->username?>>Tolak</a>
                                                <?php endif?>
                                            </td>
                                        </tr>
                                        <?php endforeach?>






                                    </tbody>



                                </table>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

            </div>
            <!-- end container-fluid -->
        </div>
        <!-- end page-content-wrapper -->
    </div>
    <!-- End Page-content -->

    <!-- sample modal content
                    <div id="exampleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title mt-0" id="exampleModalLabel">Alasan tidak valid</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form method="POST" enctype="multipart/form-data" id="form_unapprove">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Alasan</label>
                                        <textarea class="form-control" name="alasan" id="exampleInputPassword1" placeholder="Alasan tidak Valid"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                                    <button class="btn btn-primary waves-effect waves-light" type="submit">Unapprove</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> /.modal -->
    <!-- Modal -->


    <!-- Button trigger modal -->
    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Launch demo modal
    </button> -->

    <!-- Modal -->
    <div class="modal fade" id="modal_tolak" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

            <form action="<?=base_url('admin/tolak_pengajuan')?>" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel">Alasan Penolakan Pengajuan Aktivasi Akun Warung
                        </h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Alasan Penolakan</label>
                            <!-- <input type="email" class="form-control" id="alasan"> -->
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                name="alasan"></textarea>
                        </div>
                        <input type="hidden" id="email" name="email">
                        <input type="hidden" id="username" name="username">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </form>

        </div>
    </div>


    <script src="<?php echo base_url('assets_admin/') ?>libs/jquery/jquery.min.js"></script>

    <script>
    $('#tolak-modal').on('click', function() {
        // alert('hai');
        var email = $(this).data('email');
        var username = $(this).data('username');

        $(".modal-body #email").val(email);
        $(".modal-body #username").val(username);
    });
    </script>
