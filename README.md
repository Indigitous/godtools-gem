# godtools-gem

Ruby bindings for the Cru GodTools API.

For more about the API see the wiki at https://github.com/CruGlobal/godtools-api

## Development

Setup a Ruby environment based on `.ruby-version` and `.ruby-gemset` and then run `bundle install`

## Testing

Test are written with MiniTest. Before committing any code you should make sure tests are passing:

`rake test`

# Usage

## Setup

Add the following to your Gemfile:

`gem 'god_tools', git: 'https://github.com/Indigitous/godtools-gem.git', branch: 'master'`

And then run `bundle install`

Now you can require the library:

```
bundle exec irb
require 'god_tools'
 => true
```

Now setup the authorization key (required for every request, see API wiki):

`GodTools.authorization_key = "your key here"`

If you don't have a key you can request one (this will also set it automatically):

`GodTools.request_authorization_key!`

Set the API endpoint uri (defaults to a staging server):

`GodTools.base_uri = "http://..."`

## Meta

```ruby
response = GodTools::Meta.all
 => #<Hashie::Mash languages=[#<Hashie::Mash code="ta" name="Tamil" packages=[]>, ... ]>

response.languages.first.code
 => "ta"
```

## Translations

```ruby
translation = GodTools::Translations.new(language: 'en', package: 'kgp')
 => #<GodTools::Translations:0x007fc4b0a375b0 @language="en", @package="kgp">

translation.config
 => #<GodTools::Translations::Config about=#<Hashie::Mash filename="" title="About"> ... >

translation.config.page_set.first.filename
 => "a348a98b-77b1-4542-931c-c1af41bd206e"

translation.page("a348a98b-77b1-4542-931c-c1af41bd206e")
 => #<GodTools::Translations::Page translated_strings={"02cf6004-a0f9-4828-be26-09253d4490b6"=>"KNOWING GOD", "f1c599f5-dccc-4a9d-b81d-030e4cbce6cd"=>"personally", "778006c5-22a7-4abb-b81e-f04499f942e6"=>"These four points explain how to enter into a personal relationship with God and experience the life for which you were created."}>

translation.page("a348a98b-77b1-4542-931c-c1af41bd206e").translated_strings
 => {"02cf6004-a0f9-4828-be26-09253d4490b6"=>"KNOWING GOD", "f1c599f5-dccc-4a9d-b81d-030e4cbce6cd"=>"personally", "778006c5-22a7-4abb-b81e-f04499f942e6"=>"These four points explain how to enter into a personal relationship with God and experience the life for which you were created."}
```
