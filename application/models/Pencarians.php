<?php
defined('BASEPATH') or exit('No direct script access allowed');

class pencarians extends CI_Model
{

    public function pencarian_d($kategori, $nama)
    {
        $this->db->select('*');
        $this->db->from('items');
        $this->db->where("category", $kategori);
        $this->db->like('name', $nama, 'both');
        return $this->db->get()->result_array();
    }

    public function pencarian_c($nama)
    {
        $this->db->select('*');
        $this->db->from('items');
        $this->db->like('name', $nama, 'both');
        return $this->db->get()->result_array();
    }

    public function rekom_d($kategori, $budmin, $budmax)
    {
        $this->db->select('*');
        $this->db->from('items');
        $this->db->where('price >=', $budmin);
        $this->db->where('price <=', $budmax);
        $this->db->where_in("category", $kategori);
        return $this->db->get()->result_array();
    }

    public function rekom_c($budmin, $budmax)
    {
        $this->db->select('*');
        $this->db->from('items');
        $this->db->where('price >=', $budmin);
        $this->db->where('price <=', $budmax);
        return $this->db->get()->result_array();
    }

}