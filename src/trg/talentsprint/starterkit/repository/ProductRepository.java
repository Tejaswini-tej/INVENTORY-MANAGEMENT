package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	@Query(value = "select * from product where product_name =?1 ", nativeQuery = true)
	List<Product> findByName(String product_name);

	Product findByproductsid(long productsid);
}
