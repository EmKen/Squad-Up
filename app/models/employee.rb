class Employee < ApplicationRecord
  include Clearance::User
  belongs_to :company
end
