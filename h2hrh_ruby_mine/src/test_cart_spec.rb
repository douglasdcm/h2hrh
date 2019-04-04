require 'rspec'
require 'selenium-webdriver'
require_relative '../src/page_object'

describe 'Testing cart' do

  @driver

  before(:each) do

    begin
      @driver = PageObject::Init.setUP('https://www.williams-sonoma.com/')

    rescue #close the intermitent OFF popup
        @driver.find_element(:class, 'stickyOverlayMinimizeButton').click
        retry
    end
  end

  after(:each) do
    @driver.quit
  end


  it 'should add product to cart' do

    begin
    PageObject::HomePage.cookwareMenu(@driver).click

    PageObject::CookwareSets.cookwareSetsLink(@driver).click
    @driver.execute_script("window.scrollTo(0, 500)")
    sleep 3
    productName = PageObject::CookwareSets.firstProductImage(@driver).text
    PageObject::CookwareSets.firstProductImage(@driver).click

    @driver.execute_script("window.scrollTo(0, 500)")
    sleep 3
    PageObject::Product.addToCartButton(@driver).click
    sleep 3
    PageObject::Product.checkoutButton(@driver).click

    expect(PageObject::ShoppingCart.productLink(@driver).text == productName)


    rescue #close the intermitent OFF popup
        @driver.find_element(:class, 'stickyOverlayMinimizeButton').click
        retry
      #end
    end

  end

end