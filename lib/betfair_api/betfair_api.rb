module BetfairApi

  class << self

    def config=(data)
      @config = data
    end

    def config
      @config ||= Config.new
      @config
    end

    def reset_config!
      remove_instance_variable :@config if defined?(@config)
    end

    def configure(&proc)
      @config ||= Config.new
      yield @config
    end

    def test_connect
      uri = URI.parse("https://identitysso.betfair.com/api/certlogin")
      pem = File.read(@confi.pem_cert_path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.cert = OpenSSL::X509::Certificate.new(pem)
      http.key = OpenSSL::PKey::RSA.new(pem)
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = Net::HTTP::Get.new(uri.request_uri)

      puts "RML #{request.to_s}"
    end

  end

end