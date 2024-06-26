require 'watir'
require 'cucumber'
require 'securerandom'
require 'active_record'
require 'httparty'
require 'date'
require 'json'
require 'sanitize'

require_relative '../Env/database'
require_relative '../Env/httparty'
require_relative '../Env/init_watir'

require_relative '../../Watir/ExOz/features/pages/example'
require_relative '../../Watir/ExOz/features/pages/other'

class Main
  include Example
  include Database
  include Other

  def initialize
    @goo = "www.google.com.au"
    Watir.default_timeout = 60
    args = %w[--disable-dev-shm-usage --no-sandbox --log-level=3 --disable-3d-apis --headless]
    extensions = ['../../ghostery.crx']
    #include 'args: args, extensions: extensions' if ghostery needed in Prod
    @browser = Watir::Browser.new :chrome, :options => {args: args}
  end

  # ---------------------
  # Common
  # ---------------------

  def enter
    @browser.send_keys :enter
  end

  def tab
    @browser.send_keys :tab
  end

  def space
    @browser.send_keys :space
  end

  def back
    @browser.back
  end

  def sendkeys(*arg)
    @browser.send_keys(*arg)
  end

  def include(*arg)
    @browser.text.include?(*arg)
  end

  def go(*arg)
    @browser.goto(*arg)
  end

  def url
    @browser.url
  end

  def switch
    @browser.windows.last.use
  end

  def screenshot
    @browser.screenshot.save 'screenshot.png'
  end

  def page_title
    @browser.title
  end

  def browser_text
    @browser.text
  end

  def close
    @browser.quit
  end

  ## HTTP Party ###
  def word_api
    HTTParty.get("https://api.openbrewerydb.org/breweries/10-barrel-brewing-co-bend-1")
  end

end
