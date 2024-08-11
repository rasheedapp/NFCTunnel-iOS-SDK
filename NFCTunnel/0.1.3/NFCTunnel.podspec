Pod::Spec.new do |s|
  s.name             = 'NFCTunnel'
  s.version          = '0.1.3'
  s.summary          = 'NFCTunnel is a NFC transmission channel'
  s.homepage         = 'https://github.com/rasheedapp/NFCTunnel-iOS-SDK.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'rasheedapp' => 'apps@rasheedapp.com' }
  s.source           = { :http => 'https://github.com/rasheedapp/NFCTunnel-iOS-SDK/releases/download/0.1.3/NFCTunnel-XCFramework.zip' }
  
  s.library      = 'z'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/NFCTunnel/"' }
  s.requires_arc = true

  s.swift_versions = '5.0'
  s.ios.deployment_target = '13.0'

  s.ios.source_files = 'NFCTunnel.xcframework/ios-arm64/NFCTunnel.framework/Headers/*.{h}'
  
  s.vendored_frameworks = 'NFCTunnel.xcframework'
end
