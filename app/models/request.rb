# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  subject     :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  to          :string
#  recipients  :string           default("{}"), is an Array
#  due         :date
#  status      :string
#  priority    :string
#  cost_impact :string
#  trade       :string
#

class Request < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  accepts_nested_attributes_for :responses

  validates :subject, presence: true
  validates :body, presence: true
  #validates_associated :responses

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Request.create! row.to_hash
    end
  end
end
