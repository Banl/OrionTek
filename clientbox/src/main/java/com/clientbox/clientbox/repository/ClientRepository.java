package com.clientbox.clientbox.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clientbox.clientbox.model.Client;

public interface ClientRepository extends JpaRepository<Client, Long> {}
