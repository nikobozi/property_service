# This is the base class from which all other active record models can inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
