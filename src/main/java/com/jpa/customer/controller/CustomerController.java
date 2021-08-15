package com.jpa.customer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jpa.customer.entity.Customer;
import com.jpa.customer.service.CustomerService;
@Controller
public class CustomerController 
{
    @Autowired
	private CustomerService Service;
    
    
    @RequestMapping("/")
    public String viewHomePage(Model model) {
        return listByPage(model, 1);
    }
	
	@GetMapping("/page/{pageNumber}") 
	public String listByPage(Model model,
	        @PathVariable("pageNumber") int currentPage) {
	     
	    Page<Customer> page = Service.listAll(currentPage);
	    long totalItems = page.getTotalElements();
	    int totalPages = page.getTotalPages();
	     
	    List<Customer> listCustomer = page.getContent();
	     
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalItems", totalItems);
	    model.addAttribute("listCustomer", listCustomer);
	     
	    return "index";
	}
	
	@RequestMapping("new")
	public String newCustomerForm(Map<String, Object> model) {
	    Customer customer = new Customer();
	    model.put("customer", customer);
	    return "new_customer";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
	    Service.save(customer);
	    return "redirect:/";
	}
	
	@RequestMapping("/edit")
	public ModelAndView editCustomerForm(@RequestParam long id) {
	    ModelAndView mav = new ModelAndView("edit_customer");
	    Customer customer = Service.get(id);
	    mav.addObject("customer", customer);
	 
	    return mav;
	}
	
	@RequestMapping("/delete")
	public String deleteCustomerForm(@RequestParam long id) {
	    Service.delete(id);
	    return "redirect:/";       
	}
	
	@RequestMapping("/search") 
	public ModelAndView search(@RequestParam String keyword) {
	    List<Customer> result = Service.search(keyword);
	    ModelAndView mav = new ModelAndView("search");
	    mav.addObject("result", result);
	 
	    return mav;    
	}
	
	@RequestMapping("/deleteall")
	public String deleteCustomerForm() 
	{
	    Service.deleteAll();
	    return "redirect:/"; 
}
	
}
