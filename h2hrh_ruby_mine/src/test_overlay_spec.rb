require 'rspec'
require 'selenium-webdriver'
require_relative '../src/page_object'

describe 'Testing cart' do

  @driver

  before(:each) do

    begin
      @driver = PageObject::Init.setUP('https://www.williams-sonoma.com/')
    rescue #close the intermiten''t OFF popup
      @driver.find_element(:class, 'stickyOverlayMinimizeButton').click
      retry
    end
  end

  after(:each) do
    @driver.quit
  end


  it 'should see a product on quick look overlay  ' do

    begin
      productName = 'All-Clad Copper Core 10-Piece Cookware Set'
      PageObject::HomePage.searchField(@driver).send_key(productName)
      PageObject::HomePage.searchButton(@driver).click
      sleep 3

      @driver.execute_script("window.scrollTo(0, 500)")
      sleep 6
      PageObject::Product.firstQuickLookButton(@driver).click
      sleep 3

      expect(PageObject::Product.productName(@driver).text == productName)


    rescue #close the intermitent OFF popup
      @driver.find_element(:class, 'stickyOverlayMinimizeButton').click
      retry
    end

  end

end