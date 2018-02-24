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
        pdf.text ">> Approval Code: #{@registration.approval_code} <<"
      else
        pdf.text "* This registration is <u>PENDING APPROVAL</u>.", inline_format: true
        pdf.text ">> Once approved, write approval code here: _________________"
      end
    else
      pdf.text "* This registration does not require approval."
    end
  end
  pdf.move_down 5
  pdf.stroke_horizontal_rule
  pdf.move_down 5
  pdf.formatted_text [
    { text: 'Need to cancel? ', styles: [:bold]},
    { text: 'visit ' },
    { text: cancel_url, styles: [:underline, :italic] },
    { text: ' and use the following cancellation codes:'}
  ]
  pdf.formatted_text [
    { text: 'Code A: ', styles: [:bold] },
    { text: @registration.access_keys[:key1], font: :Courier },
    { text: ' Code B: ', styles: [:bold] },
    { text: @registration.access_keys[:key2], font: :Courier }
  ]
end


