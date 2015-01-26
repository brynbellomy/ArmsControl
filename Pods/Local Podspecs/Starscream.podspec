Pod::Spec.new do |s|
  s.name = 'Starscream'
  s.version = '0.0.1'
  s.license = 'WTFPL'
  s.summary = 'Logging.  In Swift.'
  s.authors = { 'Dalton and Austin Cherry' => '' }
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/daltoniam/Starscream'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = '*.swift'
  s.requires_arc = true
  
  s.source = { :git => 'https://github.com/daltoniam/Starscream.git', :branch => 'master' }
end
