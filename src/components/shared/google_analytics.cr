class Shared::GoogleAnalytics < BaseComponent
  needs id : String

  def render
    js_link "https://www.googletagmanager.com/gtag/js?id=#{id}"
    tag "script" do
      raw <<-JAVASCRIPT
      window.dataLayer = window.dataLayer || []
      function gtag(){dataLayer.push(arguments)}
      gtag('js', new Date())
      gtag('config', '#{id}')
      JAVASCRIPT
    end
  end
end
