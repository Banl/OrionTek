package com.clientbox.clientbox.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Table
@Entity
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Column
    private String Name;
    @Column
    private String Email;
    @Column
    private String PhoneNum;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "Clinte.id")
    private List<Address> Address= new ArrayList<Address>();

    public Long getId() {
        return Id;
    }
    public void setId(Long id) {
        Id = id;
    }
    public String getName() {
        return Name;
    }
    public void setName(String name) {
        this.Name = name;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String email) {
        Email = email;
    }
    public String getPhoneNum() {
        return PhoneNum;
    }
    public void setPhoneNum(String phoneNum) {
        PhoneNum = phoneNum;
    }
    public List<Address> getAddress() {
        return Address;
    }
    public void setAddress(List<Address> address) {
        Address = address;
    }
    public Client() {
    }
    @Override
    public String toString() {
        return "Client [Id=" + Id + ", name=" + Name + ", Email=" + Email + ", PhoneNum=" + PhoneNum + ", Address="
                + Address + "]";
    }
}
