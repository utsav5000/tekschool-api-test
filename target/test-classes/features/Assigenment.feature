Feature: Add a car

  Background: genereate token for all scenearios.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Add account with Exsiting email address
    Given path "api/accounts/add-primary-account"
    And request {"email": "ut@gmail.com","title": "Mr", "firstName": "Utsav", "lastName": "Vaidyaa","gender": "MALE","maritalStatus": "SINGLE", "employmentStatus": "Student","dateOfBirth": "01/01/1999"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 400
    Then print response

  Scenario: Create an account and add a car.
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = 8150
    And request {"primaryPerson": { "email": "uts@gmail.com","title": "Mr","firstName": "Utsav", "lastName": "Vaidya", "gender": "MALE","maritalStatus": "MARRIED", "employmentStatus": "Student", "dateOfBirth": "01/01/1999"}, "make": "Toyota","model": "camry","year": "2019","licensePlate": "12345"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response

  Scenario: Add phone number to existing account.
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = 8150
    And request {"phoneNumber": "123-445-999","phoneExtension": "1013", "phoneTime": "9AM-5PM", "phoneType": "Cell phone"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response

  Scenario: Add address to existing account
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = 8150
    And request {"addressType": "House", "addressLine1": "12345 KTM ",  "city": "Gotham",  "state": "WonderLand ",  "postalCode": "44000",  "countryCode": "977"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    Then print response
    
    
