package com.project.travelticketingsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.travelticketingsystem.models.Flight;
import com.project.travelticketingsystem.repositories.FlightRepository;

@Service
public class FlightService {
	
	private final FlightRepository flightRepo;

	public FlightService(FlightRepository flightRepo) {
		this.flightRepo = flightRepo;
	}
	
	public Flight getOne(Long id) {
        Optional<Flight> flight = flightRepo.findById(id);
        return flight.isPresent() ? flight.get() : null;
    }

    public List<Flight> getAll() {
        return (List<Flight>) flightRepo.findAll();
    }

    public Flight create(Flight flight) {
        return flightRepo.save(flight);
    }

    public Flight update(Flight flight) {
        return flightRepo.save(flight);
    }

    public void delete(Long id) {
        flightRepo.deleteById(id);
    }
}
