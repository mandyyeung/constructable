# == Schema Information
#
# Table name: recipients
#
#  id         :integer          not null, primary key
#  request_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_recipients_on_request_id  (request_id)
#  index_recipients_on_user_id     (user_id)
#

class Recipient < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
end
