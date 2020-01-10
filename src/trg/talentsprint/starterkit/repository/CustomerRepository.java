package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Long> {

	@Query(value = "select * from customer where customer_id=?1", nativeQuery = true)
	List<Customer> findByCustomerId(long customer_id);

}
