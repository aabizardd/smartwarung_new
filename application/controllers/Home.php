<?php
defined('BASEPATH') or exit('No direct script access allowed');

class home extends CI_Controller
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
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('items');
        $this->load->model('templates');
        $this->load->model('users');
        if ($this->session->role == 99) {
            redirect('admin');
        }

    }

    public function index()
    {
        $data['items'] = $this->items->get_all_();

        // var_dump($data['items']);die();

        $data['warungs'] = $this->users->get_warungs();
        $data['user'] = $this->users->get_username($this->session->userdata('username'));
        $data['week_sale'] = $this->templates->view_where('items', ['is_week_sale' => 1])->result_array();
        $data['order_terima'] = $this->items->get_info_terima()->row_array();

        // $_COOKIE['lontt'] = 2;
        // $_COOKIE['longg'] = 2;

        // var_dump($_COOKIE['lontt']);die();

        // var_dump($this->session->userdata('username'));die();

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/index', $data);
        $this->load->view('include/add_chart');
        $this->load->view('include/footer');
    }
    public function week_sale($id_kategori = null)
    {
        $data['categories'] = $this->categories->get_all();

        $data['week_sale'] = $this->templates->view_where('items', ['is_week_sale' => 1], $id_kategori)->result_array();

        $data['user'] = $this->users->get_username($this->session->userdata('username'));

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/week_sale', $data);
        $this->load->view('include/add_chart');
        $this->load->view('include/footer');
    }
    public function pencarian()
    {

        $kategori = $this->input->get('kategori');
        $nama = $this->input->get('nama');

        if ($kategori == 0) {
            $data['user'] = $this->users->get_username($this->session->userdata('username'));
            $data['hasil'] = $this->pencarians->pencarian_c($nama);
        } else {
            $data['user'] = $this->users->get_username($this->session->userdata('username'));
            $data['hasil'] = $this->pencarians->pencarian_d($kategori, $nama);
        }

        $this->session->set_flashdata('success', 'Barang pencarian telah ditampilkan.');

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/pencarian', $data);
        $this->load->view('include/add_chart');
        $this->load->view('include/footer');
    }

    public function rekomendasi()
    {

        $data['categories'] = $this->categories->get_all();
        $data['items'] = $this->categories->get_all_items();
        $data['user'] = $this->users->get_username($this->session->userdata('username'));

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/rekomendasi', $data);
        $this->load->view('include/footer');
    }

    public function hasil()
    {

        $kategoris = $this->input->post('kategori');

        $kategori = explode(",", $kategoris);

        // var_dump($kategori[0]);die();

        $budmin = $this->input->post('budmin');
        $budmax = $this->input->post('budmax');

        $data['categories'] = $this->categories->get_all();
        if ($kategori[0] == "") {
            $data['user'] = $this->users->get_username($this->session->userdata('username'));
            $data['hasil'] = $this->pencarians->rekom_c($budmin, $budmax);
        } else {
            $data['user'] = $this->users->get_username($this->session->userdata('username'));
            $data['hasil'] = $this->pencarians->rekom_d($kategori, $budmin, $budmax);
        }

        $this->session->set_flashdata('success', 'Barang rekomendasi telah ditampilkan.');

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/hasil', $data);
        $this->load->view('include/add_chart');
        $this->load->view('include/footer');
    }
}