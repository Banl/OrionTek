package com.clientbox.clientbox.model;

import jakarta.persistence.*;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;

@Table
@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Column
    private String Address;
    @Column
    private String City;
    @Column
    private String Country;
    @Column
    private String ZipCode;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clinet_id")    
    private Client Client;

    public Address(Client client) {
        Client = client;
    }
    
    public Address() {
    }
    public Client getClient() {
        return Client;
    }
    public void setClient(Client client) {
        Client = client;
    }

    public Long getId() {
        return Id;
    }
    public void setId(Long id) {
        Id = id;
    }
    public String getAddress() {
        return Address;
    }
    public void setAddress(String address) {
        Address = address;
    }
    public String getCity() {
        return City;
    }
    public void setCity(String city) {
        City = city;
    }
    public String getCountry() {
        return Country;
    }
    public void setCountry(String country) {
        Country = country;
    }
    public String getZipCode() {
        return ZipCode;
    }
    public void setZipCode(String zipCode) {
        ZipCode = zipCode;
    }
    @Override
    public String toString() {
        return "Address [Id=" + Id + ", Address=" + Address + ", Client=" + Client + ", City=" + City + ", Country=" + Country + ", ZipCode="
                + ZipCode + "]";
    }
    
}
