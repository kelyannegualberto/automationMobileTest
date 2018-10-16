Feature: User able to create and manage custom conversions

  @custom_create
  Scenario: User able to create nee conversion
    #Given I land on home screen
    Then I press on menu icon
    Then I press on My conversions button
    Then I press on Create your first conversion button
    And I type "Power" as custom conversion name
    When I press on New unit button
    Then I type "Horse power" as unit name
    Then I type "HP" as unit symbol
    Then I type "1" as unit value
    Then I press submit checkmark on Custom conversion screen
    When I press on New unit button
    Then I type "Mule power" as unit name
    Then I type "MP" as unit symbol
    Then I type "0.5" as unit value
    Then I press submit checkmark on Custom conversion screen
    When I press on OK button
    Then I verify "Power" added to Custom conversions list