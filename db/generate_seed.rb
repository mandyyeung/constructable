require 'json'

file = File.read('random_users.json')
data = JSON.parse(file)
@users = []
data['results'].each do |user|
  @users << %Q{User.create!(full_name: '#{user['user']['name']['first'].capitalize} #{user['user']['name']['last'].capitalize}', email: '#{user['user']['name']['first']}.#{user['user']['name']['last']}@company.com', category: 'company.com', password: 'password123', password_confirmation: 'password123', avatar: '#{user['user']['picture']['thumbnail']}')}
end
puts @users

# GC Team
# 10
# Design Team
# 5
# Subcontractors
# 8
# Owner
# 3
# Consultants
# 2
