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

Then('The site will be listed - {string}') do |string|
  result = @main.include("As a composer, I've ventured into the world of audio alchemy")
  raise(StandardError, 'Check search results are working') unless result
end

Given('I do something') do
  puts "some code"
end

When('I call the Database') do
  @dee_bee = @main.test[0][1]
end


When('I call the api') do
  @response = @main.word_api['name']
end

Then('I get a result - {string}') do |string|
  if string == 'db'
    raise(StandardError, "check database for correct data") unless @dee_bee == 'Hello World!'
  elsif string == 'api'
    raise(StandardError, "check api for correct data") unless @response == '10 Barrel Brewing Co'
  end
end


