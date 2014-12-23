# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  request_id :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ActiveRecord::Base
end
