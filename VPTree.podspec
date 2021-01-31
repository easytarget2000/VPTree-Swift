Pod::Spec.new do |s|
  s.name             = 'VPTree'
  s.version          = '0.1.2'
  s.summary          = 'A vantage-point data structure for efficient nearest neighbor searching.'

  s.description      = "Fork of lchenay/VPTree-Swift, which in turn is inspired by huyng/algorithms for Python. The purpose of this fork is to update the repository to the latest Swift 5 changes."

  s.homepage         = 'https://github.com/easytarget2000/VPTree-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'easytarget2000' => 'michel@easy-target.eu' }
  s.source           = { :git => 'https://github.com/easytarget2000/VPTree-Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'VPTree/Classes/**/*'
  
  s.swift_versions = '5'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
