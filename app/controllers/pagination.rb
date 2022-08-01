# frozen_string_literal: true

module Pagination
  def page_num
    params[:page_num]&.to_i || 1
  end

  def per_page
    params[:per_page]&.to_i || 1
  end

  def paginate_offset
    (page_num - 1) * per_page
  end
end
