package com.example.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.util.Map;

import java.sql.*;
import java.util.*;

@EntityScan(basePackages = {
		"com.example.model"
})
@EnableJpaRepositories(basePackages = {
		"com.example.repository"
})

@SpringBootApplication(scanBasePackages ={
		"com.example.data",
		"com.example.controller"
})public class ComparateurTrivagoApplication {
	private static final String DB_URL = "jdbc:h2:mem:Comparateur"; // In-memory H2 database
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "root";
	private static final RestTemplate restTemplate = new RestTemplate();
	private static String userName = null;
	private String startDate;
	private String endDate;

	public static void main(String[] args) {
		SpringApplication.run(ComparateurTrivagoApplication.class, args);

		Scanner scanner = new Scanner(System.in);

		// Step 1: Login
		System.out.println("Welcome to the Hotel Comparator Service!\n");
		System.out.println("Please log in to continue.");
		System.out.print("Enter your phone number: ");
		String phone = scanner.nextLine().trim();
		System.out.print("Enter your email: ");
		String mail = scanner.nextLine().trim();

		if (authenticateUser(mail, phone)) {
			System.out.println("Login successful!\n");
			// Step 2: Ask if they want to use the comparator service
			System.out.println("Would you like to use the comparator service? (yes:1 /no:0)");
			String response = scanner.nextLine().trim().toLowerCase();

			if (response.equals("1")) {
				startComparatorService(scanner);
			} else if (response.equals("0")) {
				System.out.println("Thank you! Have a great day!");
			} else {
				System.out.println("Invalid input. Please restart the program.");
			}
		} else {
			System.out.println("Invalid phone number or email. Please try again.");
		}

		scanner.close();
	}

	private static boolean authenticateUser(String mail, String phone) {
		// To hold the user's name

		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
			// Query to get the user's name along with the phone and email
			String query = "SELECT NAME FROM CLIENT WHERE phone = ? AND mail = ?";

			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setString(1, phone); // Set the phone value dynamically
				statement.setString(2, mail);  // Set the email value dynamically

				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						userName = resultSet.getString("NAME"); // Retrieve the user's name
						System.out.println("Welcome, " + userName + "!");
						return true; // Authentication successful
					} else {
						// Handle case where no matching user is found
						System.out.println("Invalid credentials. Please check your phone and email.");
						return false; // Authentication failed
					}
				}
			}
		} catch (SQLException e) {
			System.err.println("Database error: " + e.getMessage());
			return false; // Authentication failed due to an error
		}

	}

	private static void startComparatorService(Scanner scanner) {
		System.out.println("Great! Let's get started.");
		System.out.print("Enter the city of stay: ");
		String city = scanner.nextLine();

		System.out.print("Enter the start date (yyyy-MM-dd): ");
		String startDate = scanner.nextLine();

		System.out.print("Enter the end date (yyyy-MM-dd): ");
		String endDate = scanner.nextLine();

		System.out.print("Enter the number of people: ");
		int numberOfPeople = Integer.parseInt(scanner.nextLine());

		System.out.print("Enter the minimum number of stars for the hotel: ");
		int minStars = Integer.parseInt(scanner.nextLine());

		System.out.printf("Comparing offers in %s from %s to %s for %d people with minimum %d stars.%n",
				city, startDate, endDate, numberOfPeople, minStars);

		List<String> urls = List.of(
				"http://localhost:8083/agencyTripadvisor/api/check-availability",
				"http://localhost:8084/agencyAirbnb/api/check-availability",
				"http://localhost:8085/agencyBooking/api/check-availability"
		);

		// Use a Set to avoid duplicate entries
		Set<Object> allOffers = new HashSet<>();
		for (int agence_id = 1; agence_id <= 3; agence_id++) {
			for (String url : urls) {
				List<Object> offers = fetchOffers(agence_id, city, startDate, endDate, numberOfPeople, minStars, url);
				if (offers != null) {
					allOffers.addAll(offers);
				}
			}
		}

		// Convert the Set back to a List
		List<Object> uniqueOffers = new ArrayList<>(allOffers);

		// Display offer details
		printOfferDetails(uniqueOffers);

		System.out.println("/nWould you like to make a reservation? (yes: 1 / no: 0)");
		String reservationResponse = scanner.nextLine().trim().toLowerCase();

		if (reservationResponse.equals("1")) {
			System.out.println("Please proceed with the reservation process.");
			System.out.println("Reservation using this username: " + userName);

			System.out.println("Enter the offer ID for the reservation:");
			int offerId = Integer.parseInt(scanner.nextLine());

			System.out.println("Enter the hotel name:");
			String hotelId = scanner.nextLine();


			System.out.println("Processing your reservation...");
			System.out.println("Select the agency to proceed with your reservation:");
			System.out.println("1. Tripadvistor 1");
			System.out.println("2. Airbnb 2");
			System.out.println("3. Booking 3");
			int agencyChoice = Integer.parseInt(scanner.nextLine());
			System.out.printf("\nRerservation with name %s in %s from %s to %s for %d people with agency %d ",
					userName, hotelId, startDate, endDate, numberOfPeople, agencyChoice);
			System.out.printf("Would you like to use your own card or add another one (1/0)");
			int reply = scanner.nextInt();
			if (reply == 1) {
				displayAllCreditCards();
			} else {
				System.out.printf("Type the number of card\n");
				String cardNumber = scanner.nextLine();
				System.out.printf("Type The experiration Date\n");
				String expiration_date = scanner.nextLine();
				//String cardHolderName = userName;
				addCreditCard(cardNumber, expiration_date);
			}
			String reservationUrl = "";

			switch (agencyChoice) {
				case 1:
					reservationUrl = "http://localhost:8083/agencyTripadvisor/api/reserve";
					break;
				case 2:
					reservationUrl = "http://localhost:8084/agencyAirbnb/api/reserve";
					break;
				case 3:
					reservationUrl = "http://localhost:8085//agencyBooking/api/reserve";
					break;
				default:
					System.out.println("Invalid Hotel Id. Exiting reservation process.");
					return;
			}


			// Prepare the request parameters
			MultiValueMap<String, String> reservationParams = new LinkedMultiValueMap<>();
			reservationParams.add("name", userName);
			reservationParams.add("startDate", startDate);
			reservationParams.add("endDate", endDate);
			reservationParams.add("offerId", String.valueOf(offerId));
			reservationParams.add("agencyId", String.valueOf(agencyChoice)); // Assuming agencyId is 3
			reservationParams.add("hotelId", String.valueOf(hotelId));

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

			HttpEntity<MultiValueMap<String, String>> reservationEntity = new HttpEntity<>(reservationParams, headers);

			try {

				ResponseEntity<String> reservationResponseEntity = restTemplate.postForEntity(reservationUrl, reservationEntity, String.class);

				if (reservationResponseEntity.getStatusCode() == HttpStatus.OK) {
					System.out.println("\nReservation successful!");
					System.out.println("Details: " + reservationResponseEntity.getBody());

				} else {
					System.out.println("Failed to make a reservation. Please try again.");
				}
			} catch (Exception e) {
				System.err.println("An error occurred while processing your reservation: " + e.getMessage());
			}
		} else if (reservationResponse.equals("0")) {
			System.out.println("Thank you for using the comparator service!");
		} else {
			System.out.println("Invalid input. Please restart the program.");
		}

		System.out.println("Thank you for using the comparator service!");
	}

	private static List<Object> fetchOffers(int agence_id, String city, String startDate, String endDate, int numberOfPeople, int minStars, String url) {
		switch (agence_id) {
			case 1:
				try {
					MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
					params.add("agence_id", "1");
					params.add("username", "tripadvisor");
					params.add("password", "admin");
					params.add("city", city);
					params.add("startDate", startDate);
					params.add("endDate", endDate);
					params.add("numberOfPersons", String.valueOf(numberOfPeople));
					params.add("minStars", String.valueOf(minStars));

					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

					HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

					ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.POST, entity, List.class);

					if (response.getStatusCode() == HttpStatus.OK) {
						return response.getBody();
					}
				} catch (Exception e) {
					System.err.println("Error calling API at " + url + ": " + e.getMessage());
				}
				break;
			case 2:
				try {
					MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
					params.add("agence_id", "2");
					params.add("username", "airbnb");
					params.add("password", "admin");
					params.add("city", city);
					params.add("startDate", startDate);
					params.add("endDate", endDate);
					params.add("numberOfPersons", String.valueOf(numberOfPeople));
					params.add("minStars", String.valueOf(minStars));

					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

					HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

					ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.POST, entity, List.class);

					if (response.getStatusCode() == HttpStatus.OK) {
						return response.getBody();
					}
				} catch (Exception e) {
					System.err.println("Error calling API at " + url + ": " + e.getMessage());
				}

				break;

			case 3:
				try {
					MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
					params.add("agence_id", "3");
					params.add("username", "booking");
					params.add("password", "admin");
					params.add("city", city);
					params.add("startDate", startDate);
					params.add("endDate", endDate);
					params.add("numberOfPersons", String.valueOf(numberOfPeople));
					params.add("minStars", String.valueOf(minStars));

					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

					HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

					ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.POST, entity, List.class);

					if (response.getStatusCode() == HttpStatus.OK) {
						return response.getBody();
					}
				} catch (Exception e) {
					System.err.println("Error calling API at " + url + ": " + e.getMessage());
				}
				break;
			default:
				System.err.println("Error in this " + url);
		}

		return null;
	}

	public static void addUser(String phone, String mail, String name) {
		String insertQuery = "INSERT INTO CLIENT (phone, mail, NAME) VALUES (?, ?, ?)";
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			 PreparedStatement statement = connection.prepareStatement(insertQuery)) {

			statement.setString(1, phone);
			statement.setString(2, mail);
			statement.setString(3, name);

			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println("User " + name + " added successfully!");
			}
		} catch (SQLException e) {
			System.err.println("Error adding new user: " + e.getMessage());
		}
	}

	private static void printOfferDetails(List<Object> offers) {
		if (offers.isEmpty()) {
			System.out.println("No offers found.");
			return;
		}

		// Loop through all the offers
		for (Object offer : offers) {
			// Cast the offer object to a Map (or you can use a specific class if you prefer)
			Map<String, Object> offerDetails = (Map<String, Object>) offer;

			System.out.println("\n-------------------------------------------");

			// Extract offer details
			Object id = offerDetails.get("id");
			Object newPrice = offerDetails.get("newPrice");
			Object availabilityStart = offerDetails.get("availabilityStart");
			Object availabilityEnd = offerDetails.get("availabilityEnd");
			Object numberOfBeds = offerDetails.get("numberOfBeds");
			Object agencyUsername = offerDetails.get("agencyUsername");
			//Object agencyPassword = offerDetails.get("agencyPassword");
			Object agencyId = offerDetails.get("agencyId");
			Object pictureUrl = offerDetails.get("pictureUrl");

			// Extract nested hotel and chambre details
			Map<String, Object> chambre = (Map<String, Object>) offerDetails.get("chambre");
			Object chambrePrice = chambre.get("price");
			Object chambreNumberOfBeds = chambre.get("numberOfBed");
			Object chambrePic = chambre.get("pic");

			Map<String, Object> hotel = (Map<String, Object>) chambre.get("hotel");
			Object hotelName = hotel.get("name");
			Object hotelStars = hotel.get("stars");
			Object hotelNumberOfBeds = hotel.get("numberOfBeds");

			Map<String, Object> adr = (Map<String, Object>) hotel.get("adr");
			Object country = adr.get("country");
			Object city = adr.get("city");
			Object street = adr.get("street");
			Object positionGPS = adr.get("positionGPS");

			// Print offer details
			System.out.println("Offer ID: " + id);
			System.out.println("New Price: " + newPrice);
			System.out.println("Availability Start: " + availabilityStart);
			System.out.println("Availability End: " + availabilityEnd);
			System.out.println("Number of Beds: " + numberOfBeds);
			System.out.println("Agency : " + agencyUsername);
			//System.out.println("Agency Password: " + agencyPassword);
			System.out.println("Agency ID: " + agencyId);
			System.out.println("Picture URL: " + pictureUrl);

			// Print chambre details
			System.out.println("\nChambre Details:");
			System.out.println("Chambre Price: " + chambrePrice);
			System.out.println("Chambre Number of Beds: " + chambreNumberOfBeds);
			System.out.println("Chambre Pic: " + chambrePic);

			// Print hotel details
			System.out.println("\nHotel Details:");
			System.out.println("Hotel Name: " + hotelName);
			System.out.println("Hotel Stars: " + hotelStars);
			System.out.println("Hotel Number of Beds: " + hotelNumberOfBeds);

			// Print address details
			System.out.println("\nHotel Address:");
			System.out.println("Country: " + country);
			System.out.println("City: " + city);
			System.out.println("Street: " + street);
			System.out.println("Position GPS: " + positionGPS);
			System.out.println("-------------------------------------------");
		}
	}

	// Method to retrieve all credit card details from the database
	private static void displayAllCreditCards() {
		String selectSQL = "SELECT * FROM CREDIT_CARD";

		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			 Statement stmt = connection.createStatement();
			 ResultSet rs = stmt.executeQuery(selectSQL)) {

			System.out.println("Credit Card Information:");
			while (rs.next()) {
				int cardId = rs.getInt("id");
				String cardNumber = rs.getString("card_number");
				String expirationDate = rs.getString("expiration_date");

				// Display credit card details (mask card number for security)
				System.out.printf("Card ID: %d, Card Number: **** **** **** %s, Expiration Date: %s",
						cardId, cardNumber.substring(cardNumber.length() - 4), expirationDate);
			}
		} catch (SQLException e) {
			System.err.println("Error retrieving credit card information: " + e.getMessage());
		}
	}

	// Method to add a new credit card to the database
	private static void addCreditCard(String cardNumber, String expirationDate) {
		String insertSQL = "INSERT INTO CREDIT_CARD (card_number, expiration_date) VALUES (?, ?)";

		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			 PreparedStatement stmt = connection.prepareStatement(insertSQL)) {

			stmt.setString(1, cardNumber);
			stmt.setString(2, expirationDate);
			stmt.executeUpdate();

			System.out.println("Credit card added successfully.");
			System.out.printf("Card ID: %d, Card Number: **** **** **** %s, Expiration Date: %s",
					2, cardNumber.substring(cardNumber.length() - 4), expirationDate);
		} catch (SQLException e) {
			System.err.println("Error adding credit card: " + e.getMessage());
		}
	}



}






