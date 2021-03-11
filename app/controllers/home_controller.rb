# frozen_string_literal: true

class HomeController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification
  after_action :allow_shopify_iframe

  def index
    @shop_origin = current_shopify_domain
  end

  def allow_shopify_iframe
	  response.headers['X-Frame-Options'] = 'ALLOWALL'
  end
end
