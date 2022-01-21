class Shared::Breadcrumbs < BaseComponent
  def render
    div class: "text-sm breadcrumbs" do
      ul do
        li do
          link "Dashboard", Dashboard::Index
        end
        yield
      end
    end
  end
end
