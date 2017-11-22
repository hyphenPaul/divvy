defmodule DivvyWeb.EventView do
  use DivvyWeb, :view

  def created_gift?(gift, current_user) do
    gift.user_id == current_user.id
  end
end
