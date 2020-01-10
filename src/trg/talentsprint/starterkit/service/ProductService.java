package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Product;
import trg.talentsprint.starterkit.repository.ProductRepository;

@Service
public class ProductService {
	private ProductRepository repository;

	@Autowired
	public ProductService(ProductRepository repository) {
		this.repository = repository;
	}

	public List<Product> findAll() {
		return StreamSupport.stream(repository.findAll().spliterator(), false).collect(Collectors.toList());
	}

	public Optional<Product> findById(Long id) {
		return repository.findById(id);
	}

	public Product save(Product stock) {
		return repository.save(stock);
	}

	public void deleteById(Long id) {
		repository.deleteById(id);
	}

}
