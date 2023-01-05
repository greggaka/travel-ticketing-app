package com.project.travelticketingsystem.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.travelticketingsystem.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	List<User> findAll();
	
	User findByUsername(String username);
	
	Optional<User> findByEmail(String email);
}
