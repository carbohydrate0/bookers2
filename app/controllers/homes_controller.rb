class HomesController < ApplicationController

  def top
    if user_signed_in?
      book_index_path(current_user.id)
    else
      root_path
    end
  end

  def about
  end

end