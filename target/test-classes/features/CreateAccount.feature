Feature: Create Account

  #1) Test API endpoint "api/accounts/add-primary-account" to add new Account (Same as we do fill the form in UI)
  #Then status code should be 201-created, with response generate account with Email address.
  Background: genereate token for all scenearios.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Create New Account using Data generator;
    * def generator = Java.type('tiger.api.test.data.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDod()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "#(email)",
      "title": "Mr.",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "#(dob)"
      }
      """
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response
   # Then assert response.email == email

    
    
    
    
  
