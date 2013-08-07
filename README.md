SpreeInvoicing
==============

Introduction goes here.

Spree Invoicing Extension
------------
 1.Added Invoice Generation.
 2.Added Multi-Lingual.
 3.Added Vat-Number to User Billing Address.
 4.Added Company Information with Preferences to ADMIN Configuration Tab.
 5.Added Language to User Account.
 6.Added Rake Task to create admin user with email,language and password !



Installation
------------

Add spree_invoicing to your Gemfile:

```ruby
gem 'spree_invoicing'
```

```ruby
gem 'spree_invoicing',:git => 'git@gitlab.partheas.net:kirana/spree_invoicing.git'
```


Bundle your dependencies and run the installation generator:



```shell
bundle
bundle exec rails g spree_invoicing:install
```

Create  Admin User with email,password and language !
============================================================

```shell
rake kirana_admin:create         #To Create Admin User with email,password and language !
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
