require 'net/ftp'

print "server"
server = gets.chomp

print "user"
user = gets.chomp


print "pass"
pass = gets.chomp


# FTPサーバーの情報
ftp_server = server  # サーバーのホスト名またはIPアドレス
ftp_user =   user     # FTPユーザー名
ftp_password = pass  # FTPパスワード
require 'net/ftp'

# ローカルのファイルパス
print "local path"
local_file_path = gets.chomp   # アップロードするファイルのパス


print "remote_dir:"
# リモートのディレクトリ
remote_directory = gets.chomp # 移動したいサーバー側のディレクトリ

begin
  # FTPオブジェクトを作成
  ftp = Net::FTP.new

  # サーバーに接続
  ftp.connect(ftp_server)

  # ログイン
  ftp.login(ftp_user, ftp_password)

  # 任意のディレクトリへ移動
  ftp.chdir(remote_directory)

  puts "ディレクトリ #{remote_directory} に移動しました"

  # ファイルをアップロード
  ftp.putbinaryfile(local_file_path)

  puts "ファイル #{local_file_path} をアップロードしました"

  # FTPセッションを終了
  ftp.close
rescue => e
  puts "エラーが発生しました: #{e.message}"
end
