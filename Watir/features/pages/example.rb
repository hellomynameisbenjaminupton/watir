module Example

  def go_url 
    @browser.goto "#{@goo}"
  end

  def search_box
    @browser.textarea(title: 'Search')
  end

  def test
    db_connect
    example_db
  end

end