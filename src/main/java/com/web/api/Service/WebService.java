package com.web.api.Service;

import java.util.List;
import org.json.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.web.api.model.Customer;
import com.web.api.model.Login;

@Service
public class WebService {

	@Autowired
	private RestTemplate restTemplate;

	public String auth(Login login) {
		try {
			ResponseEntity<String> response = restTemplate.postForEntity(
					"https://qa2.sunbasedata.com/sunbase/portal/api/assignment_auth.jsp", login, String.class);

			JSONObject obj = new JSONObject(response.getBody());

			String token = obj.getString("access_token");

			return token;
		} catch (Exception e) {

			System.out.println(e);
		}
		return "";
	}

	public List<Customer> getAllCustomer(String token) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.set("Content-Type", "application/json");
		HttpEntity<String> entity = new HttpEntity<>("some body", headers);

		try {
			ResponseEntity<List<Customer>> response = restTemplate.exchange(
					"https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=get_customer_list",
					HttpMethod.GET, entity, new ParameterizedTypeReference<List<Customer>>() {
					});
			List<Customer> objects = response.getBody();
			return objects;
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;

	}

	public String addCustomer(Customer customer, String token) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.set("Content-Type", "application/json");
		HttpEntity<Customer> entity = new HttpEntity<>(customer, headers);
		try {
			ResponseEntity<String> response = restTemplate.exchange(
					"https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=create", HttpMethod.POST, entity,
					String.class);
			String result = response.getBody();
			return result;
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";

	}

	public String deleteCustomer(String uuid, String token) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.set("Content-Type", "application/json");
		HttpEntity<String> entity = new HttpEntity<>("some body", headers);
		try {
			ResponseEntity<String> response = restTemplate.exchange(
					"https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=delete&uuid=" + uuid,
					HttpMethod.POST, entity, String.class);
			return response.getBody();
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";

	}

	public String updateCustomerByUuid(String uuid, String token) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + token);
		headers.set("Content-Type", "application/json");
		Customer customer = new Customer(uuid, "Jane", "Doe", "Elvnu Street", "H no 2", "Delhi", "Delhi",
				"sam@gmail.com", "12345678");
		HttpEntity<Customer> entity = new HttpEntity<>(customer, headers);
		try {
			ResponseEntity<String> response = restTemplate.exchange(
					"https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=update&uuid=" + uuid,
					HttpMethod.POST, entity, String.class);
			return response.getBody();
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";
	}

}