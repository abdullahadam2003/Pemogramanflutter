/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Adam.mahasiswa.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.Adam.mahasiswa.entity.Mahasiswa;
import java.util.Optional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author adam
 */
@Repository
public interface MahasiswaRepository extends JpaRepository<Mahasiswa,Long> {

    public Optional<Mahasiswa> findMahasiswaByEmail(String email);
    
}