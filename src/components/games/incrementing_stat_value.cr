class Games::IncrementingStatValue(T) < BaseComponent
  needs attribute : Avram::PermittedAttribute(T)
  needs game : Game
  needs disabled : Bool = false

  def render
    div class: "stat-value" do
      form_for Games::Update.with(game.id), class: "inline align-middle" do
        hidden_input attribute, value: Math.max(value - 1, 0)
        submit "-", class: "btn btn-circle #{disabled_class}"
      end
      span value, class: "align-middle mx-2"
      form_for Games::Update.with(game.id), class: "inline align-middle" do
        hidden_input attribute, value: value + 1
        submit "+", class: "btn btn-circle #{disabled_class}"
      end
    end
  end

  def disabled_class : String
    disabled? ? "btn-disabled" : ""
  end

  private def value
    attribute.value || 0
  end
end
