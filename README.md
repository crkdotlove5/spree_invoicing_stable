SpreeInvoicing
==============

Introduction goes here.

Spree Invoicing Extension
------------
```ruby

 1.Added Invoice Generation.
 2.Added Company Information with Preferences to ADMIN Configuration Tab.
 3.Disabled JIRAFE Services.
 4.Added Customized Footer for UI.
```



Installation
------------

Add spree_invoicing to your Gemfile:

```ruby
gem 'spree_invoicing'
```

```ruby
gem 'spree_invoicing',:git => 'git@github.com:saikiranmothe/spree_invoicing_stable.git'
```


Bundle your dependencies and run the installation generator:



```shell
bundle
bundle exec rails g spree_invoicing:install
```

```
Copy Applicatoin LOGO -- Follow Steps
--------------
Rename LOGO to spree_50.png
And then copy to this path
#{Application}/app/assets/admin/bg/spree_50.png
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:


```ruby
require 'spree_invoicing/factories'
```

Copyright (c) 2013 [sai kiran mothe], released under the New BSD License
