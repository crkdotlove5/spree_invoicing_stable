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
                       :name => "Invoices"
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
                       :text => "<hr><h6 style='text-align:center;padding:10px'> Powered By  <a href=#{Spree::Config.site_url}>  #{Spree::Config.site_name} </a></h6>",
                       :sequence => {:after => 'remove_footer'},
                       :original => 'f824ceac0f13ad715146bb5826e05fd21f61c7b6'
  )

  Deface::Override.new(:virtual_path => 'spree/shared/_footer',
                       :name => 'remove_footer',
                       :remove => '#footer[data-hook]',
                       :original => '410a8316104f80d956fccfe598058832182e7a91'
  )
