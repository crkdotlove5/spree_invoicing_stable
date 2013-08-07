##Added Company Information with Prefernces
class Spree::CompanyConfiguration < Spree::Preferences::Configuration
  preference :company_name, :string
  preference :company_slogan, :string
  preference :company_address_number, :string
  preference :company_street, :string
  preference :company_city, :string
  preference :company_zip, :string
  preference :company_phone, :string
  preference :company_fax, :string
  preference :company_email, :string
  preference :company_website ,:string
  preference :company_vatnumber,:string
  preference :company_bannumber,:string
  preference :company_bicnumber ,:string
end