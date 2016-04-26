Pod::Spec.new do |s|
  s.name     = 'YarnBotApi'
  s.version  = '0.0.1'
  s.license  = { :type => 'MIT' }
  s.authors  = 'spf2'
  s.homepage = 'https://github.com/spf2/yarn-bot-api'
  s.source   = { :git => 'https://github.com/spf2/yarn-bot-api.git' }
  s.summary  = 'Yarn Bot API'

  s.ios.deployment_target = '7.1'
  s.osx.deployment_target = '10.9'

  # Run protoc with the Objective-C and gRPC plugins to generate protocol messages and gRPC clients.
  # You can run this command manually if you later change your protos and need to regenerate.
  s.prepare_command = "protoc --objc_out=proto/objc --objcgrpc_out=proto/objc proto/*.proto -I proto"

  # The --objc_out plugin generates a pair of .pbobjc.h/.pbobjc.m files for each .proto file.
  s.subspec "Messages" do |ms|
    ms.source_files = "proto/objc/*.pbobjc.{h,m}"
    ms.header_mappings_dir = "."
    ms.requires_arc = false
    ms.dependency "Protobuf", "~> 3.0.0-alpha-4"
  end

  # The --objcgrpc_out plugin generates a pair of .pbrpc.h/.pbrpc.m files for each .proto file with
  # a service defined.
  s.subspec "Services" do |ss|
    ss.source_files = "proto/objc/*.pbrpc.{h,m}"
    ss.header_mappings_dir = "."
    ss.requires_arc = true
    ss.dependency "gRPC", "~> 0.12"
    ss.dependency "#{s.name}/Messages"
  end
end
