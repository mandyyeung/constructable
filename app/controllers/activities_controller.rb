class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: User.all.ids - [current_user.id], owner_type: 'User').paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.js
    end
  end

end
