package com.project.travelticketingsystem.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.travelticketingsystem.models.Flight;
import com.project.travelticketingsystem.services.FlightService;

@Controller
@RequestMapping("/flights")
public class FlightController {
	
	private final FlightService flightServ;

	public FlightController(FlightService flightServ) {
		this.flightServ = flightServ;
	}
	
	@GetMapping("/new")
	public String newName(@ModelAttribute("flight") Flight flight) {
		return "flight/new.jsp";
	}
	
	@PostMapping("/new")
	public String processFlight(@Valid @ModelAttribute("flight") Flight flight, BindingResult result) {
		if (result.hasErrors()) {
			return "flight/new.jsp";
		}
		flightServ.create(flight);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewFlight(@PathVariable("id") Long id, Model model) {
		Flight flight = flightServ.getOne(id);
		model.addAttribute("flight", flight);
		return "flight/view.jsp";
	}
	
	

}
