package trg.talentsprint.starterkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.protobuf.TextFormat.ParseException;

import trg.talentsprint.starterkit.model.Cart;
import trg.talentsprint.starterkit.model.Customer;
import trg.talentsprint.starterkit.model.Invoice;
import trg.talentsprint.starterkit.model.Product;
import trg.talentsprint.starterkit.model.TotalAmount;
import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.repository.AmountRepository;
import trg.talentsprint.starterkit.repository.CartRepository;
import trg.talentsprint.starterkit.repository.CustomerRepository;
import trg.talentsprint.starterkit.repository.InvoiceRepository;
import trg.talentsprint.starterkit.repository.ProductRepository;
import trg.talentsprint.starterkit.service.CartService;
import trg.talentsprint.starterkit.service.CustomerService;
import trg.talentsprint.starterkit.service.ProductService;
import trg.talentsprint.starterkit.service.SecurityService;
import trg.talentsprint.starterkit.service.UserService;
import trg.talentsprint.starterkit.validator.UserValidator;

@Controller
public class UserController {
	private static final long productsid = 0;

	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productservice;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;
	@Autowired
	private CustomerService customerservice;

	@Autowired
	private ProductRepository prepository;

	@Autowired
	private CustomerRepository repository;

	@Autowired
	private CartRepository cartrepository;

	@Autowired
	private CartService cartservice;

	@Autowired
	private InvoiceRepository invrepository;

	@Autowired
	private AmountRepository amtrepository;

	@GetMapping("/{customer_id}/productadd")
	public String showProducts(@PathVariable("customer_id") Long customer_id, Model model, HttpSession http) {
		http.setAttribute("customer_id", customer_id);
		return "productadd";

	}

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model) {
		return "welcome";
	}

	@GetMapping("/Product")
	public String getAllProducts(Model model) {
		List<Product> products = productservice.findAll();
		model.addAttribute("products", products);
		return "product";
	}

	@GetMapping("/new-product")
	public String showProducts(Model model) {
		model.addAttribute("Product", new Product());
		return "new-product";
	}

	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewProduct(@Valid @ModelAttribute Product products, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "new-product";

		}
		productservice.save(products);
		model.addAttribute("Product", productservice.findAll());
		return "redirect:/Product";
	}

	@GetMapping("/{productsid}/product")
	public String showProductsById(@PathVariable("productsid") Long productsid, Model model) {
		Product products = productservice.findById(productsid)
				.orElseThrow(() -> new IllegalArgumentException("Invalid productmodel Id:" + productsid));
		model.addAttribute("product", products);
		return "edit-product";
	}

	@PostMapping("/{productsid}/update")
	public String updateProduct(@PathVariable("productsid") Long productsid,
			@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "edit-product";
		}
		productservice.save(product);
		model.addAttribute("products", productservice.findAll());
		return "product";
	}

	@RequestMapping("/{id}/productdelete")
	public String deleteProduct(@PathVariable("id") Long productsid, Model model) {
		productservice.findById(productsid)
				.orElseThrow(() -> new IllegalArgumentException("Invalid product Id:" + productsid));
		productservice.deleteById(productsid);

		model.addAttribute("products", productservice.findAll());
		return "product";
	}

	@GetMapping("/new-customer")
	public String showCustomers(Model model) {
		model.addAttribute("customer", new Customer());
		return "new-customer";
	}

	@PostMapping(value = "/addcustomer", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewCustomer(@Valid @ModelAttribute("customer") Customer customers, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "new-customer";

		}
		customerservice.save(customers);
		// long customer_id = c.getCustomer_id();
		model.addAttribute("customers", repository.findByCustomerId(customers.getCustomer_id()));
		return "customer";
	}

	@GetMapping("/{customer_id}/customer")
	public String showCustomersById(@PathVariable("customer_id") Long customer_id, Model model) {
		Customer customers = customerservice.findByCustomerId(customer_id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + customer_id));
		model.addAttribute("customer", customers);
		return "edit-customer";
	}

	@PostMapping("/{customer_id}/customerupdate")
	public String UpdateCustomer(@PathVariable Long customer_id, @Valid @ModelAttribute Customer customers,
			BindingResult result, Model model) {
		customerservice.findByCustomerId(customer_id)
				.orElseThrow(() -> new IllegalArgumentException("invalid customerid : " + customer_id));
		customerservice.save(customers);
		model.addAttribute("customers", repository.findByCustomerId(customers.getCustomer_id()));
		return "customer";
	}

	@GetMapping("/{customer_id}/customerdelete")
	public String DeleteCustomer(@PathVariable Long customer_id, Model model) {
		customerservice.findByCustomerId(customer_id)
				.orElseThrow(() -> new IllegalArgumentException("invalid customerid : " + customer_id));
		customerservice.deleteByCustomerId(customer_id);
		model.addAttribute("customers", customerservice.findByCustomerId(customer_id));
		return "redirect:/welcome";
	}

	@GetMapping("/customer")
	public String customer(Model model) {
		model.addAttribute("customer", new Customer());
		return "new-customer";
	}

	@GetMapping("/{customer_id}/addtocart")
	public String addToCart(@PathVariable("customer_id") Long customer_id, Cart cart, BindingResult result,
			@RequestParam(value = "productsid") Long productsid,
			@RequestParam(value = "product_name") String product_name,
			@RequestParam(value = "quantityrequired", defaultValue = "0") Integer quantityrequired,
			@RequestParam(value = "priceper_unit", defaultValue = "0") Long priceper_unit,
			@RequestParam(value = "vendor_name") String vendor_name,
			@RequestParam(value = "totalprice", defaultValue = "0") Long totalprice,
			@RequestParam(value = "quantityavailable", defaultValue = "0") int quantityavailable, Cart cart1,
			TotalAmount ta, Model model) {
		if (result.hasErrors()) {
			return "new-customer";
		}
		System.out.println(+priceper_unit);
		cart1.setProductsid(productsid);
		cart1.setProduct_name(product_name);
		cart1.setPriceper_unit(priceper_unit);
		cart1.setTotalprice(totalprice);
		cart1.setCustomer_id(customer_id);

		cartservice.save(cart1);

		model.addAttribute("cart", cartservice.findByCustomerId(customer_id));
		model.addAttribute("totalamount", cartrepository.findTotalAmount(customer_id));

		Product p1 = prepository.findByproductsid(productsid);
		p1.setQuantities_received(quantityavailable);

		productservice.save(p1);

		return "productadd";
	}

	@GetMapping("/{customer_id}/searching")
	public String searchProductName(@PathVariable("customer_id") Long customer_id,
			@Valid @RequestParam(value = "product_name", required = false, defaultValue = "") String product_name,
			Model model) {
		model.addAttribute("products", prepository.findByName(product_name));
		model.addAttribute("cart", cartrepository.findByCartId(customer_id));
		model.addAttribute("customer_id", customer_id);
		return "productadd";
	}

	@GetMapping("{customer_id}/addamount")
	public String addTotal(@PathVariable("customer_id") Long customer_id,
			@RequestParam(value = "totalamount") Long totalamount, TotalAmount ta, Invoice inv, Model model) {
		ta.setTotalamount(totalamount);
		ta.setCartid(customer_id);
		amtrepository.save(ta);
		inv.setCust_id(customer_id);
		Invoice i = invrepository.save(inv);
		long in = i.getInvoice_code();
		model.addAttribute("invcode", in);
		
		return "Invoice";

	}

	@RequestMapping("{customer_id}/Invoice")
	public String invoice(@PathVariable("customer_id") long customer_id, Model model) {

		model.addAttribute("carts", cartrepository.findByCartId(customer_id));
		model.addAttribute("customers", repository.findByCustomerId(customer_id));
		long l = cartrepository.findTotalAmount(customer_id);
		model.addAttribute("totalamount", l);
		return "print";

	}

	@GetMapping("/invTracking")
	public String InvTrack(Model model) {
		model.addAttribute("products", prepository.findAll());

		return "invTracking";
	}

	@GetMapping("/searching1")
	public String searchProductName1(
			@Valid @RequestParam(value = "product_name", required = false, defaultValue = "") String product_name,
			Model model) {
		model.addAttribute("products", prepository.findByName(product_name));

		return "invTracking";
	}

	// Sales
	@GetMapping("sales")
	public String sales(Model model) {
		List<Cart> cart = cartservice.findAll();

		long sum = 0;
		for (int i = 0; i < cart.size(); i++) {
			sum += cart.get(i).getQuantityrequired();

		}
		model.addAttribute("tcount", sum);
		model.addAttribute("carts", cart);

		return "sales";

	}

	@GetMapping("/searchproduct")
	public String searchProductName(
			@Valid @RequestParam(value = "product_name", required = false, defaultValue = "") String product_name,
			Model model) {
		List<Cart> cart = cartrepository.findByProductName(product_name);

		long sum = 0;
		for (int i = 0; i < cart.size(); i++) {
			sum += cart.get(i).getQuantityrequired();

		}
		model.addAttribute("totalcount", sum);
		model.addAttribute("carts", cart);

		return "sales";
	}

	@RequestMapping("/searchdate")
	public String searchOrderDates(ModelMap model, @RequestParam(name = "startdate") String startdate,
			@RequestParam(name = "enddate") String enddate) throws ParseException {
		List<Cart> cart = cartrepository.searchOrderDate(startdate, enddate);

		long sum = 0;
		for (int i = 0; i < cart.size(); i++) {
			sum += cart.get(i).getQuantityrequired();

		}
		model.addAttribute("totalcount", sum);
		model.addAttribute("carts", cart);

		return "sales";

	}

	@RequestMapping("/searchprice")
	public String searchPrice(ModelMap model, @RequestParam(name = "lowprice") long lowprice,
			@RequestParam(name = "highprice") long highprice) throws ParseException {
		List<Cart> cart = cartrepository.findByPrice(lowprice, highprice);

		long sum = 0;
		for (int i = 0; i < cart.size(); i++) {
			sum += cart.get(i).getQuantityrequired();

		}
		model.addAttribute("totalcount", sum);
		model.addAttribute("carts", cart);

		return "sales";

	}

}
