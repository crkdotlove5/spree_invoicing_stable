
require 'prawn'
require 'prawn/layout'

#Logo company
##################################
           pdf.font "Helvetica"
           pdf.image "#{Rails.root.to_s}/app/assets/images/#{Spree::PrintInvoiceConfig[:print_invoice_logo_path]}" ,width:70 ,height:30
           pdf.text Spree.t(:invoice),size: 25  ,style: :bold ,align:  :right
           pdf.stroke_horizontal_rule

pdf.move_down 10

#Company Name && Company Slogan
##################################

pdf.text "#{Spree::Company::Config.company_name}",style: :bold,size: 20
pdf.text "#{Spree::Company::Config.company_slogan}"

pdf.move_down 10

#Company Details
##################################

y_position = pdf.cursor - 10
pdf.bounding_box([0, y_position], width: 250, height: 150) do
pdf.transparent(0.0) { pdf.stroke_bounds }
 pdf.text Spree.t(:company_address),style: :bold
 pdf.move_down 5
     pdf.text "#{Spree::Company::Config.company_street}      #{Spree::Company::Config.company_address_number}"
     pdf.text "#{Spree::Company::Config.company_zip}        #{Spree::Company::Config.company_city}"
     pdf.text "#{Spree::Company::Config.company_phone} , #{Spree.t(:fax)} : #{Spree::Company::Config.company_fax}"
     pdf.text "#{Spree::Company::Config.company_website}  #{Spree::Company::Config.company_email}"
     pdf.text " #{Spree.t(:vat_number)} : #{Spree::Company::Config.company_vatnumber}"
end

#Invoice Details
##################################

pdf.bounding_box([300, y_position], width: 250, height: 100) do
pdf.transparent(0.0) { pdf.stroke_bounds }
  pdf.text "#{Spree.t(:transaction_date)} : #{@order.created_at.to_date}",align: :right
  pdf.text "#{Spree.t(:invoice_number)} : #{(@order.number.to_s)}",align: :right
  pdf.text "#{Spree.t(:transction_number)}:#{(@order.updated_at.to_date)}",align: :right
  pdf.text "#{Spree.t(:account)} : #{Spree::Company::Config.company_bannumber}" , align: :right
  pdf.text "#{Spree.t(:bic)} : #{Spree::Company::Config.company_bicnumber}" ,align: :right
end


#Billing Address Details
##################################
y_position = pdf.cursor - 10
pdf.bounding_box([0, y_position], width: 200, height: 100) do
pdf.transparent(0.0) { pdf.stroke_bounds }
 pdf.text "#{Spree.t(:to)}:",size:15 , style: :bold,align: :left
         pdf.text "#{@order.bill_address.first_name}  #{@order.bill_address.lastname}"
          pdf.text "#{@order.bill_address.address1}  #{@order.bill_address.address2}"
          pdf.text "#{@order.bill_address.zipcode} #{@order.bill_address.city} #{@order.bill_address.state_name}"
          pdf.text "#{@order.bill_address.vat_number}"
end

#Shipping Address Details
##################################

pdf.bounding_box([300, y_position], width: 200, height: 100) do
pdf.transparent(0.0) { pdf.stroke_bounds }
 pdf.text "#{Spree.t(:ship_to)}:",size:15 , style: :bold,align: :left
 pdf.text "#{@order.ship_address.first_name}  #{@order.ship_address.lastname}"
pdf.text "#{@order.ship_address.address1}  #{@order.ship_address.address2}"
pdf.text "#{@order.ship_address.zipcode} #{@order.ship_address.city} #{@order.ship_address.state_name}"
pdf.text "#{Spree.t(:phone)}:#{@order.ship_address.phone}"
end

# Information Comments  Ends Here.
##################################

pdf.text Spree.t(:special_instructions),style: :bold
pdf.stroke_horizontal_rule

pdf.text "#{@order.special_instructions}",style: :bold
pdf.stroke_horizontal_rule


# Order Information // Line Items
##################################
# Information Comments  Ends Here.
##################################
pdf.move_down 8
pdf.stroke_horizontal_rule

 @order.line_items.each do |item|
 @name= item.variant.product.name
 @item_price = number_to_currency(item.price)
 @quantity = item.quantity.to_s
 @total = number_to_currency(item.price * item.quantity)
 #@discount = number_to_currency(-1 * item.discount)
 #@total_discount = number_to_currency(-1 * item.discount * item.quantity)
 @name1 = item.variant.options_text.inspect
 end

 @order.adjustments.eligible.each do |adjustment|
    next if (adjustment.originator_type == 'Spree::TaxRate') and (adjustment.amount == 0)
   next if (adjustment.amount == 0)
   @product_adjustment_label =  adjustment.label
   @product_adjustment = number_to_currency adjustment.amount
  end

  @subtotal =

# LIne Items / Order Data in Table
##################################

  pdf.table([ [Spree.t(:quantity), Spree.t(:description),Spree.t(:unit_price),Spree.t(:base_price),Spree.t(:vat_p),Spree.t(:vat),Spree.t(:total)],

                  ["#{@quantity}","#{@name}","#{ @item_price}","#{@total}","#{Spree::TaxRate.first.amount.to_s}%","#{number_to_currency  @order.tax_total}","#{@order.display_item_total}"],
                                          ["","","","","",Spree.t(:sub_total),"#{@order.display_item_total}
                                     "],
                                          ["","","","","",Spree.t(:vat),"#{number_to_currency @order.tax_total}"],
                                          ["","","","","",Spree.t(:shipping_handling),"#{ @order.display_ship_total}"],
                                          ["","","","","",Spree.t(:coupon_discount),""],
                                          ["","","","","",Spree.t(:total_due),"#{@order.display_total}"]])






#  Footer
##############################################

 pdf.move_cursor_to 45
 pdf.stroke_horizontal_rule
 pdf.move_down 5
 pdf.text Spree.t(:footer_quote)
 pdf.text "#{Spree.t(:contact) }:: #{Spree::Company::Config.company_name},#{Spree::Company::Config.company_phone},or #{Spree::Company::Config.company_email}",style: :bold



#  PDF ENDS HERE
##############################################
