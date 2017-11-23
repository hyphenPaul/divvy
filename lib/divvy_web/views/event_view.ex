defmodule DivvyWeb.EventView do
  use DivvyWeb, :view

  def created_gift?(gift, current_user) do
    gift.user_id == current_user.id
  end

  def month_to_s(month) do
    Enum.at(["Jan", "Feb" ,"Mar" ,"Apr" ,"May" ,"Jun" ,"Jul" ,"Aug" ,"Sep" ,"Oct", "Nov", "Dec"], month - 1)
  end
end
