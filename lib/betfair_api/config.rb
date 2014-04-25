module BetfairApi
  class Config

    include ActiveModel::Validations

    class Invalid < StandardError; end

    attr_accessor :app_key
    attr_accessor :pem_cert_path
    attr_accessor :username
    attr_accessor :password

  end
end