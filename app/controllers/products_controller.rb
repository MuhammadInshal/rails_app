# frozen_string_literal: true

class ProductsController < AuthenticatedController
  after_action :allow_shopify_iframe

  def index
  	byebug
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    render(json: { products: @products })
  end

  def allow_shopify_iframe
	  response.headers['X-Frame-Options'] = 'ALLOWALL'
  end
end
