module RequestsHelper
  include ActsAsTaggableOn::TagsHelper

  def dates_line_data
    #will come back to this
  end

  def cost_donut_data
    # this method could be refactored to account for futher changes to cost_impact options
    options = [{label: "Increase"}, {label: "Decrease"}, {label: "None"}, {label: "Unknown"}]
    options.map do |option|
      count = Request.where("cost_impact = ?", option[:label]).count
      option[:value] = count
    end
    options
  end

  def trade_bar_data
    # this method could be refactored to account for futher changes to trade options
    options = [{x: "Core & Shell"}, {x: "MEP"}, {x: "Interiors"}, {x: "Sitework"}]
    options.map do |option|
      count = Request.where("trade = ?", option[:x]).count
      option[:y] = count
    end
    options
  end
end
