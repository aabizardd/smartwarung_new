<?php
defined('BASEPATH') or exit('No direct script access allowed');

class items extends CI_Model
{

    public function store($username, $photo)
    {
        $data = array(
            'username' => $username,
            'name' => $this->input->post('name'),
            'category' => $this->input->post('category'),
            'stock' => $this->input->post('stock'),
            'price' => $this->input->post('price'),
            'description' => $this->input->post('description'),
            'photo' => $photo,
        );

        $this->db->insert('items', $data);
    }

    public function get_one_id1($id)
    {
        $this->db->where('id', $id);
        return $this->db->get('items')->row_array();
    }

    public function get_one_id($id)
    {
        $this->db->select('*');
        $this->db->from('items i');
        $this->db->join('warungs w', 'i.username = w.username');
        $this->db->where('i.id', $id);
        return $this->db->get()->row_array();
    }

    public function get_all()
    {
        return $this->db->query('SELECT * FROM `items` JOIN warungs ON warungs.username=items.username WHERE warungs.is_aktif = 1 AND warungs.status="Sudah diverifikasi"')->result_array();
    }
    public function get_all_()
    {
        $this->db->where('hide', 0);
        $this->db->order_by('id', 'RANDOM');
        return $this->db->get('items')->result_array();
    }

    public function get_all_username($username)
    {
        $this->db->where('username', $username);
        return $this->db->get('items')->result_array();
    }

    public function update($id)
    {
        $data = array(
            'name' => $this->input->post('name'),
            'stock' => $this->input->post('stock'),
            'price' => $this->input->post('price'),
            'description' => $this->input->post('description'),
            'category' => $this->input->post('category'),
            'discount' => $this->input->post('discount'),
        );

        $this->db->where('id', $id);
        if ($this->db->update('items', $data)) {
            return true;
        } else {
            return false;
        }
    }

    public function delete($id)
    {
        $this->db->where('id', $id);
        if ($this->db->delete('items')) {
            return true;
        } else {
            return false;
        }
    }
    public function search_item_like($id, $item)
    {
        return $this->db->query('SELECT MATCH (name) AGAINST("' . $item . '") AS relevance,id,username,name,category,stock,price,description,photo,username as warung FROM `items` WHERE MATCH (name) AGAINST("' . $item . '") AND username != "' . $id . '"
        ORDER BY `relevance` DESC LIMIT 5');
    }

    public function search_item_like_new($id, $category)
    {
        $this->db->select('items.id,username,name,category,stock,price,description,photo,username as warung, lng, lat');
        $this->db->from('items');
        $this->db->join('warungs', 'username');
        $this->db->where("category", $category);
        //$this->db->where("username" != $id);
        return $this->db->get();
    }

    public function search_item_warung($id, $warung)
    {
        return $this->db->query('SELECT items.id,items.username,items.name,items.category,items.stock,items.price,items.description,items.photo FROM `items` LEFT JOIN ratings ON ratings.item=items.id WHERE items.username = "' . $warung . '" AND items.id != ' . $id . ' ORDER BY ratings.rating DESC LIMIT 4');
    }

    public function get_info_terima()
    {

        // SELECT count(warung) FROM `invoices` WHERE status = "Sedang dikirim" GROUP BY warung

        $this->db->select('count(user) jml');
        $this->db->from('invoices');
        $this->db->where('status', 'Sedang dikirim');
        $this->db->where('user', $this->session->userdata('username'));
        $this->db->group_by('user');

        return $this->db->get();

    }

}