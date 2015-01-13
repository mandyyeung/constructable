# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  subject        :string
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  to             :string
#  due            :date
#  status         :string
#  priority       :string
#  cost_impact    :string
#  trade          :string
#  opened         :date
#  filepicker_url :string
#  from           :string
#

class Request < ActiveRecord::Base
  include PublicActivity::Common

  has_many :responses
  has_many :comments
  has_many :recipients
  has_many :users, through: :recipients

  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :comments

  after_initialize :set_dates

  acts_as_taggable

  validates :from, presence: true
  validates :to, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      request = find_by_id(row["id"]) || new
      request.attributes = row.to_hash
      request.save!
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |request|
        csv << request.attributes.values_at(*column_names)
      end
    end
  end

  def set_dates
    self.opened ||= Date.today if self.new_record?
    self.due ||= (Date.today + 14) if self.new_record?
  end

  def overdue?
    self.status == "Open" && self.due < Date.today
  end
end
