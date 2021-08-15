package com.jpa.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.jpa.customer.entity.Customer;
import com.jpa.customer.repository.CustomerRepository;

@Service 
public class CustomerService 
{
	@Autowired 
	private CustomerRepository repo;
	
	public Page<Customer> listAll(int pageNumber) {
	    int pageSize = 5;
	     
	    Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
	     
	    return repo.findAll(pageable);
	}

	public void save(Customer customer) {
		repo.save(customer);
	}
	
	public Customer get(Long id) {
		return repo.findById(id).get();
    }
	

	public void delete(long id) 
	{
		repo.deleteById(id);
		
	}
	
	public List<Customer> search(String keyword) {
	    return repo.search(keyword);
	}

	public void deleteAll() 
	{
		repo.deleteAll();
		// TODO Auto-generated method stub
		
	}

	
	
}
