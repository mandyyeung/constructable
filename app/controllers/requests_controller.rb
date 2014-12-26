class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_request, except: [:index, :new, :create]
  helper_method :sort_column, :sort_direction

  def index
    @q = Request.search(params[:q])
    @requests = @q.result(distinct: true).order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 5)
  end

  def show
    @response = Response.new
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
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'RFI was successfully updated.' }
      else
        format.html { render :edit }
      end
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
      params.require(:request).permit(:subject, :body, responses_attributes: [:body])
    end

    def sort_column
      Request.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
