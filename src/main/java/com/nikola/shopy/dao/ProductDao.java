package com.nikola.shopy.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nikola.shopy.dto.FiltersDto;
import com.nikola.shopy.dto.ProductOptionDto;
import com.nikola.shopy.dto.ProductPaginateDto;

@Repository("productDao")
@Transactional(readOnly=true)
public interface ProductDao {
	public ProductPaginateDto filterBy(FiltersDto filters);
	public ProductOptionDto productOptions();
}
