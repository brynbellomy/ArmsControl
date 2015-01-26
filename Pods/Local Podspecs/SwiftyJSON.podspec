Pod::Spec.new do |s|
  s.name         = "SwiftyJSON"
  s.version      = "2.1.1"
  s.summary      = "The better way to deal with JSON data in Swift"

  s.description  = <<-DESC
                  SwiftyJSON makes it easy to deal with JSON data in Swift.
                   DESC

  s.homepage     = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "tangplin" => "tangplin@gmail.com" }

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.8"

  s.source       = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => "2.1.1" }
  
  s.source_files  = "Source/SwiftyJSON.swift"
  s.framework  = "Foundation"
end
