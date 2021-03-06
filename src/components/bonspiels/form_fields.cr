class Bonspiels::FormFields < BaseComponent
  needs operation : SaveBonspiel

  def render
    mount Shared::Field, operation.name, &.text_input
    div data_controller: "date_range" do
      mount Shared::Field, operation.start_at, &.date_input(data_action: "change->date_range#setMinFromValue", data_target: "bonspiel_end_at", max: to_pretty_date_or_empty(operation.end_at))
      mount Shared::Field, operation.end_at, &.date_input(data_action: "change->date_range#setMaxFromValue", data_target: "bonspiel_start_at", min: to_pretty_date_or_empty(operation.start_at))
    end
    mount Shared::Field, operation.sheets, &.number_input(min: 1)
  end

  def to_pretty_date_or_empty(attribute)
    if val = attribute.value
      val.in(Time::Location.load("America/Chicago")).try(&.to_s("%Y-%m-%d"))
    else
      ""
    end
  end
end
