Given(/^I land on home screen$/) do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When(/^I press on menu icon$/) do
  puts("Menu icon pressed")
  find_element(accessibility_id: "Gaveta de navegação abrir").click
end

Then(/^I should see left side menu$/) do
  puts("I see left side menu")
  text("Conversor de Unidades")
end

When("I press on My conversions button") do
  puts("My conversions button pressed")
  text("Meus conversões").click
end

Then("I land on My convertions screen") do
  puts("Landed on My convertions screen")
  text("Meus conversões")
end