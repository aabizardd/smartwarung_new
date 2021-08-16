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
                        <h4 class="page-title mb-1">Daftar Pesanan</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item active">Daftar Pesanan</li>
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
                                            <th>ID</th>
                                            <th>Pembeli</th>
                                            <th>Warung</th>
                                            <th>Total</th>
                                            <!-- <th>Bukti Bayar</th> -->
                                            <!-- <th>Status</th> -->
                                            <!-- <th>Alasan</th> -->
                                            <!-- <th>Aksi</th> -->
                                            <th>Update</th>
                                            <th>Tanggal</th>
                                            <th>Metode</th>
                                        </tr>
                                    </thead>


                                    <tbody>
                                        <?php $no = 1;?>
                                        <?php foreach ($orders as $key): ?>
                                        <tr>
                                            <td><?=$no++;?></td>
                                            <td><?=$key->id;?></td>
                                            <td><?=$key->user?></td>
                                            <td><?=$key->warung?></td>
                                            <td>
                                                <?php echo "Rp " . number_format($key->total, 0, ".", "."); ?>
                                            </td>

                                            <td>
                                                <?php if ($key->status == 201): ?>
                                                <div class="badge badge-soft-danger">Belum melakukan
                                                    pembayaran
                                                </div>
                                                <?php elseif ($key->status == 200): ?>
                                                <div class="badge badge-soft-primary">Sudah melakukan
                                                    pembayaran
                                                </div>
                                                <?php else: ?>
                                                <div class="badge badge-soft-primary"><?=$key->status?>
                                                </div>
                                                <?php endif;?>
                                            </td>
                                            <td><?=$key->date?></td>
                                            <td><?=$key->method?></td>
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
                    <h5 class="modal-title" id="exampleModalLabel">Validasi Form</h5>
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

    <script>
    $(document).ready(function() {
        $('.myTablesss').DataTable();
        $(document).on('click', "#btn_unapprove", function() {
            var _uswarung = $("#btn_unapprove").attr("data-id");
            $('#form_unapprove').attr('action', "<?=base_url('admin/verif_payment/')?>" + _uswarung +
                "/2");
            $("#exampleModal").modal('show');
        });
    });
    </script>