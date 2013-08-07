  #Added Bulk Generation Button in Admin Reports.
  Deface::Override.new(:virtual_path => "spree/admin/reports/index",
                       :name => 'printbuttons',
                       :insert_after => "[data-hook='reports_header']",
                       :partial => "spree/admin/orders/print_buttons1"
  )

  #Added Print Invoice to Order show page in Admin.
  Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                       :insert_after => "[data-hook='toolbar']",
                       :partial => "spree/admin/orders/print_buttons",
                       :name => "Invoices",
                       :original => 'ca58a9f2835ca4d071ba5dbffb14ac26a67192cc'
  )


  #Added Invoice for Users Account.
  Deface::Override.new(:virtual_path => %q{spree/orders/show},
                       :insert_before => "div#order",
                       :name => "invoiceprint",
                       :partial => "spree/admin/orders/print_buttons2"
  )

  Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
                       :name => 'replace_footer',
                       :insert_after => 'div#wrapper',
                       # :replace_footer => 'div#footer-left',
                       :text => "<hr><h6 style='text-align:center;padding:10px'> Powered By  <a href='/'>  #{Spree::Config.site_name} </a></h6>",
                       :sequence => {:after => 'remove_footer'},
                       :original => 'f824ceac0f13ad715146bb5826e05fd21f61c7b6'
  )

  Deface::Override.new(:virtual_path => 'spree/shared/_footer',
                       :name => 'remove_footer',
                       :remove => '#footer[data-hook]',
                       :original => '410a8316104f80d956fccfe598058832182e7a91'
  )

  ###JIRAFE


  # Remove Jirafe's javascript script code from header of all pages
  Deface::Override.new(:virtual_path => Spree::Config[:layout],
                       :name => "remove_analytics_header",
                       :insert_before => "a.icon-dashboard",
                       :text => "<h1>HI</h1>")

# Remove Jirafe's sidebar link from admin interface
  Deface::Override.new(:virtual_path =>
                           "spree/admin/shared/_configuration_menu",
                       :name => "remove_dashboard_sidebar_link",
                       :original => '41d2156ff3831df28710bd7fab1cef5bcb520372',
                       :remove => "code[erb-loud]:contains('jirafe')")

# Remove Jirafe's content for head in admin interface
  Deface::Override.new(:virtual_path => "spree/admin/overview/index",
                       :name => "remove_head_content",
                       :remove => "code[erb-silent]:contains('content_for
:head')",
                       :closing_selector => "code[erb-silent]:contains('end')")


# Remove Jirafe's content for dashboard page in admin interface
  Deface::Override.new(:virtual_path => "spree/admin/overview/index",
                       :name => "remove_head_content",
                       :remove => "div#jirafe",
                       :closing_selector => "code[erb-silent]:contains('end')",
                       )


# Remove Jirafe's content for dashboard page in admin interface
  Deface::Override.new(:virtual_path => "spree/admin/overview/index",
                       :name => "remove_head_content_locale",
                       :original => 'ed89241870b7f977e0afc74b43c134429eb23e94',
                       :remove => "li#jirafe_locales")


  Deface::Override.new(:virtual_path => "spree/layouts/admin",
                       :name => "add_tenant_header_link",
                       :insert_bottom => "ul[data-link=admin_login_navigation_bar]",
                       :text => "<%= configurations_sidebar_menu_item t(:jirafe), admin_analytics_path %>")
