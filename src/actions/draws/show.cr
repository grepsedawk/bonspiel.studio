class Draws::Show < BrowserAction
  get "/draws/:draw_id" do
    # TODO only draws in my bonspiel
    html ShowPage,
      draw: DrawQuery.find(draw_id)
  end
end
