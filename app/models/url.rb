class Url < ActiveRecord::Base
  validates :short, uniqueness: true
end
