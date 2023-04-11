package com.devpro.SneakerWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.devpro.SneakerWeb.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	  User findByUsername(String username);
}
