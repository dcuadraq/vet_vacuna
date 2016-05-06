class OwnerPresenter

  attr_accessor :owner

  def initialize(owner)
    self.owner = owner
  end

  def name
    owner.name.upcase
  end

  def lastname
    owner.lastname.upcase
  end

  def pets
    owner.pets
  end

end
