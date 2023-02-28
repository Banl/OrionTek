package com.clientbox.clientbox.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clientbox.clientbox.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long> {

}
