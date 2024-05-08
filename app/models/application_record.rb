class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(_auth_object = nil)
    %w[id email created_at updated_at]
  end
end
