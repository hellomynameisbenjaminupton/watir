# ---------------------
# Create steps from each step within the Gherkin scenario
# ---------------------

require_relative '../../Env/main'

Given('I am viewing google') do
  @main.go_url
end

When('I enter {string}') do |string|
  @main.search_box.wait_until(&:present?).click
  @main.sendkeys(string)
  @main.enter
  sleep 2
end

Then('The site will be listed') do
  result = @main.include('RedBalloon: Enriching Experiences & Gifts')
  raise(StandardError, 'Check search results are working') unless result
end

Then('The site will be listed - {string}') do |string|
  if string == 'git'
    result = @main.include("GitHub: Let's build from here · GitHub")
  else
    puts "Do something else"
  end
  raise(StandardError, 'Check search results are working') unless result
  @main.test
end


