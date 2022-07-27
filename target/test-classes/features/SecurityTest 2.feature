Feature: Security test. Token Generation test 

Scenario: generate token with valid username and password. 
		Given url "https://tek-insurance-api.azurewebsites.net"
		And path "/api/token"
		And request {"username": "supervisor", "password": "tek_supervisor"}
		When method post 
		Then status 200
		And print response
		
		
		Scenario: generate token with valid username and password. 
		Given url "https://tek-insurance-api.azurewebsites.net"
		And path "/api/token"
		And request {"username": "supervisor_superman", "password": "tek_supervisor_superman"}
		When method post 
		Then status 404
		And print response
		* def errorMessage = response.errorMessage 
		And assert errorMessage == "User_not_matched"
		
		#Test API ENdpoint "/api/token" with valid Username and invaild password. 
		#Status could should be 400. 
		#Response with "errorMessage":"Password not Matched". Take screen shot and share. 
		#NOTE: there is defect for this scenario already open. 
		
		Scenario: generate token with valid username and password. 
		Given url "https://tek-insurance-api.azurewebsites.net"
		And path "/api/token"
		And request {"username": "supervisor_superman", "password": "tek_supervisor_superman"}
		When method post 
		Then status 404
		And print response
		* def errorMessage = response.errorMessage 
		And assert errorMessage == "password_not_matched"
		
