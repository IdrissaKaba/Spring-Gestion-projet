package tn.essat.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import tn.essat.model.User;

public interface UserService extends UserDetailsService {
	
	User findByUsername(String username);

}
