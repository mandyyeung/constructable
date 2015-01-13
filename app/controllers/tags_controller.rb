class TagsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @tag = Tag.find(params[:id])
    @tagged_requests = Request.tagged_with(@tag.name)
  end
end
