class Bonspiels::Index < BrowserAction
  get "/bonspiels" do
    html IndexPage, bonspiels: BonspielQuery.for(current_user)
  end
end
