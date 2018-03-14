package com.nikola.shopy.dto;

public class FiltersDto {
	public Integer page;
	public String category;
	public Float[] priceRange;
	public String[] sizes;
	public String[] brands;
	public Boolean isHotDeal;
	
	public FiltersDto() {}

	public FiltersDto(Integer page, String category, Float[] priceRange, String[] sizes, String[] brands,
			Boolean isHotDeal) {
		super();
		this.page = page;
		this.category = category;
		this.priceRange = priceRange;
		this.sizes = sizes;
		this.brands = brands;
		this.isHotDeal = isHotDeal;
	}
}
