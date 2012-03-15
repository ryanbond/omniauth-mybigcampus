# OmniAuth for My Big Campus

This gem contains the My Big Campus strategy for OmniAuth.

My Big Campus uses the OAuth 2.0 flow.

## How To Use It

Usage is as per any other OmniAuth 2.0 strategy. If you are using Rails, you need to add the strategy to your `Gemfile`:

    gem 'omniauth-mybigcampus'

You can pull it directly from github via:

    gem 'omniauth-mybigcampus', :git => 'https://github.com/ryanbond/omniauth-mybigcampus.git'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :mybigcampus, "consumer_key", "consumer_secret" 
    end

Now just follow the README at: https://github.com/intridea/omniauth

## Supported Rubies

OmniAuth for My Big Campus is tested under 1.8.7, 1.9.2, 1.9.3 and Ruby Enterprise Edition.

## Note on Patches/Pull Requests

- Fork the project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so I don’t break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send me a pull request. Bonus points for topic branches.

## License

Copyright (c) 2012 by Ryan Bond

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.