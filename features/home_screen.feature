@home_screen
Feature: Tests for Home screen functionality

  Background:
    Given I land on home screen

  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left Unit picket value should be "Foot"
    Then Left Unit picket value should be "Centimeter"
    And Right unit picker value should be "Centimenter"
    And Right unit picker value should be "kely"

  Scenario: Show All button should be enabled at launch
    Then Show All button should be disabled
    When I type "1" on application keyboard
    Then Show All button should be enabled

  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should see result as "<result>"
    Examples:
    |target|result|
#    |1     |30.48    |
#    |2     |60.96    |
#    |3     |91.44    |
    |1011  |30 815.28|


  Scenario: User able to add current conversion to Favorites list
    Then I press on Add to favorites icon
    When I press on menu icon
    Then I press Favorite conversions
    And I verify "Comprimento" added to Favorite conversions List

  @search_temperature
  Scenario: User able to search by existing Conversion type
    Then I press on search icon
    Then I type "Temperatura" in search field
    And I press return button on soft keyboard
    Then I see "concas" as a current unit conversion
    Then Left Unit picket value should be "Celsius"
    And Right unit picker value should be "Fahrenheit"

  Scenario Outline: User able to select values from unit pickers
    Then I select "<unit_type>" from left unit picker
    When I type "<amound>" on application keyboard
    Then I should see result as "<result>"

    Examples:
    | unit_type | amound | result |
    |[Hist.rus.] Braça| 1|248     |
    |Cablee            | 1|18 520  |
    |Corrente         | 1|2 011.68|

  @convert_values
  Scenario: User able to convert values
    When I press on menu icon
    Then I select "Volume" from menu
    Then I select "Copo" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"

  @custom_create
  Scenario: User able to switch values
    Then Left Unit picket value should be "Pé"
    And Right unit picker value should be "Centímetro"
    When I press on switch units button
    Then Left Unit picket value should be "Centímetro"
    And Right unit picker value should be "Pé"

   Scenario: User able to cleanup conversion history
     When I press on menu icon
     Then I select "History" from menu
     Then I see "Temperature" as a current unit conversion
     Then I should see text "No history right now"
     When I press on menu icon
     Then I select "Length" from menu
     When I type "1" on application keyboard
     When I press on menu icon
     Then I select "History" from menu
     And I verify that 1st result 