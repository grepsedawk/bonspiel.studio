class Draws::Update < BrowserAction
  put "/draws/:id" do
    draw = DrawQuery.find(id)

    SaveDraw.update(draw, params) do |_, updated_draw|
      html UpdatePage, draw: updated_draw
    end
  end
end
