<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ratings extends CI_Model
{
    public function store($data)
    {
        return $this->db->insert('ratings', $data);
    }

    public function get($id)
    {
        $this->db->select_avg('rating');
        $this->db->where('item', $id);
        return $this->db->get('reviews')->row_array();
    }

    public function rate_warung($username)
    {
        $this->db->select_avg('rating');
        $this->db->where('to_whom', $username);
        return $this->db->get('comments')->row_array();
    }

    public function is_exist($item)
    {
        $this->db->where('item', $item);
        if ($this->db->get('ratings')->result_array() != null) {
            return true;
        } else {
            return false;
        }
    }
}