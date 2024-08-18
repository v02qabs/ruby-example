require 'net/ftp'

# FTPサーバーの情報
ftp_server = 'ftp.chobi.net'   # サーバーのホスト名またはIPアドレス
ftp_user = 'hirofumi090'       # FTPユーザー名
ftp_password = 'hirofumi090Abc'   # FTPパスワード

begin
  # FTPオブジェクトを作成
  ftp = Net::FTP.new

  # サーバーに接続
  ftp.connect(ftp_server)

  # ログイン
  ftp.login(ftp_user, ftp_password)

  puts "ログインに成功しました"

  # 必要な操作をここに追加
  # 例: ファイル一覧を取得
  files = ftp.list
  puts "サーバー上のファイル一覧:"
  puts files

  # FTPセッションを終了
  ftp.close
rescue => e
  puts "エラーが発生しました: #{e.message}"
end
