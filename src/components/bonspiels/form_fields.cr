class Bonspiels::FormFields < BaseComponent
  needs operation : SaveBonspiel

  def render
    mount Shared::Field, operation.start_at, &.date_input
    mount Shared::Field, operation.end_at, &.date_input
    mount Shared::Field, operation.sheets, &.number_input(min: 1)
  end
end
