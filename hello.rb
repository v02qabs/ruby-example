require 'gtk3'
require 'webkit2-gtk'

# 新しいアプリケーションを作成
app = Gtk::Application.new

# アプリケーションの起動時に実行するコードを定義
app.signal_connect('activate') do |application|
  # 新しいウィンドウを作成
  window = Gtk::ApplicationWindow.new(application)
  window.set_title("Hello, WebKit!")
  window.set_default_size(800, 600)
  
  # WebKitWebViewを作成
  webview = WebKit2Gtk::WebView.new

  # ウィンドウにWebViewを追加
  window.add(webview)

  # WebViewにURLを読み込む
  webview.load_uri("https://www.google.com")

  # ウィンドウを表示
  window.show_all
end

# アプリケーションを実行
app.run
