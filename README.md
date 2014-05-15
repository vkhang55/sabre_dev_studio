# SabreDevStudio

This is the base gem for a suite of API wrappers for the Sabre Dev Studio APIs.

This gem includes the token authentication and basic error handling.

## Installation

Add this line to your application's Gemfile:

    gem 'sabre_dev_studio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sabre_dev_studio

## Usage

Register for an account at http://developer.sabre.com

Require this gem and whatever other sabre_dev_studio gem(s) that you need.

Configuration block (required, use your credentials):

    SabreDevStudio.configure do |c|
      c.user     = 'USER'
      c.group    = 'GROUP'
      c.domain   = 'DOMAIN'
      c.password = 'PASSWORD'
    end

To see an access token:

    token = SabreDevStudio::Base.get_access_token

An example request:

    themes = SabreDevStudio::Base.get('/v1/shop/themes')

cURL to test the account token dance:

    curl \
    -X POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --header "Authorization:Basic VmpFNk1UQTBNanBUVkZCVE9rVllWQT09OlFrdENRVzh6V0RNPQ==" \
    --data "grant_type=client_credentials" \
    https://api.test.sabre.com/v1/auth/token

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
