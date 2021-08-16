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
                        <h4 class="page-title mb-1">Review</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item active">Review</li>
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

                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Review Pesanan</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<?=base_url('admin/review_warung')?>">Review
                                            Warung</a>
                                    </li>

                                </ul>

                                <br>





                                <table id="datatable"
                                    class="table myTablesss table-striped table-bordered dt-responsive nowrap"
                                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Pembeli</th>
                                            <th>Nama Warung</th>
                                            <th>Barang</th>
                                            <th>Review</th>
                                            <th>Rating</th>
                                            <!-- <th>Bukti</th> -->
                                        </tr>
                                    </thead>


                                    <tbody>

                                        <?php $no = 1;?>
                                        <?php foreach ($review_pesanan as $item): ?>
                                        <tr>
                                            <td><?=$no++?></td>
                                            <td><?=$item->pembeli?></td>
                                            <td><?=$item->nama_toko?></td>
                                            <td><?=$item->barang?></td>
                                            <td><?=$item->review?></td>
                                            <td>
                                                <?php for ($i = 0; $i < $item->rating; $i++): ?>
                                                <img src="<?=base_url('assets_admin/images/star.png')?>" alt=""
                                                    width="20">
                                                <?php endfor;?>
                                            </td>
                                        </tr>
                                        <?php endforeach;?>

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
