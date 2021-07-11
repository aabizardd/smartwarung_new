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
                        <h4 class="page-title mb-1">Keterangan Nonaktif Warung</h4>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin') ?>">Admin</a></li>
                            <li class="breadcrumb-item"><a href="<?php echo site_url('admin/warung') ?>">Warung</a></li>
                            <li class="breadcrumb-item active">Keterangan Nonaktif Warung</li>
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
                                <form action="<?php echo site_url('admin/aktifasi_warung/') . $item['id'] . '/0' ?>"
                                    method="post" enctype='multipart/form-data'>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Nama Warung</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="text"
                                                value="<?php echo $item['username'] ?>" readonly="readonly">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Alamat</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="text"
                                                value="<?php echo $item['address'] ?>" readonly="readonly">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Alasan Tidak Aktif</label>
                                        <div class="col-md-10">

                                            <?php $no_a = 1;
$no_b = 1;?>
                                            <?php foreach ($tolak as $item): ?>

                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="alasan[]"
                                                    value="<?=$item->keterangan?>" id="defaultCheck<?=$no_a++?>">

                                                <label class="form-check-label" for="defaultCheck<?=$no_b++?>">
                                                    <?=$item->keterangan?>
                                                </label>
                                            </div>

                                            <?php endforeach;?>
                                            <br>

                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <input type="checkbox"
                                                            aria-label="Checkbox for following text input">
                                                    </div>
                                                </div>
                                                <input type="text" class="form-control"
                                                    aria-label="Text input with checkbox" placeholder="lainnya"
                                                    name="alasan[]">
                                            </div>



                                        </div>
                                    </div>

                                    <div class="mt-4 text-right">
                                        <a class="btn btn-outline-danger waves-effect waves-light"
                                            href="<?php echo base_url(); ?>admin/warung"
                                            class="btn btn-warning">Batal</a>
                                        <button class="btn btn-primary waves-effect waves-light"
                                            type="submit">Nonaktif</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->

            </div>
            <!-- end container-fluid -->
        </div>
        <!-- end page-content-wrapper -->
    </div>
    <!-- End Page-content -->