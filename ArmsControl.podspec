Pod::Spec.new do |s|
  s.name = 'ArmsControl'
  s.version = '0.0.1'
  s.license = 'WTFPL'
  s.summary = 'Composable triggers and effects for SpriteKit games (in Swift).'
  s.authors = { 'bryn austin bellomy' => 'bryn.bellomy@gmail.com' }
  s.license = { :type => 'WTFPL', :file => 'LICENSE.md' }
  s.homepage = 'https://github.com/brynbellomy/ArmsControl'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = 'Classes/*.swift', 'Classes/**/*.swift'
  s.requires_arc = true

  s.dependency 'LlamaKit'
  s.dependency 'Funky'
  s.dependency 'BrynSwift'
  s.dependency 'SwiftDataStructures'
  s.dependency 'SwiftBitmask'
  s.dependency 'SwiftConfig'
  s.dependency 'UpdateTimer'
  # s.dependency 'Starscream'
  # s.dependency 'ReactiveCocoaSwift'

  s.source = { :git => 'https://github.com/brynbellomy/ArmsControl.git', :tag => s.version }
end
