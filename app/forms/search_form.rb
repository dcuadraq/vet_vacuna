class SearchForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :name
  attribute :lastname
  attribute :phone
end
