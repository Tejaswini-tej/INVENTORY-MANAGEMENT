package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Cart;
import trg.talentsprint.starterkit.repository.CartRepository;

@Service
public class CartService {

	private CartRepository repository;

	@Autowired
	public CartService(CartRepository repository) {
		this.repository = repository;
	}

	public List<Cart> findAll() {
		return StreamSupport.stream(repository.findAll().spliterator(), false).collect(Collectors.toList());
	}

	public List<Cart> ccc(Long customer_id) {
		return repository.findByCartId(customer_id);
	}

	public Cart save(Cart cart) {
		return repository.save(cart);
	}

	public void deleteByCartId(Long customer_id) {
		repository.deleteById(customer_id);
	}

	public List<Cart> findByCustomerId(Long customer_id) {
		// TODO Auto-generated method stub
		return repository.findByCartId(customer_id);

	}

}
