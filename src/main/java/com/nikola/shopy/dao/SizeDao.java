package com.nikola.shopy.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nikola.shopy.entities.Size;

@Repository("sizeDao")
public interface SizeDao extends CrudRepository<Size, Long> {
}
