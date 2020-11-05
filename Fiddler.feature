@smoke
	
Feature: Smoke Tests
	In order to find regressions
	As a QA agent
	I want to check basic operations

Background: 
	Given I have opened application "Fiddler Everywhere.exe"
	  And I have logged in

Scenario: Execute Get Request
	 When I go to "Composer"
	  And I execute GET request "http://en.wikipedia.org"
	 Then The responce body text should contain "wikipedia"

Scenario Outline: Live Traffic Should Contain Expected URL
	 When I go to "Composer"
	  And I execute GET request '<URL>'
	  And I go to "Live Traffic"
	 Then "Live Traffic" should contain URL '<URL>'

	Examples:
	| URL                     |
	| http://en.wikipedia.org |
	
Scenario: Request REST Service
	 When I go to "Composer"
	  And I execute GET request "https://jsonplaceholder.typicode.com/todos/1"
	 Then The respomse preview should contain '{ "userId": 1, "id": 1, "title": "delectus aut autem", "completed": false }'
