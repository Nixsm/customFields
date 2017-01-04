class User
  include Mongoid::Document
  field :name, type: String
  field :pass, type: String

  embeds_many :custom_fields
  embeds_many :contacts
end
