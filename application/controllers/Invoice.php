<?php
defined('BASEPATH') or exit('No direct script access allowed');

class invoice extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->model('items');
        $this->load->model('carts');
        $this->load->model('warungs');
        $this->load->model('invoices');
        $this->load->model('templates');

        $this->load->helper('cookie');

        // var_dump($this->session->userdata('username'));die();

    }

    public function upd_invoice($id)
    {
        $data = [
            'status_code' => 200,
        ];
        $this->db->update('invoices', $data, ['id' => $id]);

        redirect('profile/order');
    }

    public function create()
    {

        $checkouts = get_cookie('checkout');
        // var_dump($checkout);die();

        if ($checkouts == "") {
            $this->session->set_flashdata('errors', 'Pilih barang yang ingin anda checkout!');
            redirect('cart');
        }

        $checkout = explode('-', $checkouts);
        // var_dump($checkout);die();

        $data['carts'] = $this->carts->get_all($this->session->userdata('username'), $checkout);

        $data['bank'] = $this->templates->view_where('bank_accounts', ['warung_username' => 'admin'])->result();

        foreach ($data['carts'] as $item) {
            if ($item['warung_username'] != $data['carts'][0]['warung_username']) {
                $this->session->set_flashdata('errors', 'Barang yang dibeli harus dari warung yang sama!');
                redirect('cart');
            }
        }
        $data['warungs'] = $this->warungs->get_users_warung($data['carts'][0]['username_warung']);
        $data['user'] = $this->users->get_username($this->session->userdata('username'));
        // print_r($data['warungs']);

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('invoice/create', $data);
        $this->load->view('include/footer');
        $this->load->view('invoice/script');
    }

    public function store()
    {
        $jarak = $this->input->post('distance');

        if ($jarak > 2) {

            $this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<strong>Maaf!</strong> jarak terlalu jauh, maksimal jarak yaitu 2 Kilometer (KM).
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  	</div>');

            redirect('invoice/create');
        } else {

            $this->invoices->store();

            redirect('profile/order');
        }
    }

    public function update_to_process($id)
    {
        $data = array(
            'status' => 'Sedang dikirim',
        );

        $this->db->where('id', $id);
        $this->db->update('invoices', $data);

        redirect('profile/order');
    }

    public function update_to_done($id)
    {
        $data = array(
            'status' => 'Sudah diterima',
        );

        $this->db->where('id', $id);
        $this->db->update('invoices', $data);

        redirect('profile/order');
    }

    public function cancel($id)
    {
        $data = array(
            'status' => 'Dibatalkan',
        );

        $this->db->where('id', $id);
        $this->db->update('invoices', $data);

        $dataStock['item'] = $this->invoices->get_invoice_details_items($id);
        foreach ($dataStock['item'] as $item) {
            $dataItem = array(
                'stock' => $item['item_stock'] + $item['quantity'],
            );
            $this->db->where('id', $item['item_id']);
            $this->db->update('items', $dataItem);
        }

        redirect('profile/order');
    }

    public function tes()
    {

        $this->load->view('invoice/tes');
        $this->load->view('invoice/script');
    }
}