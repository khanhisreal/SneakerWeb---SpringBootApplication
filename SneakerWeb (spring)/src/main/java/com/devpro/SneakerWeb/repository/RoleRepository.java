package com.devpro.SneakerWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.SneakerWeb.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{
}
