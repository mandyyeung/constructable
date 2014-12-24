class Requests::ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request

  def create
    @response = @request.responses.new(response_params)
    @response.user = current_user

    if @response.save
      redirect_to request_path(@request), notice: "Successfully posted response"
    else
      redirect_to @request, alert: "Unable to save response"
    end
  end

  private

    def set_request
      @request = Request.find(params[:request_id])
    end

    def response_params
      params.require(:response).permit(:body)
    end
end
