Pod::Spec.new do |s|
  s.name = 'SwiftConfig'
  s.version = '0.0.1'
  s.license = 'WTFPL'
  s.summary = 'Layered config framework to simplify complex initialization/loading of objects and values.'
  s.authors = { 'bryn austin bellomy' => 'bryn.bellomy@gmail.com' }
  s.license = { :type => 'WTFPL', :file => 'LICENSE.md' }
  s.homepage = 'https://github.com/brynbellomy/SwiftConfig'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = 'Classes/*.swift'
  s.requires_arc = true

  s.dependency 'Funky'
  s.dependency 'SwiftyJSON'
  s.dependency 'BrynSwift'
  #s.dependency 'SwiftBitmask'

  s.source = { :git => 'https://github.com/brynbellomy/SwiftConfig.git', :tag => s.version }
end
