package trg.talentsprint.starterkit.model;

import java.util.Optional;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//import org.springframework.data.annotation.Id;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productsid;

	private String product_name;
	private int quantities_received;
	private int priceper_unit;
	private String vendor_name;

	public Long getProductsid() {
		return productsid;
	}

	public void setProductsid(Long productsid) {
		this.productsid = productsid;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantities_received() {
		return quantities_received;
	}

	public void setQuantities_received(int quantities_received) {
		this.quantities_received = quantities_received;
	}

	public int getPriceper_unit() {
		return priceper_unit;
	}

	public void setPriceper_unit(int priceper_unit) {
		this.priceper_unit = priceper_unit;
	}

	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public Product() {
		super();
	}

	

}