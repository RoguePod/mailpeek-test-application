# frozen_string_literal: true

# Public: Base class for models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
