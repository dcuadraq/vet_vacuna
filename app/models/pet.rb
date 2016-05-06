class Pet < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :breed
end
