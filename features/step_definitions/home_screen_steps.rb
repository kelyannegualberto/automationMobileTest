Then("Left Unit picket value should be {string}") do |string|
  text_picket = find_element(id: "select_unit_spinner").text

  if(text_picket != string)
    fail("Expect left unit picket value is #{string}, actual value is #{text_picket}")
  end

end

Then("Right unit picker value should be {string}") do |string|
  array_of_elements = find_elements(id: "select_unit_spinner")
  array_actual_picker = array_of_elements[1].text
  if(array_actual_picker != string)
    fail("Expect right unit picket value is #{string}, actual value is #{array_actual_picker}")
  end
end

Then(/^Show All button should be (enabled|disabled)$/) do |state|
   button_state = find_element(id: "btn_show_all").enabled?

  if state == "enabled"
    fail("Expected to be enable") if button_state != true
  elsif state == "disabled"
    fail("Expected to be disable") if button_state != false
  end
end

When("I press on Clear button") do
  puts("clear button is pressed")
end


When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")
  digits.each do |digit|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{digit}']").click
  end
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  value = find_element(id: "target_value").text
  if value != result
    fail("o resultado esperado é #{result}, porém o resultado obtido foi #{value}")
  end
end

Then(/^I press on Add to favorites icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^I press Favorite conversions$/) do
  text("Conversões favoritos").click
end

And(/^I verify "([^"]*)" added to Favorite conversions List$/) do |unit_type|
  item_unit = find_element(id: "favorites_item_hint").text
  if item_unit != unit_type
    fail("Cannot find #{unit_type} in favorite list")
  end
end

Then(/^I press on search icon$/) do
  find_element(id: "action_search").click
end

Then(/^I type "([^"]*)" in search field$/) do |conversion_name|
  find_element(id: "search_src_text").send_keys(conversion_name)
end

And(/^I press return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:670, y:1130, count: 1).perform
end

Then(/^I see "([^"]*)" as a current unit conversion$/) do |current_conversion|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_conversion}']")
end

Then(/^I select "([^"]*)" from left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(value)
end

Then(/^I select "([^"]*)" from menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end

When(/^I press on switch units button$/) do
  find_element(id: "img_switch").click
end