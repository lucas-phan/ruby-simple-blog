class Patient < ApplicationRecord
    has_many :appoinments
    has_many :physicians, through: :appoinments
end
