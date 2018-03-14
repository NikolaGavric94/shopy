package com.nikola.shopy.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nikola.shopy.entities.User;

@Repository("userDao")
public interface UserDao extends CrudRepository<User, Long> {
	public User findByUsername(String username);
}
