   <!-- ::::::  Start  Breadcrumb Section  ::::::  -->
   <div class="page-breadcrumb">
       <div class="container">
           <div class="row">
               <div class="col-12">
                   <ul class="page-breadcrumb__menu">
                       <li class="page-breadcrumb__nav"><a href="#">Home</a></li>
                       <li class="page-breadcrumb__nav active">Pesanan Saya</li>
                   </ul>
               </div>
           </div>
       </div>
   </div> <!-- ::::::  End  Breadcrumb Section  ::::::  -->

   <!-- ::::::  Start  Main Container Section  ::::::  -->
   <main id="main-container" class="main-container">
       <div class="container">
           <div class="row">
               <div class="col-12">
                   <div class="section-content">
                       <h5 class="section-content__title">Pesanan Saya</h5>
                   </div>
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
                   <!-- Start Wishlist Table -->
                   <div class="table-content table-responsive cart-table-content m-t-30">
                       <table id="datatable-buttons">
                           <thead>
                               <tr>
                                   <th>Invoice ID</th>
                                   <th>Tanggal</th>
                                   <th>Total</th>
                                   <th>Warung</th>
                                   <!-- <th>Cara Pembayaran</th> -->
                                   <th>Status</th>
                                   <th>Aksi</th>
                               </tr>
                           </thead>
                           <tbody>
                               <?php $i = 0;
foreach ($invoices as $invoice): ?>
                               <tr>
                                   <td class="product-name"><span
                                           class="text-info"><?php echo $invoice['invoice_id'] ?></span></td>
                                   <td class="product-name"><a
                                           href="#"><?=date("d M Y H:i", strtotime($invoice['date']));?></a></td>
                                   <td class="product-price-cart">
                                       <span class="amount">
                                           <?php $ttl = $invoice['total'];
if ($ttl == 0) {
    echo "Rp " . number_format($invoice['billing'], 0, ".", ".");
} else {
    echo "Rp " . number_format($invoice['total'], 0, ".", ".");
}
?>
                                       </span>
                                   </td>
                                   <td class="product-name">
                                       <a href="" class="py-auto"><?php echo $invoice['warung_name'] ?></a>
                                       <p><?=$invoice['method']?></p>
                                   </td>

                                   <!-- <td>
                                       <a class="btn btn-info" href="<?=$invoice['pdf_url']?>">Lihat cara bayar</a>
                                   </td> -->

                                   <td class="product-name">
                                       <?php if ($this->session->role == 0) {?>
                                       <?php if ($invoice['invoice_status'] == "Menunggu proses penjual"): ?>
                                       <span class="text-warning"><?php echo $invoice['invoice_status'] ?></span>
                                       <?php elseif ($invoice['invoice_status'] == "201"): ?>
                                       <span class="text-warning"><?php echo "Belum melakukan pembayaran" ?></span>
                                       <?php elseif ($invoice['invoice_status'] == "200"): ?>
                                       <span class="text-success"><?php echo "Sudah melakukan pembayaran" ?></span>
                                       <?php else: ?>
                                       <span class="text-info"><?php echo $invoice['invoice_status'] ?></span>



                                       <?php endif;?>
                                       <?php } elseif ($this->session->role == 1) {?>
                                       <?php if ($invoice['invoice_status'] == "Menunggu proses penjual"): ?>
                                       <span class="text-warning"><?php echo $invoice['invoice_status'] ?></span>
                                       <?php elseif ($invoice['invoice_status'] == "201"): ?>
                                       <span class="text-warning"><?php echo "Belum melakukan pembayaran" ?></span>
                                       <?php elseif ($invoice['invoice_status'] == "200"): ?>
                                       <span class="text-success"><?php echo "Sudah melakukan pembayaran" ?></span>
                                       <?php else: ?>
                                       <span class="text-info"><?php echo $invoice['invoice_status'] ?></span>
                                       <?php endif;?>
                                       <?php }?>
                                   </td>
                                   <td class="product-add-cart">
                                       <?php if ($this->session->role == 0) {?>
                                       <?php if ($invoice['invoice_status'] == "Menunggu proses penjual"): ?>
                                       <a href="<?=base_url('profile/ubah_dibatalkan/' . $invoice['invoice_id'])?>"
                                           class="btn btn-danger">Batalkan Pesanan</a>
                                       <?php elseif ($invoice['invoice_status'] == "Menunggu verif pembayaran"): ?>
                                       <a href="<?=base_url('profile/ubah_dibatalkan/' . $invoice['invoice_id'])?>"
                                           class="btn btn-danger">Batalkan Pesanan</a>
                                       <?php elseif ($invoice['invoice_status'] == "Sedang dikirim"): ?>
                                       <a href="<?=base_url('profile/ubah_diterima/' . $invoice['invoice_id'])?>"
                                           class="btn btn-success">Konfirmasi Pesanan diterima</a>
                                       <?php elseif ($invoice['invoice_status'] == "201"): ?>
                                       <a href="<?=$invoice['pdf_url']?>" target="_blank" class="btn btn-info">Lihat
                                           cara
                                           bayar</a>
                                       <?php elseif ($invoice['invoice_status'] == "Sudah diterima"): ?>
                                       <?php elseif ($invoice['invoice_status'] == "Dibatalkan"): ?>
                                       <?php endif;?>
                                       <?php } elseif ($this->session->role == 1) {?>
                                       <?php if ($invoice['invoice_status'] == "200" || $invoice['invoice_status'] == "Menunggu proses penjual"): ?>
                                       <a href="<?=base_url('profile/ubah_dikirim/' . $invoice['invoice_id'])?>"
                                           class="btn btn-warning">Ubah sedang dikirim</a>
                                       <?php elseif ($invoice['invoice_status'] == "Menunggu verif pembayaran"): ?>
                                       <?php elseif ($invoice['invoice_status'] == "Sedang dikirim"): ?>
                                       <?php elseif ($invoice['invoice_status'] == "Sudah diterima"): ?>
                                       <?php elseif ($invoice['invoice_status'] == "Dibatalkan"): ?>
                                       <?php endif;?>
                                       <?php }?>
                                       <div class="row mt-4">
                                           <div class="col-sm-6">

                                           </div>
                                       </div>

                                       <?php if ($this->session->role == 0): ?>

                                       <?php if ($invoice['invoice_status'] == "Sudah diterima" || $invoice['invoice_status'] == "Sudah diterima dan diulas"): ?>
                                       <button class="btn btn-sm btn-primary px-4 float-right" data-toggle="modal"
                                           data-target="#modal"
                                           onclick="get_details('<?php echo $invoice['invoice_id'] ?>')">Detail
                                           belanja</button>
                                       <?php endif?>

                                       <?php endif;?>
                                   </td>
                               </tr>

                   </div>
                   <div class="offset-sm-8 col-sm-4">
                       <!-- <button class="btn btn-sm btn-info" data-id="<?=$invoice['invoice_id']?>" data-toggle="modal">Berikan kami penilaian</button> -->

                       <!-- <input type="text" id="details" value="<?php echo $invoice['invoice_id'] ?>" hidden> -->
                   </div>
               </div>
               </td>
               </tr>
               <?php endforeach;?>
               </tbody>
               </table>
               <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-hidden="true">
                   <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h5 class="modal-title">Detail belanja</h5>
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                   <span aria-hidden="true">&times;</span>
                               </button>
                           </div>
                           <div id="printable">
                               <div class="modal-body" id="content">
                               </div>
                               <div class="modal-footer" id="footer">
                               </div>
                           </div>

                       </div>
                   </div>
               </div>
           </div> <!-- End Wishlist Table -->
       </div>
       </div>
       </div>
   </main> <!-- ::::::  End  Main Container Section  ::::::  -->