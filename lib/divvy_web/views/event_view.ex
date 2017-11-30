defmodule DivvyWeb.EventView do
  use DivvyWeb, :view

  def comment_visible?(comment, gift, user) do
    cond do
      gift.user_id == user.id && comment.user_id == user.id -> true
      gift.user_id != user.id -> true
      true -> false
    end
  end

  def created_gift?(gift, current_user) do
    gift.user_id == current_user.id
  end

  def created_comment?(comment, current_user) do
    comment.user_id == current_user.id
  end

  def month_to_s(month) do
    Enum.at(["Jan", "Feb" ,"Mar" ,"Apr" ,"May" ,"Jun" ,"Jul" ,"Aug" ,"Sep" ,"Oct", "Nov", "Dec"], month - 1)
  end

  def gifts_for_member(event, member) do
    Enum.filter(event.gifts, &(&1.user_id == member.id))
  end

  def gifts_for_member?(event, member) do
    Enum.count(gifts_for_member(event, member)) > 0
  end

  def gift_comments(gift) do
    Divvy.Events.gift_comments(gift)
  end

  def comment_date_to_s(date) do
    "#{date.month}/#{date.day}/#{date.year} #{date.hour}:#{date.minute}"
  end
end
