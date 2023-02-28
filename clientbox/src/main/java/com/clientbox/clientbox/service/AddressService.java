package com.clientbox.clientbox.service;

import org.springframework.stereotype.Service;
import com.clientbox.clientbox.model.Address;
import com.clientbox.clientbox.repository.AddressRepository;

@Service
public class AddressService{
    private AddressRepository addressRepository;

    public Address agregarDireccion(Address Address) {
        return addressRepository.save(Address);
    }

    public Address actualizarDireccion(Address Address) {
        return addressRepository.save(Address);
    }

    public void eliminarDireccion(Long id) {
        addressRepository.deleteById(id);
    }
}
