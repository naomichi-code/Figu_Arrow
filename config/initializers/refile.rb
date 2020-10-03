require 'refile/s3'

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキーID
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: ENV['AWS_REGION'], # リージョン
    bucket: ENV['AWS_S3_BUCKET_NAME'], # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
else #開発環境設定
  aws = {
    access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキーID
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: ENV['AWS_REGION'], # リージョン
    bucket: ENV['AWS_S3_DEVELOPMENT_BUCKET_NAME'], # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end