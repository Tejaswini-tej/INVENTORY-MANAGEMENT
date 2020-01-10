package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import trg.talentsprint.starterkit.model.Customer;
import trg.talentsprint.starterkit.repository.CustomerRepository;

@Service
public class CustomerService {

	private CustomerRepository repository;

	@Autowired
	public CustomerService(CustomerRepository repository) {
		this.repository = repository;
	}

	public List<Customer> findAll() {
		return StreamSupport.stream(repository.findAll().spliterator(), false).collect(Collectors.toList());
	}

	public Optional<Customer> findByCustomerId(Long customer_id) {
		return repository.findById(customer_id);
	}

	public Customer save(Customer customers) {
		return repository.save(customers);
	}

	public void deleteByCustomerId(Long customer_id) {
		repository.deleteById(customer_id);
	}

}
