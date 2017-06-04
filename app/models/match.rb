class Match < ApplicationRecord
  has_many :match_participants, inverse_of: :match
  accepts_nested_attributes_for :match_participants, reject_if: :all_blank, allow_destroy: true
end
