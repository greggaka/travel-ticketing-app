package com.project.travelticketingsystem.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.project.travelticketingsystem.models.LoginUser;
import com.project.travelticketingsystem.models.User;
import com.project.travelticketingsystem.repositories.RoleRepository;
import com.project.travelticketingsystem.repositories.UserRepository;

@Service
public class UserService {
	
	private final UserRepository userRepo;
	private RoleRepository roleRepo;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public UserService(UserRepository userRepo, RoleRepository roleRepo, BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepo = userRepo;
		this.roleRepo = roleRepo;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		user.setRoles(roleRepo.findByName("ROLE_USER"));
		return userRepo.save(user);
	}
	
	public User registerAdmin(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		user.setRoles(roleRepo.findByName("ROLE_ADMIN"));
		return userRepo.save(user);
	}
	
	public User login(LoginUser loginUser, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		User existingUser = getUser(loginUser.getEmail());
		if (existingUser == null) {
			result.rejectValue("email", "Unique", "Unknown Email");
			return null;
		}
		if(!BCrypt.checkpw(loginUser.getPassword(), existingUser.getPassword())) {
			result.rejectValue("password", "Match", "Incorrect Password");
			return null;
		}
		return existingUser;
	}
	
	public User findByUserName(String username) {
		return userRepo.findByUsername(username);
	}
	
	public User getUser(String email) {
		Optional<User> potentialUser = userRepo.findByEmail(email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User getUser(Long id) {
		Optional<User> potentialUser = userRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}


}
