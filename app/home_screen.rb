class HomeScreen < PM::WebScreen
  title "Home"

  def content
    NSURL.URLWithString "https://store.apple.com"
  end

  def load_finished
    app = UIApplication.sharedApplication
    delegate = app.delegate
    location = webview.request.URL.absoluteString
    if location.hasPrefix("http://xxxxxxx/callback")
      afterAccessToken = location.componentsSeparatedByString("#access_token=").last
      accessToken = afterAccessToken.componentsSeparatedByString("&token_type").first
      delegate.open ProfileScreen.new(nav_bar: true, access_token: accessToken)
    else

    end
  end

  def load_failed(error)
    if error.code == NSURLErrorCancelled
      $r = webview.request
      puts "Request saved as $r"
    end
  end

end
