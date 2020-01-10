package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.TotalAmount;

@Repository
public interface AmountRepository extends CrudRepository<TotalAmount, Long> {

	@Query(value = "select * from totalamount where cartid = ?1", nativeQuery = true)
	List<TotalAmount> findByCustomerId(Long customerid);

}
