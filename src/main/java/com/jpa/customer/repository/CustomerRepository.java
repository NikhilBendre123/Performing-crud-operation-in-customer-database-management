package com.jpa.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.jpa.customer.entity.Customer;

public interface CustomerRepository extends PagingAndSortingRepository<Customer, Long>
{
	 @Query(value = "SELECT c FROM Customer c WHERE c.name LIKE '%' || :keyword || '%'"
	            + " OR c.email LIKE '%' || :keyword || '%'"
	            + " OR c.number LIKE '%' || :keyword || '%'"
	            + " OR c.aadhaar LIKE '%' || :keyword || '%'"
	            + " OR c.address LIKE '%' || :keyword || '%'")
	    public List<Customer> search(@Param("keyword") String keyword);
}
