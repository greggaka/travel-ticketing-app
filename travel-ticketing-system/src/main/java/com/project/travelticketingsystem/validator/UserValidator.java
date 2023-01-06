package com.project.travelticketingsystem.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.travelticketingsystem.models.User;
import com.project.travelticketingsystem.services.UserService;

@Component
public class UserValidator implements Validator {
	
	private final UserService userServ;
	
	public UserValidator(UserService userServ) {
		this.userServ = userServ;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object object, Errors errors) {
		User user = (User) object;
		if (!user.getConfirm().equals(user.getPassword())) {
			errors.rejectValue("confirm", "Match"); 
		}
//		if (userServ.getUser(user.getUsername()) != null) {
//			errors.rejectValue("username", "Unique");
//		}
	}
	
}
