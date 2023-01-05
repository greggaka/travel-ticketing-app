package com.project.travelticketingsystem.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.travelticketingsystem.models.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	List<Role> findAll();
	
	List<Role> findByName(String name);
}
