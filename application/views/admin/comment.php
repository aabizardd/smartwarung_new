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
                        <h4 class="page-title mb-1">Kritik dan Saran</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item active">Kritik dan Saran</li>
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
                                            <th>Tanggal</th>
                                            <th>Nama Pengirim</th>
                                            <th>Username</th>
                                            <th>Kepada</th>
                                            <th>Pesan</th>
                                            <th>Bukti</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>


                                    <tbody>
                                        <?php $no = 1;?>
                                        <?php foreach ($comment as $key): ?>
                                        <tr>
                                            <td><?=$no;?></td>
                                            <td>
                                                <p>
                                                    <?php echo date("d M Y", strtotime($key['date'])) ?>
                                                </p>
                                                <p>
                                                    <?php echo 'Jam : ' . date("H:i", strtotime($key['date'])) ?>
                                                </p>
                                            </td>
                                            <td><?=$key['sender_name']?></td>
                                            <td><?php echo $key['username'] ?></td>
                                            <td><?php echo $key['to_whom'] ?></td>
                                            <td><?php echo $key['message'] ?></td>
                                            <td><a href="<?php echo base_url('assets/kritik/' . $key['foto']) ?>"
                                                    target="_blank"><img class="img-thumbnail img-fluid"
                                                        src="<?php echo base_url('assets/kritik/' . $key['foto']) ?>"
                                                        width="250"></a>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary balasan"
                                                    data-toggle="modal" data-target="#exampleModal"
                                                    data-email="<?=$key['email']?>" data-message="<?=$key['message']?>">
                                                    <i class="fas fa-reply"></i>
                                                    Balas
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $no++;?>
                                        <?php endforeach;?>
                                    </tbody>
                                </table>

                                <!-- Button trigger modal -->
                                <!-- <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModal">
                                    Launch demo modal
                                </button> -->

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Balas Kritik dan Saran
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="<?=base_url('admin/send_balasan')?>" method="POST">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlTextarea1">Balasan</label>
                                                        <textarea class="form-control" id="exampleFormControlTextarea1"
                                                            rows="3" name="balasan" required></textarea>
                                                    </div>

                                                    <input type="hidden" id="email" name="email">
                                                    <input type="hidden" id="message" name="message">

                                                    <button class="btn btn-primary" type="submit" id="kirim_balasan"
                                                        style="display: block;">Kirim</button>

                                                    <button class="btn btn-primary" type="button" disabled
                                                        style="display: none;" id="loader">
                                                        <span class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true"></span>
                                                        Mengirim...
                                                    </button>

                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

            </div>
            <!-- end container-fluid -->
        </div>
        <!-- end page-content-wrapper -->
    </div>

    <script src="<?php echo base_url('assets_admin/') ?>libs/jquery/jquery.min.js"></script>

    <script>
    $('#kirim_balasan').on('click', function() {

        $('#kirim_balasan').hide();
        $('#loader').show();

    });
    </script>

    <script>
    $(document).on("click", ".balasan", function() {
        // alert('hai')
        var email = $(this).data('email');
        var message = $(this).data('message');
        $(".modal-body #email").val(email);
        $(".modal-body #message").val(message);
        // As pointed out in comments,
        // it is unnecessary to have to manually call the modal.
        // $('#addBookDialog').modal('show');
    });
    </script>
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
