class Bonspiels::FormFields < BaseComponent
  needs operation : SaveBonspiel

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")

    mount Shared::Field, operation.start_at, &.datetime_input
    mount Shared::Field, operation.end_at, &.datetime_input
  end
end
