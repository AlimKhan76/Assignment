package com.web.api.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.web.api.Service.WebService;
import com.web.api.model.Customer;
import com.web.api.model.Login;

@Controller
public class LoginController {

	@Autowired
	private WebService service;

	public static String token;

	@RequestMapping("/")
	public String index() {
		return "loginPage";

	}

	@PostMapping("/login")
	public String home(Model model, @RequestParam String loginId, @RequestParam String password) {

		Login login = new Login(loginId, password);
		token = service.auth(login);

		if (token.isBlank()) {
			model.addAttribute("error", "Invalid credentails");
			return "loginPage";
		}
		List<Customer> list = service.getAllCustomer(token);
		model.addAttribute("token", token);
		model.addAttribute("list", list);
		return "homePage";
	}

	@GetMapping("/add")
	public String addCustomerForm() {
		return "addCustomerPage";
	}

	@PostMapping("/addNewCustomer")
	public String addNewCustomer(Model model, @ModelAttribute Customer customer) {
		String response = service.addCustomer(customer, token);
		System.out.println(response);
		List<Customer> list = service.getAllCustomer(token);
		model.addAttribute("token", token);
		model.addAttribute("list", list);
		return "homePage";
	}

	@PostMapping("/delete")
	public String deleteCustomer(Model model, @RequestParam String uuid) {
		String response = service.deleteCustomer(uuid, token);
		if (response.isBlank()) {
			model.addAttribute("error", "Internal Server error");
		}
		List<Customer> list = service.getAllCustomer(token);
		model.addAttribute("token", token);
		model.addAttribute("list", list);
		return "homePage";
	}

	@PostMapping("/update")
	public String updateCustomer(@RequestParam String uuid, Model model) {
		service.updateCustomerByUuid(uuid, token);
		List<Customer> list = service.getAllCustomer(token);
		model.addAttribute("token", token);
		model.addAttribute("list", list);
		return "homePage";
	}

}
