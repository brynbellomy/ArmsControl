

Pod::Spec.new do |s|
  s.name = 'BrynSwift'
  s.version = '0.0.1'
  s.license = 'WTFPL'
  s.summary = 'Swift helpers'
  s.authors = { 'bryn austin bellomy' => 'bryn.bellomy@gmail.com' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = "Classes/*.{swift,m,h}", "Extensions/*.{swift,m,h}"

  s.dependency 'Funky'
  s.dependency 'SwiftLogger'
  s.dependency 'LlamaKit'

  # s.homepage = 'https://github.com/Alamofire/Alamofire'
  # s.social_media_url = 'http://twitter.com/mattt'
  # s.source = { :git => 'https://github.com/brynbellomy/FlatUIColors.git', :tag => '0.0.1' }
end
