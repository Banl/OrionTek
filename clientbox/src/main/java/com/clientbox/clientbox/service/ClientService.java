package com.clientbox.clientbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clientbox.clientbox.model.Client;
import com.clientbox.clientbox.repository.ClientRepository;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;

    public List<Client> obtenerClientes() {
        return clientRepository.findAll();
    }

    public Client obtenerClient(Long id) {
        return clientRepository.findById(id).orElse(null);
    }

    public Client agregarClient(Client client) {
        return clientRepository.save(client);
    }

    public Client actualizarClient(Client client) {
        return clientRepository.save(client);
    }

    public void eliminarClient(Long id) {
        clientRepository.deleteById(id);
    }
}
