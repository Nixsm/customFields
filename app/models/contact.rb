class Contact
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :user
end
