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
                        <h4 class="page-title mb-1">Pendapatan Warung</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item active">Pendapatan Warung</li>
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
                                            <th>Nama Warung</th>
                                            <th>Alamat</th>
                                            <th>Total Pendapatan</th>
                                            <th>Total Transaksi Selesai</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $no = 1;?>
                                        <?php foreach ($warungs as $warung): ?>
                                        <tr>
                                            <td><?=$no++?></td>
                                            <td><?=$warung->nama_warung?></td>
                                            <td><?=$warung->address?></td>
                                            <td><?="Rp " . number_format($warung->income, 2, ',', '.');?></td>
                                            <td><?=$warung->jumlah_transaksi?></td>
                                        </tr>
                                        <?php endforeach;?>

                                        <?php foreach ($warungs_exc as $w): ?>
                                        <tr>
                                            <td><?=$no++?></td>
                                            <td><?=$w->nama_warung?></td>
                                            <td><?=$w->address?></td>
                                            <td><?="Rp " . number_format(0, 2, ',', '.');?></td>
                                            <td><?=0?></td>
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
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Unapprove Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" enctype="multipart/form-data" id="form_unapprove">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Alasan</label>
                            <textarea class="form-control" name="alasan" id="exampleInputPassword1"
                                placeholder="Alasan tidak Valid"></textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-block" type="submit">Unapprove</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="nonaktifModal" tabindex="-1" role="dialog" aria-labelledby="nonaktifModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="nonaktifModalLabel">Nonaktif Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" enctype="multipart/form-data" id="form_nonaktif">
                        <div class="form-group">
                            <label for="asdasdasd">Alasan</label>
                            <textarea class="form-control" name="alasan" id="asdasdasd"
                                placeholder="Alasan tidak aktif"></textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-block" type="submit">Nonaktifkan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
    $(document).ready(function() {
        $('.myTablesss').DataTable();
        $(document).on('click', "#btn_unapprove", function() {
            var _uswarung = $("#btn_unapprove").attr("data-username");
            $('#form_unapprove').attr('action', "<?php echo site_url('admin/unapprove/') ?>" +
                _uswarung);
            $("#exampleModal").modal('show');
        });
        $(document).on('click', "#btn_nonaktif", function() {
            var _uswarung = $("#btn_nonaktif").attr("data-id");
            $('#form_nonaktif').attr('action', "<?php echo site_url('admin/aktifasi_warung/') ?>" +
                _uswarung + "/0");
            $("#nonaktifModal").modal('show');
        });
    });
    </script>