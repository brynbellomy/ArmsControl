platform :osx, '10.10'

pod 'Funky', :path => '~/projects/_swift/Funky'

link_with 'ArmsControl', 'ArmsControlTests'

target :ArmsControl do
    pod 'SwiftyJSON', :git => "https://github.com/orta/SwiftyJSON", :branch => "podspec"
    pod 'LlamaKit', :git => "https://github.com/LlamaKit/LlamaKit"

    pod 'Starscream', :podspec => 'https://gist.github.com/brynbellomy/95b93bd392dc503983e0/raw/c93197dfe2b6ef5f4c0e0a96efa14b123f837986/Starscream.podspec'
    pod 'Signals', :podspec => 'https://gist.github.com/brynbellomy/e41274ce10b442550f2b/raw/7730dd6b5406ea9ee8e69ff252333080d574302b/Signals.podspec'

    pod 'BrynSwift', :path => "~/projects/_swift/BrynSwift"
    pod 'SwiftDataStructures', :path => "~/projects/_swift/SwiftDataStructures"
    pod 'SwiftBitmask', :path => "~/projects/_swift/SwiftBitmask"
    pod 'SwiftConfig', :path => "~/projects/_swift/SwiftConfig"
    pod 'SwiftLogger', :path => "~/projects/_swift/SwiftLogger"
    pod 'SwiftFlatUIColors', :path => "~/projects/_swift/FlatUIColors"
    pod 'UpdateTimer', :path => "~/projects/_swift/UpdateTimer"
end

target :ArmsControlTests do
    pod 'Quick', :git => 'https://github.com/Quick/Quick.git'
    pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git'
end



