class EventDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  DATE_TIME_FORMAT = "%m/%d/%y (%I:%M %p)"

  def starts_at
    object.starts_at.strftime(DATE_TIME_FORMAT)
  end

  def ends_at
    object.ends_at.strftime(DATE_TIME_FORMAT)
  end

  def contact_email
    h.link_to object.contact_email, "mailto:#{object.contact_email}"
  end

  def price
    object.price.format
  end
end
