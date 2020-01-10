package trg.talentsprint.starterkit.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long cartid;
	private long productsid;
	private long customer_id;
	String product_name;
	private long priceper_unit;
	private long quantityrequired;
	private long totalprice;

	@CreationTimestamp
	private LocalDate date;
	private String vendor_name;

	public long getCartid() {
		return cartid;
	}

	public void setCartid(long cartid) {
		this.cartid = cartid;
	}

	public long getProductsid() {
		return productsid;
	}

	public void setProductsid(long productsid) {
		this.productsid = productsid;
	}

	public long getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(long customer_id) {
		this.customer_id = customer_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public long getPriceper_unit() {
		return priceper_unit;
	}

	public void setPriceper_unit(long priceper_unit) {
		this.priceper_unit = priceper_unit;
	}

	public long getQuantityrequired() {
		return quantityrequired;
	}

	public void setQuantityrequired(long quantityrequired) {
		this.quantityrequired = quantityrequired;
	}

	public long getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(long totalprice) {
		this.totalprice = totalprice;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

}
