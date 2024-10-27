require 'gtk3'

# ウィンドウの初期設定
window = Gtk::Window.new
window.set_title("GTK メニューバーとテキストエリアの例")
window.set_default_size(400, 300)
window.signal_connect("destroy") { Gtk.main_quit }

# メニューバーの作成
menu_bar = Gtk::MenuBar.new
# テキストエリアの作成
text_view = Gtk::TextView.new
# "ファイル" メニューの作成
file_menu = Gtk::Menu.new
file_item = Gtk::MenuItem.new(label: "ファイル")
file_item.set_submenu(file_menu)

# "リセット" メニュー項目の作成
reset_item = Gtk::MenuItem.new(label: "新規")
reset_item.signal_connect("activate") do
  text_view.buffer.text = ""
  window.set_title("新規")
end
file_menu.append(reset_item)

#保存
save_item = Gtk::MenuItem.new(label: "保存")
save_item.signal_connect("activate") do
  # 保存ダイアログを表示
  dialog = Gtk::FileChooserDialog.new(
    title: "ファイルを保存",
    parent: window,
    action: Gtk::FileChooser::Action::SAVE,
    buttons: [
      [Gtk::Stock::CANCEL, Gtk::ResponseType::CANCEL],
      [Gtk::Stock::SAVE, Gtk::ResponseType::ACCEPT]
    ]
  )

  # デフォルトのファイル名を設定
  dialog.current_name = "untitled.txt"

  if dialog.run == Gtk::ResponseType::ACCEPT
    # ファイルを保存
    File.open(dialog.filename, "w") do |file|
      file.write(text_view.buffer.text)
    end
  end

  dialog.destroy
end
file_menu.append(save_item)

# "終了" メニュー項目の作成
exit_item = Gtk::MenuItem.new(label: "終了")
exit_item.signal_connect("activate") { Gtk.main_quit }
file_menu.append(exit_item)

# メニューバーに "ファイル" メニューを追加
menu_bar.append(file_item)

# テキストエリアの作成

text_view.buffer.text = "ここにテキストを入力してください。"

# スクロールウィンドウでテキストエリアを包む
scrolled_window = Gtk::ScrolledWindow.new
scrolled_window.add(text_view)

# ボックスレイアウトにメニューバーとテキストエリアを追加
vbox = Gtk::Box.new(:vertical, 0)
vbox.pack_start(menu_bar, :expand => false, :fill => false, :padding => 0)
vbox.pack_start(scrolled_window, :expand => true, :fill => true, :padding => 0)

# ウィンドウにレイアウトを追加
window.add(vbox)

# ウィンドウを表示
window.show_all

# メインループの開始
Gtk.main
