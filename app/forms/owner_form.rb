class OwnerForm
  include ActiveModel::Model
  include Virtus.model

  attribute :<param>, <DataType>

  validates: <param>, presence: true ... nvalidations

  attr_reader :owner

  def save
    if valid?
      persist!
    else
      false
    end
  end

  def persist!
    self.owner = Owner.new
    self.owner.<params> = param{n}
    self.owner.save
  end

end
