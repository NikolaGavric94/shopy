package com.nikola.shopy.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nikola.shopy.entities.Brand;

@Repository("brandDao")
public interface BrandDao extends CrudRepository<Brand, Long> {
}
