class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def disable
    active = false
  end

  def activate
    active = true
  end
end
