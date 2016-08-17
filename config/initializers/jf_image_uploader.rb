CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     '아이디',    #얘네 디플로이 후 반드시 서버 껐다 켜주자                    # required
    aws_secret_access_key: '비밀번호',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'http://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'banana-tree'                          # required
  config.fog_public     = true                                        # optional, defaults to true
end