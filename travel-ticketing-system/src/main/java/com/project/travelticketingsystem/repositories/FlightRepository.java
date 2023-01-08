package com.project.travelticketingsystem.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.travelticketingsystem.models.Flight;

@Repository
public interface FlightRepository extends CrudRepository<Flight, Long>{
	List<Flight> findAll();
}
