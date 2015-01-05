module RequestsHelper
  def dates_line_data
    @requests.each do |request|
      {
        created_at: request.created_at,
        id: request.id
      }
    end
  end
end
