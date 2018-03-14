package com.nikola.shopy.services;

import java.util.Set;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import java.util.Arrays;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nikola.shopy.dao.ProductDao;
import com.nikola.shopy.dto.FiltersDto;
import com.nikola.shopy.dto.ProductOptionDto;
import com.nikola.shopy.dto.ProductPaginateDto;
import com.nikola.shopy.entities.Product;

@Service("productService")
public class ProductService implements ProductDao {
	@Autowired
	private EntityManager entityManager;

	public Session getCurrentSession() {
		return entityManager.unwrap(Session.class);
	}

	@Override
	public ProductOptionDto productOptions() {

		Object[] queryTotal = (Object[]) getCurrentSession().createQuery(
				"Select round(max(p.price), 0) as maxPrice, round(min(p.price), 0) as minPrice, ((count(p.id)/9)+1) as pageCount from Product p")
				.getSingleResult();
		return new ProductOptionDto(queryTotal);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ProductPaginateDto filterBy(FiltersDto filters) {
		StringBuilder hql = new StringBuilder("select distinct p from Product p");
		if (filters.sizes.length > 0) {
			hql.append(" join p.sizes size");
		}
		
		hql.append(" where p.price >= :min and p.price <= :max");
		
		if (filters.isHotDeal) {
			hql.append(" and p.isHotDeal = :isHotDeal");
		} else if (!filters.category.equals("")) {
			hql.append(" and p.category.code = :category");
		}
		
		if (filters.brands.length > 0) {
			hql.append(" and p.brand.code in (:brandCodes)");
		}

		if (filters.sizes.length > 0) {
			hql.append(" and size.code in (:sizeCodes)");
		}

		String query = hql.toString();
		Query productsQuery = getCurrentSession().createQuery(query).setParameter("min", filters.priceRange[0])
				.setParameter("max", filters.priceRange[1]).setFirstResult(filters.page * 9).setMaxResults(9);

		query = query.substring(17, query.length());
		Query countQuery = getCurrentSession().createQuery("select count(distinct p.id)/9+1 as pageCount " + query)
				.setParameter("min", filters.priceRange[0]).setParameter("max", filters.priceRange[1]);

		if (filters.isHotDeal) {
			productsQuery.setParameter("isHotDeal", filters.isHotDeal);
			countQuery.setParameter("isHotDeal", filters.isHotDeal);
		} else if (!filters.category.equals("")) {
			productsQuery.setParameter("category", filters.category);
			countQuery.setParameter("category", filters.category);
		}
		
		if (filters.brands.length > 0) {
			productsQuery.setParameter("brandCodes", Arrays.asList(filters.brands));
			countQuery.setParameter("brandCodes", Arrays.asList(filters.brands));
		}
		if (filters.sizes.length > 0) {
			productsQuery.setParameter("sizeCodes", Arrays.asList(filters.sizes));
			countQuery.setParameter("sizeCodes", Arrays.asList(filters.sizes));
		}
		ProductOptionDto options = productOptions();
		options.pageCount = (Long) countQuery.getSingleResult();
		return new ProductPaginateDto((Set<Product>) productsQuery.getResultList().stream().collect(Collectors.toSet()),
				options);
	}
}
