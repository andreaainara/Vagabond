module ApplicationHelper
  def flash_class(level)
    case level
    when :success then "alert alert-success"
    end
  end
end
