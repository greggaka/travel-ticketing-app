package com.project.travelticketingsystem.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.travelticketingsystem.models.User;
import com.project.travelticketingsystem.services.UserService;
import com.project.travelticketingsystem.validator.UserValidator;

@Controller
public class UserController {
	
	private final UserService userServ;
	private final UserValidator userValid;

	public UserController(UserService userServ, UserValidator userValid) {
		this.userServ = userServ;
		this.userValid = userValid;
	}
	
	@GetMapping("/registration")
	public String userRegister(@ModelAttribute("user") User user) {
		return "user/admin/register.jsp";
	}
	
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValid.validate(user, result);
		if (result.hasErrors()) {
			return "user/admin/register.jsp";
		}
		userServ.registerAdmin(user);
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String userLogin(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials. Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful");
		}
		return "user/admin/login.jsp";
	}
	
	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userServ.findByUserName(username));
		return "user/admin/home.jsp";
	}
	
	@RequestMapping(value = {"/", "/home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userServ.findByUserName(username));
		return "user/admin/home.jsp";
	}

}
