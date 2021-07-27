<?php
defined('BASEPATH') or exit('No direct script access allowed');

class users extends CI_Model
{
    public function store($username)
    {
        if ($this->get_username($username) == null) {
            $data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'password' => md5($this->input->post('password')),
                'phone' => $this->input->post('phone'),
                'email' => $this->input->post('email'),
                'role' => 0,
                'is_aktif_cust' => 0,
            );

            return $this->db->insert('users', $data);
        } else {
            return;
        }

    }
    public function invoice_warung_graph()
    {
        return $this->db->query('SELECT COUNT(*) as total, warung FROM `invoices` JOIN warungs ON warungs.username = invoices.warung WHERE invoices.status LIKE "Sudah%" AND invoices.date LIKE "' . date('Y-m') . '%" GROUP BY invoices.warung');
    }
    public function invoice_buyer_graph()
    {
        return $this->db->query('SELECT COUNT(*) AS total, users.name FROM `invoices` JOIN users ON users.username=invoices.user WHERE users.role = 0 AND invoices.status LIKE "Sudah%" AND invoices.date LIKE "' . date('Y-m') . '%" GROUP BY users.name LIMIT 10');
    }
    public function invoice_status_graph()
    {
        return $this->db->query('SELECT COUNT(*) AS total, invoices.status FROM `invoices` WHERE invoices.date LIKE "' . date('Y-m') . '%" GROUP BY invoices.status');
    }
    public function get_billing_warung()
    {
        return $this->db->query('SELECT SUM(invoices.billing) AS total,warungs.username as warung FROM warungs LEFT JOIN invoices ON invoices.warung=warungs.username WHERE invoices.date LIKE "' . date('Y-m') . '%" GROUP BY warungs.username');
    }
    public function get_billing()
    {
        return $this->db->query('SELECT SUM(invoices.billing) AS total,warungs.username FROM warungs LEFT JOIN invoices ON invoices.warung=warungs.username WHERE invoices.method="Transfer" AND invoices.status ="Sudah diterima" GROUP BY warungs.username');
    }
    public function get_billing_cash()
    {
        return $this->db->query('SELECT SUM(invoices.billing) AS total,warungs.username FROM warungs LEFT JOIN invoices ON invoices.warung=warungs.username WHERE invoices.method="COD" AND invoices.status ="Sudah diterima" GROUP BY warungs.username');
    }

    public function store_warung($username, $photo, $ktp)
    {

        if ($this->get_username($username) == null) {

            $data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'password' => md5($this->input->post('password')),
                'phone' => $this->input->post('phone'),
                'email' => $this->input->post('email'),
                'role' => 1,
                'photo' => $photo,

            );

            $data_warung = array(
                'address' => $this->input->post('address'),
                'place_id' => $this->input->post('place_id'),
                'lat' => $this->input->post('lat'),
                'lng' => $this->input->post('lng'),
                'username' => $this->input->post('username'),
                'status' => 'Belum diverifikasi',
                'ktp' => $ktp,
            );

            $this->db->insert('users', $data);
            $this->db->insert('warungs', $data_warung);
            print_r($data_warung);
        }
    }

    public function get_username($username)
    {
        //$this->db->join('warungs','users.username = warungs.username');
        //$this->db->where('users.username', $username);
        $this->db->where('username', $username);
        return $this->db->get('users')->row_array();
    }

    public function get_users()
    {
        $this->db->from('users');
        $this->db->where('role', 0);
        return $this->db->get()->result_array();
    }

    public function get_warungs()
    {
        $this->db->from('users');
        $this->db->join('warungs', 'users.username = warungs.username');
        $this->db->where(["warungs.is_aktif" => 1, "warungs.status" => "Sudah diverifikasi"]);
        $this->db->order_by('updated_at', 'DESC');
        return $this->db->get()->result_array();
    }

    public function get_income_warung()
    {
        $this->db->select(' w.username nama_warung, address, count(i.warung) jumlah_transaksi, sum(billing) income');
        $this->db->from('invoices i');
        $this->db->join('warungs w', 'i.warung = w.username', 'left');
        $this->db->where_in('i.status', ['200', 'Sudah diterima dan diulas']);
        // $this->db->order_by('updated_at', 'DESC');
        $this->db->group_by('i.warung');
        return $this->db->get()->result();
    }

    public function get_income_warung_except($data)
    {
        $this->db->select('w.username nama_warung, address');
        $this->db->from('warungs w');
        $this->db->where('is_aktif', 1);
        $this->db->where_not_in('w.username', $data);
        // $this->db->order_by('updated_at', 'DESC');
        // $this->db->group_by('w..username');
        return $this->db->get()->result();
    }

    public function get_warungs_all()
    {
        $this->db->from('users');
        $this->db->join('warungs', 'users.username = warungs.username');
        $this->db->order_by('updated_at', 'DESC');
        return $this->db->get()->result_array();
    }

    public function get_user_warung($username)
    {
        $this->db->from('users');
        $this->db->join('warungs', 'users.username = warungs.username');
        $this->db->where('users.username', $username);
        return $this->db->get()->row_array();
    }

    public function update($username)
    {
        $data = array(
            'username' => $this->input->post('username'),
            'name' => $this->input->post('name'),
            'phone' => $this->input->post('phone'),
            'email' => $this->input->post('email'),
        );

        $this->db->where('username', $username);
        return $this->db->update('users', $data);
    }

    public function update_password($username)
    {
        $data = array(
            'password' => md5($this->input->post('password')),
        );

        $this->db->where('username', $username);
        return $this->db->update('users', $data);
    }

    public function get_password($username)
    {
        $this->db->select('password');
        $this->db->where('username', $username);
        return $this->db->get('users')->row_array();
    }

    public function get_all_review_pesanan()
    {

        $query = "SELECT r.username pembeli, i.username nama_toko, i.name barang, review, rating FROM reviews r JOIN items i on r.item = i.id";

        return $this->db->query($query);
    }

    public function getComments($where)
    {
        $this->db->from('comments');
        $this->db->join('users', 'users.username = comments.username');
        $this->db->where($where);
        return $this->db->get();
    }

    public function getBarangCategories()
    {

        $this->db->select('*, c.name nama_kategori, i.id id_barang, i.name name_barang');
        $this->db->from('items i');
        $this->db->join('categories c', 'i.category = c.id');
        return $this->db->get();
    }

    public function getTransactionUsers()
    {

        $this->db->select('*, COUNT(i.user) jml');
        $this->db->from('users u');
        $this->db->join('invoices i', 'u.username = i.user', 'LEFT');
        $this->db->where('role', 0);
        $this->db->where('is_aktif_cust', 1);
        $this->db->group_by('u.username');
        $this->db->order_by('jml DESC');
        return $this->db->get()->result_array();
    }

    public function get_warungs_all_transaction()
    {
        $this->db->select('*, COUNT(i.warung) jml');
        $this->db->from('users');
        $this->db->join('warungs', 'users.username = warungs.username');
        $this->db->join('invoices i', 'users.username = i.warung', 'LEFT');
        $this->db->group_by('users.username');
        $this->db->order_by('jml', 'DESC');
        return $this->db->get()->result_array();
    }

}