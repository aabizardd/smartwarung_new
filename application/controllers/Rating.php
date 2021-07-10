<?php
defined('BASEPATH') or exit('No direct script access allowed');

class rating extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('items');
        $this->load->model('ratings');
        $this->load->model('reviews');
    }

    public function create($item, $invoice_id)
    {
        $data['item'] = $this->items->get_one_id1($item);
        $data['user'] = $this->users->get_username($this->session->userdata('username'));
        $data['invoice_id'] = $invoice_id;

        // var_dump($data['item']);die();

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('rating/create', $data);
        $this->load->view('include/footer');
    }

    public function store($item)
    {
        // $rating = array(
        //     'username' => $this->session->userdata('username'),
        //     'item' => $item,
        //     'rating' => $this->input->post('rating'),
        // );
        $review = array(
            'invoice_id' => $this->input->post('invoice_id'),
            'username' => $this->session->userdata('username'),
            'item' => $item,
            'review' => $this->input->post('review'),
            'rating' => $this->input->post('rating'),
        );

        $this->db->update('invoices', ['status' => 'Sudah diterima dan diulas'], ['id' => $this->input->post('invoice_id')]);
        $this->reviews->store($review);

        $this->session->set_flashdata('success', 'Rating dan review telah ditambahkan');
        redirect('profile/order/');
    }
}