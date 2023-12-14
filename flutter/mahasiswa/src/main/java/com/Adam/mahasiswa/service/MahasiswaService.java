/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Adam.mahasiswa.service;

import com.Adam.mahasiswa.entity.Mahasiswa;
import com.Adam.mahasiswa.repository.MahasiswaRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author adam
 */
@Service
public class MahasiswaService {
    private final MahasiswaRepository mahasiswaRepository;

    @Autowired
    public MahasiswaService(MahasiswaRepository mahasiswaRepository) {
        this.mahasiswaRepository = mahasiswaRepository;
    }
    
    public List<Mahasiswa> getAllMahasiswa(){
        return mahasiswaRepository.findAll();
    } 
    
    public void insertMahasiswa(Mahasiswa mahasiswa){
        Optional<Mahasiswa> mahasiswaOptional = 
                mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if(mahasiswaOptional.isPresent()){
            throw new IllegalStateException("Email sudah ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
    
}