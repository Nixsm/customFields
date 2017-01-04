class User
  include Mongoid::Document
  field :name, type: String
  field :pass, type: String
  field :custom_fields, type: Hash

  embeds_many :contacts
end
