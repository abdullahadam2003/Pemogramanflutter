/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.adam.matakuliah.service;

import com.adam.matakuliah.entity.Matakuliah;
import com.adam.matakuliah.repository.MatakuliahRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author abdullah adam
 */
@Service
public class MatakuliahService {
    private final MatakuliahRepository matakuliahRepository;
    @Autowired
    public MatakuliahService(MatakuliahRepository matakuliahRepository){
        this.matakuliahRepository = matakuliahRepository;
    }
    
    public Matakuliah getMatakuliah(Long idmahasiswa){
        return matakuliahRepository.findById(idmahasiswa).get();
    }
    
    public List<Matakuliah> getAll(){
        return matakuliahRepository.findAll();
    }
    
   public void insert(Matakuliah matakuliah){
        Optional<Matakuliah> matakuliahOptional = 
                matakuliahRepository.findMatakuliahById(matakuliah.getId());
        if(matakuliahOptional.isPresent()){
            throw new IllegalStateException("Email Sudah Ada");
        }
        matakuliahRepository.save(matakuliah);
    }
}

