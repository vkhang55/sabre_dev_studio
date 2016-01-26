require File.expand_path("../test_helper", __FILE__)

class SabreDevStudio::Base
  @@token = 1
end

class SabreDevStudio::Base::BaseTests < Test::Unit::TestCase
  def setup
    SabreDevStudio.configure do |c|
      c.client_id     = 'V1:USER:GROUP:DOMAIN'
      c.client_secret = 'PASSWORD'
      c.uri           = 'https://api.test.sabre.com'
    end
  end

  def test_canned_request_success
    stub_request(:get, "#{SabreDevStudio.configuration.uri}/v2/shop/themes").
      to_return(json_response('air_shopping_themes.json'))
    themes = SabreDevStudio::Base.get('/v2/shop/themes')
    assert_equal 'BEACH', themes['Themes'].first['Theme']
  end

  def test_request_object
    stub_request(:get, "#{SabreDevStudio.configuration.uri}/v2/shop/themes").
      to_return(json_response('air_shopping_themes.json'))
    endpoint = '/v2/shop/themes'
    request  = SabreDevStudio::RequestObject.new(endpoint)
    assert_equal 'self', request.links.first.rel
    assert_equal 'BEACH', request.themes.first.theme
  end
end
