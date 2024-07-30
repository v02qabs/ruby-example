require 'net/sftp'

# 接続情報を設定
host = 'ftp.chobi.net'
username = 'hirofumi090'
password = 'hirofumi090Abc'

# 転送するファイルとリモートのパスを設定
local_file_path = './readme.txt'
remote_file_path = '/public_html/readme.txt'
  # SFTPサーバーに接続
 Net::SFTP.start(host, username, :password => password) do |sftp|
  sftp.upload!("./readme.txt", "/public_html/readme.txt")
end