require 'selenium-webdriver'

module PageObject

  class Init

    def self.setUP(url)
      driver = Selenium::WebDriver.for(:firefox)
      driver.manage.window.resize_to(1200, 765)
      driver.navigate.to 'https://www.williams-sonoma.com/'
      return driver
    end

  end

  class HomePage

    def self.offPopUp(driver)
      element = driver.find_element(:class, 'stickyOverlayMinimizeButton')
      return element
    end

    def self.searchField(driver)
      element = driver.find_element(:id, 'search-field')
      return element
    end

    def self.searchButton(driver)
      element = driver.find_element(:id, 'btnSearch')
      return element
    end

    def self.HomePageLink(driver)
      element = driver.find_element(:class, 'tab-williams-sonoma-home')
      return element
    end

    def self.cookwareMenu(driver)
      element = driver.find_element(:class, 'topnav-cookware ')
      return element
    end

    def self.cookwareSetsMenu(driver)
      element = driver.find_element(:css, 'nav#topnav-container li.dropDown.hoverFade.category-0.hoverFadeActive > div > div:nth-child(1) > ul:nth-child(2) > li:nth-child(1) > a')
      return element
    end

  end

  class CookwareSets

    def self.cookwareSetsLink(driver)
      element = driver.find_element(:css, 'div#super-category div.left-nav > ul:nth-child(3) > li:nth-child(1) > a')
      return element
    end

    def self.firstProductImage(driver)
      element = driver.find_element(:css, 'div#subCatListContainer li:nth-child(1) > div.product-thumb > div > a > span:nth-child(2) > img')
      return element
    end

    def self.firstProductLink(driver)
      element = driver.find_element(:class, 'product-thumb hoverSwap')
      return element
    end

    def self.addToCartButton(driver)
      element = driver.find_element(:class, 'btn btn_addtobasket btn_addtobasket_add')
      return element
    end

  end

  class Product

    def self.productName(driver)
      element = driver.find_element(:css, 'div#purchasing-container h1')
      return element
    end

    def self.firstQuickLookButton(driver)
      element = driver.find_element(:css, 'div#search-tiles li:nth-child(1) > div.product-copy > quick-look > div > a > span')
      return element
    end

    def self.addToCartButton(driver)
      element = driver.find_element(:css, 'button#primaryGroup_addToCart_0 > span')
      return element
    end

    def self.checkoutButton(driver)
      element = driver.find_element(:css, 'a#anchor-btn-checkout')
      return element
    end

  end

  class ShoppingCart

    def self.productLink(driver)
      element = driver.find_element(:css, 'form#cartForm div.cart-table-row-title > a')
      return element
    end

  end

end