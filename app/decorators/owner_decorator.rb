class OwnerDecorator

  attr_accesor :owner

  def initialize(owner)
    self.owner = owner
  end

  def name 
    owner.name.uppercase
  end

  def lastname
    owner.lastname.uppercase
  end

end
