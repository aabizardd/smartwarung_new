<?php
defined('BASEPATH') or exit('No direct script access allowed');

class hubungi extends CI_Controller
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

        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['user'] = $this->users->get_username($this->session->userdata('username'));

        $this->load->view('include/meta');
        $this->load->view('include/header');
        $this->load->view('include/topbar', $data);
        $this->load->view('include/responsive');
        $this->load->view('include/detail_chart');
        $this->load->view('home/hubungi');
        $this->load->view('include/add_chart');
        $this->load->view('include/footer');
    }

    public function req_aktif()
    {
        $data['user'] = $this->users->get_username($this->session->userdata('username'));

        $this->form_validation->set_rules('nama', 'Name', 'required|trim', [
            'required' => 'Nama Lengkap tidak boleh kosong',
        ]);

        $this->form_validation->set_rules('akun', 'Akun', 'required|trim', [
            'required' => 'Akun tidak boleh kosong',
        ]);

        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email', [
            'required' => 'Email tidak boleh kosong',
            'valid_email' => 'Email tidak valid',
        ]);

        $this->form_validation->set_rules('no_hp', 'Nomor Handphone', 'required|trim|min_length[9]|max_length[15]', [
            'required' => 'Nomor Handphone tidak boleh kosong',
            'min_length' => 'Nomor Handphone harus lebih dari 9 angka',
            'max_length' => 'Nomor Handphone harus kurang dari 15 angka',
        ]);

        $this->form_validation->set_rules('kendala', 'Kendala', 'required|trim', [
            'required' => 'Kendala tidak boleh kosong',
        ]);

        if ($this->form_validation->run() == false) {

            $this->load->view('include/meta');
            $this->load->view('include/header');
            $this->load->view('include/topbar', $data);
            $this->load->view('include/responsive');
            $this->load->view('include/detail_chart');
            $this->load->view('home/req_aktif');
            $this->load->view('include/add_chart');
            $this->load->view('include/footer');
        } else {

            $this->add_pengajuan();

        }
    }
    public function add_pengajuan()
    {
        $nama_lengkap = htmlspecialchars($this->input->post('nama', true));
        $username = htmlspecialchars($this->input->post('akun', true));
        $email = htmlspecialchars($this->input->post('email', true));
        $no_hp = htmlspecialchars($this->input->post('no_hp', true));
        $kendala = htmlspecialchars($this->input->post('kendala', true));

        $data = [
            'nama_lengkap' => $nama_lengkap,
            'username' => $username,
            'email' => $email,
            'no_hp' => $no_hp,
            'kendala' => $kendala,
            'bukti' => $this->_uploadFile(),
        ];

        $this->db->insert('pengajuan_aktifasi_akun', $data);

        $this->session->set_flashdata('success', 'Berhasil mengajukan permohonan pengembalian akun');

        redirect('hubungi/req_aktif');

    }

    private function _uploadFile()
    {
        $namaFiles = $_FILES['file']['name'];
        $ukuranFile = $_FILES['file']['size'];
        $type = $_FILES['file']['type'];
        $eror = $_FILES['file']['error'];

        // $nama_file = str_replace(" ", "_", $namaFiles);
        $tmpName = $_FILES['file']['tmp_name'];
        // $nama_folder = "assets_user/file_upload/";
        // $file_baru = $nama_folder . basename($nama_file);

        // if ((($type == "video/mp4") || ($type == "video/3gpp")) && ($ukuranFile < 8000000)) {

        //   move_uploaded_file($tmpName, $file_baru);
        //   return $file_baru;
        // }

        if ($ukuranFile > 5000000) {
            $this->session->set_flashdata('errors', 'Ukuran file terlalu besar, minimal 5 Mb');

            redirect('hubungi/req_aktif');

            return false;
        }

        if ($eror === 4) {

            $this->session->set_flashdata('errors', 'Pilih file terlebih dahulu');

            redirect('hubungi/req_aktif');

            return false;
        }

        $ekstensiGambarValid = ['jpg', 'jpeg', 'png', 'pdf'];
        $ekstensiGambar = explode('.', $namaFiles);
        $ekstensiGambar = strtolower(end($ekstensiGambar));
        if (!in_array($ekstensiGambar, $ekstensiGambarValid)) {
            $this->session->set_flashdata('errors', 'Yang kamu upload bukan foto/pdf');

            redirect('hubungi/req_aktif');
            return false;
        }

        $namaFilesBaru = uniqid();
        $namaFilesBaru .= '.';
        $namaFilesBaru .= $ekstensiGambar;

        move_uploaded_file($tmpName, 'assets_admin/foto_pengajuan/' . $namaFilesBaru);

        return $namaFilesBaru;
    }

}