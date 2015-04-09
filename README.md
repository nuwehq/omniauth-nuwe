
![build status](https://codeship.com/projects/90ad4cf0-c028-0132-c8c4-12477713df02/status?branch=master)

# OmniAuth Nuwe

This gem contains the Nuwe OAuth2 Strategy for OmniAuth.

## Installation

Add to your application's `Gemfile`:

```ruby
gem 'omniauth-nuwe'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Nuwe` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Nuwe uses the Doorkeeper gem to use NuAPI as an OAuth2 provider. This is necessary to gain access to the V3 endpoints of this API.  Developers can sign up for a developer account at https://api.nuapi.co.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :nuwe, ENV['NUWE_KEY'], ENV['NUWE_SECRET']
end
```

You can now access the OmniAuth Nuwe OAuth2 URL: `/auth/nuwe`.
