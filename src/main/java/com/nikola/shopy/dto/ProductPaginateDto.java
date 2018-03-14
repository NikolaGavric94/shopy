package com.nikola.shopy.dto;

import java.util.Set;

import com.nikola.shopy.entities.Product;

public class ProductPaginateDto {
	public Set<Product> products;
	public ProductOptionDto options;
	
	public ProductPaginateDto(Set<Product> products, ProductOptionDto options) {
		this.products = products;
		this.options = options;
	}
}
