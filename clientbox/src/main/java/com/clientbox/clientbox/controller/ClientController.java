package com.clientbox.clientbox.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clientbox.clientbox.model.Client;
import com.clientbox.clientbox.service.ClientService;

@RestController
@RequestMapping("/clients")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @GetMapping
    public List<Client> obtenerClientes() {
        return clientService.obtenerClientes();
    }

    @GetMapping("/{id}")
    public Client obtenerCliente(@PathVariable Long id) {
        return clientService.obtenerClient(id);
    }

    @PostMapping
    public Client agregarCliente(@RequestBody Client client) {
         return clientService.agregarClient(client);
    }

    @PutMapping
    public Client actualizarCliente(@RequestBody Client client) {
        return clientService.actualizarClient(client);
    }
    @DeleteMapping("/{id}")
    public void eliminarCliente(@PathVariable Long id) {
        clientService.eliminarClient(id);
    }
    
}
