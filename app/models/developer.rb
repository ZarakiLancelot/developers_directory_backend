# == Schema Information
#
# Table name: developers
#
#  id         :integer          not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Developer < ApplicationRecord
end