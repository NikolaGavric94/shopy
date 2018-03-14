package com.nikola.shopy.dto;

import java.io.Serializable;

public class ProductOptionDto implements Serializable {
	
	private static final long serialVersionUID = 2463127800614384640L;
	
	public Float max;
	public Float min;
	public Long pageCount;
	
	public ProductOptionDto(Float max, Float min, Long pageCount) {
		this.max = max;
		this.min = min;
		this.pageCount = pageCount;
	}
	
	public ProductOptionDto(Object[] resultSet) {
		this.max = (Float) resultSet[0];
		this.min = (Float) resultSet[1];
		this.pageCount = (Long) resultSet[2];
	}
}
