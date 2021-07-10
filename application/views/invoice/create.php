   <!-- ::::::  Start  Breadcrumb Section  ::::::  -->
   <div class="page-breadcrumb">
       <div class="container">
           <div class="row">
               <div class="col-12">
                   <ul class="page-breadcrumb__menu">
                       <li class="page-breadcrumb__nav"><a href="#">Home</a></li>
                       <li class="page-breadcrumb__nav active">Checkout</li>
                   </ul>
               </div>
           </div>
       </div>
   </div> <!-- ::::::  End  Breadcrumb Section  ::::::  -->




   <!-- ::::::  Start  Main Container Section  ::::::  -->
   <main id="main-container" class="main-container">

       <form action="<?=site_url()?>/snap/finish" method="POST" id="payment-form">
           <input type="text" name="cart_id" value="<?php echo $carts[0]['id'] ?>" hidden>
           <div class="container">
               <div class="row">
                   <!-- Start Client Shipping Address -->



                   <div class="col-lg-7">
                       <div class="section-content">
                           <h5 class="section-content__title">Alamat Pengiriman</h5>
                       </div>
                       <div class="row">
                           <div class="col-md-12">
                               <div class="form-box__single-group">
                                   <div id="map" style="width: 100%;height: 400px;"></div>
                               </div>
                           </div>
                           <input type="text" name="warung" hidden id="warung"
                               value="<?php echo $warungs['username'] ?>">

                           <div class="col-md-12">
                               <div class="form-box__single-group">
                                   <?=$this->session->flashdata('message');?>
                               </div>
                           </div>

                           <div class="col-md-12">
                               <div class="form-box__single-group">
                                   <label for="form-first-name">Asal</label>
                                   <input id="origin-input" type="text" class="form-control" name="origin"
                                       value="<?php echo $warungs['address'] ?>" readonly>
                                   <input id="origin-place_id" type="text" class="form-control" name="origin-place_id"
                                       placeholder="Asal" value="<?php echo $warungs['place_id'] ?>" hidden>
                               </div>
                           </div>




                           <div class="col-md-12">
                               <div class="form-box__single-group">
                                   <label for="form-last-name">Tujuan</label>
                                   <input id="destination-input" type="text" class="form-control" name="destination"
                                       placeholder="Tujuan" required>
                                   <input id="destination-place_id" type="text" class="form-control"
                                       name="destination-place_id" placeholder="Tujuan" hidden>

                               </div>
                           </div>


                           <div class="col-md-12">
                               <div class="form-box__single-group">
                                   <label for="form-company-name">Jarak (Dalam Kilometer)</label>
                                   <input id="distance" type="text" class="form-control" name="distance"
                                       placeholder="Jarak" readonly>
                                   <small class="text-danger" id="alert-distance" style="display: none;"> <i>*Jarak
                                           tidak boleh lebih dari 2
                                           Kilometer (KM)</i>
                                   </small>
                               </div>
                           </div>
                           <div class="col-md-12" style="display: none;" id="payments">
                               <div class="form-box__single-group">
                                   <label for="form-country">Pembayaran</label>
                                   <select class="form-control" name="method" id="method">
                                       <option value="COD">COD</option>
                                       <option value="Transfer">Transfer</option>
                                   </select>
                               </div>
                           </div>
                       </div>
                   </div> <!-- End Client Shipping Address -->

                   <!-- Start Order Wrapper -->
                   <div class="col-lg-5">
                       <div class="your-order-section">
                           <div class="section-content">
                               <h5 class="section-content__title">Total Keranjang</h5>
                           </div>
                           <div class="your-order-box gray-bg m-t-40 m-b-30">
                               <div class="your-order-product-info">
                                   <div class="your-order-top d-flex justify-content-between">
                                       <h6 class="your-order-top-left">Produk</h6>
                                       <h6 class="your-order-top-right">Total</h6>
                                   </div>
                                   <ul class="your-order-middle">
                                       <li class="d-flex justify-content-between">
                                           <?php $total = 0;?>
                                           <?php $discount = 0;?>
                                           <?php foreach ($carts as $item): ?>
                                           <span class="your-order-middle-left"><?php echo $item['name'] ?> X
                                               <?php echo $item['quantity'] ?></span>

                                           <input type="number" name="item[]" hidden
                                               value="<?php echo $item['item_id'] ?>">

                                           <input type="number" name="price[]" hidden
                                               value="<?=($item['discount'] > 0) ? $item['price'] - (($item['discount'] / 100) * $item['price']) : $item['price']?>">

                                           <input type="number" name="quantity[]" hidden
                                               value="<?php echo $item['quantity'] ?>">
                                           <span
                                               class="your-order-middle-right"><?php echo "Rp " . number_format($item['price'] * $item['quantity'], 0, ".", ".") ?></span>
                                           <?php
if ($item['discount'] > 0) {
    $total += ($item['price'] - (($item['discount'] / 100) * $item['price'])) * $item['quantity'];
    $discount += (($item['discount'] / 100) * $item['price']) * $item['quantity'];
} else {
    $total += $item['price'] * $item['quantity'];
    $discount += 0;
}
?>
                                           <?php endforeach;?>
                                       </li>
                                   </ul>
                                   <div class="your-order-total d-flex justify-content-between">
                                       <h6 class="your-order-bottom-left">Diskon</h6>
                                       <span
                                           class="your-order-bottom-right"><?php echo "<del>Rp " . number_format($discount, 0, ".", ".") . "</del>" ?></span>
                                   </div>
                                   <div class="your-order-bottom d-flex justify-content-between">
                                       <h6 class="your-order-bottom-left">Ongkos Kirim</h6>
                                       <input type="number" name="delivery_fee" hidden id="delivery_fee">
                                       <span class="your-order-bottom-right" id="ongkir">Rp 0</span>
                                   </div>
                                   <div class="your-order-total d-flex justify-content-between">
                                       <h5 class="your-order-total-left">Total</h5>
                                       <input type="number" name="billing" value="<?php echo $total ?>" hidden
                                           id="billing">
                                       <h5 class="your-order-total-right"><span
                                               id="total"><?php echo "Rp " . number_format($total, 0, ".", ".") ?></span>
                                       </h5>
                                       <input type="number" name="total" hidden id="total_price">
                                   </div>
                               </div>

                           </div>

                           <input type="hidden" name="result_type" id="result-type" value="">

                           <input type="hidden" name="result_data" id="result-data" value="">



                           <button class="btn btn--block btn--small btn--blue btn--uppercase btn--weight" type="submit"
                               id="pay-button" style="display: none;">Pesan Sekarang</button>


                           <button class="btn btn--block btn--small btn--blue btn--uppercase btn--weight" type="submit"
                               style="display: none;" id="cod-button">
                               Pesan COD
                           </button>

                           <button class="btn btn--block btn--small btn--blue btn--uppercase btn--weight" type="button"
                               disabled style="display: none;" id="load-button">
                               <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                               Menentukan Lokasi...
                           </button>

                       </div>
                   </div> <!-- End Order Wrapper -->
               </div>
           </div>
       </form>
   </main> <!-- ::::::  End  Main Container Section  ::::::  -->


   <script>
var typingTimer; //timer identifier
var doneTypingInterval = 4000; //time in ms (5 seconds)

//on keyup, start the countdown
$('#destination-input').keyup(function() {

    $('#cod-button').hide()
    $('#pay-button').hide()
    $('#load-button').show()
    $('#payments').hide()

    clearTimeout(typingTimer);
    if ($('#destination-input').val()) {
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    }
});

//user is "finished typing," do something
function doneTyping() {
    $('#load-button').hide()

    // alert($('#distance').val())

    var delivery_fee = $("#delivery_fee").val();
    var total_price = $("#total_price").val();
    var destination = $("#destination-input").val();

    console.log(delivery_fee)
    console.log(total_price)
    console.log(destination)

    var jarak = $('#distance').val();

    if (jarak < 2) {
        $('#payments').show()
        if ($('#method').val() == "Transfer") {
            $('#cod-button').hide()
            $('#pay-button').show()
        } else {
            $('#cod-button').show()
            $('#pay-button').hide()
        }
    } else {
        $('#cod-button').hide()
        $('#pay-button').hide()
        $('#alert-distance').show()
        $('#payments').hide()
    }
}
   </script>


   <script>
$(document).ready(function() {
    $('#transfer_method_show').hide();
    $('#pilih_bank_show').hide();
    $(document).on('change', '#method', function() {
        console.log($('#method').val());
        if ($('#method').val() == "Transfer") {
            $('#cod-button').hide()
            $('#pay-button').show()
        } else {
            $('#cod-button').show()
            $('#pay-button').hide()
        }
    });
    $(document).on('change', '#bank_to_select', function() {
        var type_banks = $('#bank_to_select').val()
        console.log(type_banks);
        var banks = <?=json_encode($bank)?>;
        var html = '';
        banks.forEach(element => {
            console.log(element.bank)
            if (element.bank == type_banks) {
                html += `
                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">${element.bank}</h5>
                                                <p class="card-text">${element.account_number}</p>
                                                <p class="card-text">${element.account_name}</p>
                                            </div>
                                        </div>
                                    </div>
                    `;
            }
        });
        if (html != '') {
            $("#pilih_bank_show").show();
            $('#transfer_bank_show').html(html);
        } else {
            html += `
                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                Change other bank
                                            </div>
                                        </div>
                                    </div>
                    `;
        }
    });
})
   </script>

   <script type="text/javascript">
$('#pay-button').click(function(event) {
    event.preventDefault();
    $(this).attr("disabled", "disabled");
    var delivery_fee = $("#delivery_fee").val();
    var total_price = $("#total_price").val();
    var destination = $("#destination-input").val();
    $.ajax({
        type: 'POST',
        url: '<?=site_url()?>/snap/token',
        data: {
            delivery_fee: delivery_fee,
            total_price: total_price,
            destination: destination,
        },
        cache: false,

        success: function(data) {
            //location = data;

            console.log('token = ' + data);

            var resultType = document.getElementById('result-type');
            var resultData = document.getElementById('result-data');

            function changeResult(type, data) {
                $("#result-type").val(type);
                $("#result-data").val(JSON.stringify(data));
                //resultType.innerHTML = type;
                //resultData.innerHTML = JSON.stringify(data);
            }

            snap.pay(data, {

                onSuccess: function(result) {
                    changeResult('success', result);
                    console.log(result.status_message);
                    console.log(result);
                    $("#payment-form").submit();
                },
                onPending: function(result) {
                    changeResult('pending', result);
                    console.log(result.status_message);
                    $("#payment-form").submit();
                },
                onError: function(result) {
                    changeResult('error', result);
                    console.log(result.status_message);
                    $("#payment-form").submit();
                }
            });
        }
    });
});
   </script>