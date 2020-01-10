package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import trg.talentsprint.starterkit.model.Cart;

public interface CartRepository extends CrudRepository<Cart, Long> {

	@Query(value = "select * from cart where customer_id =?1 ", nativeQuery = true)
	List<Cart> findByCartId(Long custid);

	@Query(value = "select sum(totalprice) from cart where customer_id=?1", nativeQuery = true)
	long findTotalAmount(@Param("customer_id") long customerid);

	@Query(value = "select * from cart where product_name=?1", nativeQuery = true)
	List<Cart> findByProductName(String productname);

	@Query(value = "select * from cart where date between :startdate and :enddate ", nativeQuery = true)
	public List<Cart> searchOrderDate(@Param("startdate") String startdate, @Param("enddate") String enddate);

	@Query(value = "select * from cart where totalprice between :lowprice and :highprice", nativeQuery = true)
	List<Cart> findByPrice(@Param("lowprice") long lowprice, @Param("highprice") long highprice);

}
