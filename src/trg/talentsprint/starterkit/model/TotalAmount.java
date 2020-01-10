package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TotalAmount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long totalamountid;
	private long cartid;
	private long totalamount;

	public long getTotalamountid() {
		return totalamountid;
	}

	public void setTotalamountid(long totalamountid) {
		this.totalamountid = totalamountid;
	}

	public long getCartid() {
		return cartid;
	}

	public void setCartid(long cartid) {
		this.cartid = cartid;
	}

	public long getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(long totalamount) {
		this.totalamount = totalamount;
	}

}
