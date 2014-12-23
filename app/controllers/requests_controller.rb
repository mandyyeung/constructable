class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_request, except: [:index, :new, :create]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.new(request_params)
    if @request.save
      redirect_to requests_path
    else
      render action: :new
    end
  end

  def edit
    if @request.update_attributes(request_params)
      redirect_to @request
    else
      render 'edit'
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_path, notice: 'RFI was successfully deleted.' }
    end
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:subject, :body)
    end
end
