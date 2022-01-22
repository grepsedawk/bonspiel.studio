class Dashboard::Index < BrowserAction
  get "/dashboard" do
    html Dashboard::IndexPage, bonspiels: BonspielQuery.for(current_user)
  end
end
