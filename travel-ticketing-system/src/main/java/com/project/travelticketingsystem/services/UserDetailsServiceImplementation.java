package com.project.travelticketingsystem.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.travelticketingsystem.models.Role;
import com.project.travelticketingsystem.models.User;
import com.project.travelticketingsystem.repositories.UserRepository;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
	
	private UserRepository userRepo;
	
	public UserDetailsServiceImplementation(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	//1 Finds user by user name. If user is found return correct authorities, if not gives an error
	@Override
	public UserDetails loadUserByUsername (String username) throws UsernameNotFoundException {
		User user = userRepo.findByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}
			
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), getAuthorities(user));
	}
	
	//2 Returns a list of authorities/permissions for a specific user
	private List<GrantedAuthority> getAuthorities(User user) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (Role role : user.getRoles()) {
			GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getName());
			authorities.add(grantedAuthority);
		}
		return authorities;
	}

}
