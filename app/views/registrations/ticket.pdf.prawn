prawn_document do |pdf|
  ## HEADER
  pdf.formatted_text(
    [{text: 'Event Registration Receipt', styles: [:bold]}]
  )
  pdf.stroke_horizontal_rule

  ## Data Table
  pdf.table [
    ["<b>Event</b>", @registration.event.title],
    ["<b>Registrant Name</b>", "#{@registration.first_name} #{@registration.last_name}"],
    ["<b>Registrant Email</b>", @registration.email],
    ["<b>Registration ID</b>", @registration.id],
    ["<b>Registered by:</b>", "#{@registration.user.email}<br>(#{@registration.user.id})"]
  ], cell_style: { inline_format: true }
  pdf.move_down 5

  ## Important Messages
  pdf.formatted_text [{text: 'Important Messages', styles: [:bold]}]
  pdf.font('Courier') do
    pdf.text "* Event starts on #{@event.starts_at}"
    pdf.text "* Event ends on #{@event.ends_at}"
    if @event.registration_requires_approval?
      if @registration.approved?
        pdf.text "* This registration has been APPROVED."
      else
        pdf.text "* This registration has NOT been approved."
      end
    else
      pdf.text "* This registration does not require approval."
    end
  end
end


