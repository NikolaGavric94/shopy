package com.nikola.shopy.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nikola.shopy.entities.Category;

@Repository("categoryDao")
public interface CategoryDao extends CrudRepository<Category, Long> {
}
