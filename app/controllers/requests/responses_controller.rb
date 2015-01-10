class Requests::ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request

  def create
    @response = @request.responses.new(response_params)
    @response.user = current_user

    if @response.save
      @response.create_activity :create, owner: current_user
      redirect_to request_path(@request)
    else
      redirect_to @request, alert: "Unable to save response"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @request, notice: 'Response was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def set_request
      @request = Request.find(params[:request_id])
    end

    def response_params
      params.require(:response).permit(:body, :opened)
    end
end
