class Team < ApplicationRecord
  has_many    :projects
  belongs_to  :users
end
