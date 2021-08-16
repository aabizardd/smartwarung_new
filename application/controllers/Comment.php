<?php
defined('BASEPATH') or exit('No direct script access allowed');

class comment extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('templates');
    }

    public function index()
    {
        $data['categories'] = $this->categories->get_all();
        $data['items'] = $this->categories->get_all_items();

        $this->load->view('template/header');
        $this->load->view('category/index', $data);
        $this->load->view('template/footer');
    }
    public function send()
    {

        $captcha = $this->input->post('g-recaptcha-response');

        if ($captcha != "") {
            $secret = '6Lf2K4sbAAAAAAqozp2o5VnP9MB08HT0T0WkmdLj';
            $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . $secret . '&response=' . $captcha);
            $responseData = json_decode($verifyResponse);

            if ($responseData->success) {

                $config['upload_path'] = 'assets/kritik/';
                $config['allowed_types'] = 'jpg|jpeg|png';
                $config['max_size'] = '5000';
                $config['encrypt_name'] = true;

                $this->load->library('upload', $config);

                if ($this->upload->do_upload('file')) {
                    $upload_data = $this->upload->data();
                    $data = array(
                        'photo' => $upload_data['file_name'],
                    );

                    // $this->session->set_flashdata('success','Foto profile berhasil diperbarui');
                    // redirect('profile');
                    $data = [
                        'sender_name' => $this->input->post('name'),
                        'username' => $this->input->post('usname'),
                        'to_whom' => $this->input->post('to_whom'),
                        'message' => $this->input->post('comment'),
                        'rating' => $this->input->post('rating'),
                        'foto' => $upload_data['file_name'],
                    ];

                    $check_id = $this->templates->insert_id('comments', $data);
                    if ($check_id == null) {
                        echo json_encode(['status' => 'success']);
                        redirect('hubungi');
                    } else {
                        echo json_encode(['status' => 'error']);
                        redirect('hubungi');
                    }
                    $this->session->set_flashdata('success', 'Komentar berhasil dikirim');
                } else {
                    // $this->session->set_flashdata('errors','Foto profile gagal diperbarui');
                    echo json_encode(['status' => 'error']);
                    $this->session->set_flashdata('errors', 'Komentar gagal dikirim');
                    redirect('hubungi');
                }
            }
        }
    }

    public function send_review_warung()
    {

        $captcha = $this->input->post('g-recaptcha-response');

        if ($captcha != "") {
            $secret = '6Lf2K4sbAAAAAAqozp2o5VnP9MB08HT0T0WkmdLj';
            $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . $secret . '&response=' . $captcha);
            $responseData = json_decode($verifyResponse);

            if ($responseData->success) {

                $config['upload_path'] = 'assets/kritik/';
                $config['allowed_types'] = 'jpg|jpeg|png';
                $config['max_size'] = '5000';
                $config['encrypt_name'] = true;

                $this->load->library('upload', $config);

                if ($this->upload->do_upload('file')) {
                    $upload_data = $this->upload->data();
                    $data = array(
                        'photo' => $upload_data['file_name'],
                    );

                    // $this->session->set_flashdata('success','Foto profile berhasil diperbarui');
                    // redirect('profile');
                    $data = [
                        'sender_name' => $this->input->post('name'),
                        'username' => $this->input->post('usname'),
                        'to_whom' => $this->input->post('to_whom'),
                        'message' => $this->input->post('comment'),
                        'rating' => $this->input->post('rating'),
                        'foto' => $upload_data['file_name'],
                    ];

                    $this->templates->insert_id('review_warung', $data);

                    $this->session->set_flashdata('success', '<div class="alert alert-success alert-dismissible fade show" role="alert">
					<strong>Selamat!</strong> Review berhasil diberikan.
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				  	</div>');

                    redirect('profile/show/' . $data['to_whom']);
                } else {
                    // $this->session->set_flashdata('errors','Foto profile gagal diperbarui');
                    echo json_encode(['status' => 'error']);
                    $this->session->set_flashdata('errors', 'Komentar gagal dikirim');
                    redirect('hubungi');
                }
            }
        }
    }

}