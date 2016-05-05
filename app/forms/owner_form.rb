class OwnerForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :id, Integer
  attribute :name, String
  attribute :lastname, String
  attribute :phone, String 
  attribute :created_at, DateTime 
  attribute :updated_at, DateTime

  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true

  attr_accessor :owner

  def initialize(attrs = {}, owner: nil)
    self.owner = owner || Owner.new
    self.name = owner.name
    self.lastname = owner.lastname
    self.phone = owner.phone
    super(attrs)
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def method
    return :put if owner.persisted?
    :post
  end

  def action
    return owner_path(owner) if owner.persisted?
    owners_path
  end

  def persist!
    self.owner.save!
  end

end
