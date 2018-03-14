package com.nikola.shopy.controllers;

import java.util.Set;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nikola.shopy.dao.BrandDao;
import com.nikola.shopy.dao.CategoryDao;
import com.nikola.shopy.dao.SizeDao;
import com.nikola.shopy.dto.FiltersDto;
import com.nikola.shopy.dto.ProductOptionDto;
import com.nikola.shopy.dto.ProductPaginateDto;
import com.nikola.shopy.entities.Brand;
import com.nikola.shopy.entities.Category;
import com.nikola.shopy.entities.Size;
import com.nikola.shopy.services.ProductService;

@RestController
@RequestMapping(path = "/api", produces = "application/json")
public class CrudController {
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private SizeDao sizeDao;
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private ProductService productService;

	@RequestMapping(path = "/categories", method = RequestMethod.GET)
	public ResponseEntity<Set<Category>> getAllCategories() {
		Set<Category> categories = StreamSupport
				// Convert Iterable to Stream
				.stream(Spliterators.spliteratorUnknownSize(categoryDao.findAll().iterator(), Spliterator.IMMUTABLE),
						false)
				// Sort by id -> Male, Female, Children
				.sorted((a, b) -> a.getId().compareTo(b.getId()))
				// Create Set out of Stream
				.collect(Collectors.toSet());
		return new ResponseEntity<Set<Category>>(categories, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/sizes", method = RequestMethod.GET)
	public ResponseEntity<Set<Size>> getAllSizes() {
		Set<Size> sizes = StreamSupport
				// Convert Iterable to Stream
				.stream(Spliterators.spliteratorUnknownSize(sizeDao.findAll().iterator(), Spliterator.IMMUTABLE),
						false)
				// Sort by id
				.sorted((a, b) -> a.getId().compareTo(b.getId()))
				// Create Set out of Stream
				.collect(Collectors.toSet());
		return new ResponseEntity<Set<Size>>(sizes, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/brands", method = RequestMethod.GET)
	public ResponseEntity<Set<Brand>> getAllBrands() {
		Set<Brand> brands = StreamSupport
				// Convert Iterable to Stream
				.stream(Spliterators.spliteratorUnknownSize(brandDao.findAll().iterator(), Spliterator.IMMUTABLE),
						false)
				// Sort by id
				.sorted((a, b) -> a.getId().compareTo(b.getId()))
				// Create Set out of Stream
				.collect(Collectors.toSet());
		return new ResponseEntity<Set<Brand>>(brands, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/products", method = RequestMethod.POST)
	public ResponseEntity<ProductPaginateDto> getAllProducts(@RequestBody FiltersDto filters) {
		return new ResponseEntity<ProductPaginateDto>(this.productService.filterBy(filters), HttpStatus.OK);
	}
	
	@RequestMapping(path = "/products/options", method = RequestMethod.GET)
	public ResponseEntity<ProductOptionDto> getAllProductsPageCount() {
		ProductOptionDto options = this.productService.productOptions();
		return new ResponseEntity<ProductOptionDto>(options, HttpStatus.OK);
	}
}
