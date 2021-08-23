<?php
defined('BASEPATH') or exit('No direct script access allowed');

class templates extends CI_Model
{
    public function insert($tabel, $data)
    {
        $this->db->insert($tabel, $data);
        // return $this->db->insert_id();
    }
    public function insert_id($tabel, $data)
    {
        $this->db->insert($tabel, $data);
        return $this->db->insert_id();
    }
    public function update($tabel, $where, $data)
    {
        $this->db->where($where);
        return $this->db->update($tabel, $data);
    }
    public function delete($tabel, $where)
    {
        $this->db->where($where);
        return $this->db->delete($tabel);
    }
    public function view_where($tabel, $where, $id_kat = null)
    {

        $this->db->where($where);

        if (!is_null($id_kat)) {
            $this->db->where('category', $id_kat);
        }

        return $this->db->get($tabel);
    }

    public function getWarungUser($where)
    {
        $this->db->select('*');
        $this->db->from('warungs w');
        $this->db->join('users u', 'username');
        $this->db->where($where);

        return $this->db->get();
    }

    public function view_where_desc($tabel, $where, $order)
    {
        $this->db->where_in($where);
        $this->db->order_by($order, "desc");
        return $this->db->get($tabel);
    }
    public function view_desc($tabel, $order)
    {
        $this->db->order_by($order, "desc");
        return $this->db->get($tabel);
    }
    public function view($tabel)
    {
        return $this->db->get($tabel);
    }
    public function query($query)
    {
        return $this->db->query($query);
    }
    public function join($tabel, $using, $with)
    {
        $this->db->select('*');
        $this->db->from($tabel);
        $this->db->join($with, $using);
        $query = $this->db->get();
        return $query;
    }
    public function join_where($tabel, $using, $with, $where)
    {
        $this->db->select('*');
        $this->db->from($tabel);
        $this->db->join($with, $using);
        $this->db->where($where);
        $query = $this->db->get();
        return $query;
    }
    public function view_limit($tabel, $limit, $start)
    {
        $query = $this->db->get($tabel, $limit, $start);
        return $query;
    }
    public function view_limit_where($tabel, $limit, $start, $where)
    {
        $this->db->where($where);
        $query = $this->db->get($tabel, $limit, $start);
        return $query;
    }

    public function get_full_data_warung($id)
    {

        $this->db->select('*');
        $this->db->from('warungs w');
        $this->db->join('users', 'username');
        $this->db->where('w.id', $id);

        return $this->db->get();
    }
}