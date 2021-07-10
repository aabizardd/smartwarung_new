<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS");

class Snap extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *         http://example.com/index.php/welcome
     *    - or -
     *         http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */

    public function __construct()
    {
        parent::__construct();
        $params = array('server_key' => 'SB-Mid-server-rfb2hIFmc55AHhul7jh35ozq', 'production' => false);
        $this->load->library('midtrans');
        $this->midtrans->config($params);
        $this->load->helper('url');

        $this->load->model('items');
        $this->load->model('carts');
        $this->load->model('warungs');
        $this->load->model('invoices');
        $this->load->model('templates');
    }

    public function index()
    {
        $this->load->view('checkout_snap');
    }

    public function token()
    {

        $delivery_fee = $this->input->post('delivery_fee');
        $total_price = $this->input->post('total_price');
        $destination = $this->input->post('destination');

        // Required
        $transaction_details = array(
            'order_id' => uniqid('invoice'),
            'gross_amount' => $total_price, // no decimal allowed for creditcard
        );

        // Optional
        $item1_details = array(
            'id' => 'a1',
            'price' => $total_price - $delivery_fee,
            'quantity' => 1,
            'name' => "Semuan barang pesanan",
        );

        // Optional
        $item2_details = array(
            'id' => 'a2',
            'price' => $delivery_fee,
            'quantity' => 1,
            'name' => "Ongkos Kirim",
        );

        // Optional
        $item_details = array($item1_details, $item2_details);

        //ambil data user berdasarkan session usernamenya
        $user = $this->session->userdata('username');

        $data_user = $this->db->get_where('users', ['username' => $user])->row_array();

        // Optional
        $billing_address = array(
            'first_name' => $data_user['name'],
            'last_name' => "",
            'address' => $destination,
            'city' => "",
            'postal_code' => "",
            'phone' => $data_user['phone'],
            'country_code' => 'IDN',
        );

        // Optional
        $shipping_address = array(
            'first_name' => $data_user['name'],
            'last_name' => "",
            'address' => $destination,
            'city' => "",
            'postal_code' => "",
            'phone' => $data_user['phone'],
            'country_code' => 'IDN',
        );

        // Optional
        $customer_details = array(
            'first_name' => $data_user['name'],
            'last_name' => "",
            'email' => $data_user['email'],
            'phone' => $data_user['phone'],
            'billing_address' => $billing_address,
            'shipping_address' => $shipping_address,
        );

        // Data yang akan dikirim untuk request redirect_url.
        $credit_card['secure'] = true;
        //ser save_card true to enable oneclick or 2click
        //$credit_card['save_card'] = true;

        $time = time();
        $custom_expiry = array(
            'start_time' => date("Y-m-d H:i:s O", $time),
            'unit' => 'hour',
            'duration' => 1,
        );

        $transaction_data = array(
            'transaction_details' => $transaction_details,
            'item_details' => $item_details,
            'customer_details' => $customer_details,
            'credit_card' => $credit_card,
            'expiry' => $custom_expiry,
        );

        error_log(json_encode($transaction_data));
        $snapToken = $this->midtrans->getSnapToken($transaction_data);
        error_log($snapToken);
        echo $snapToken;
    }

    public function finish()
    {
        $result = json_decode($this->input->post('result_data'), true);
        // echo 'RESULT <br><pre>';
        // var_dump($result);
        // echo '</pre>';

        $this->invoices->store($result);
        redirect('profile/order');

    }
}