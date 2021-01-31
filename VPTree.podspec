#
# Be sure to run `pod lib lint VPTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VPTree'
  s.version          = '0.1.1'
  s.summary          = 'A vantage-point data structure for efficient nearest neighbor searching.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Fork of lchenay/VPTree-Swift, which in turn is inspired by huyng/algorithms for Python. The purpose of this fork is to update the repository to the latest Swift 5 changes."

  s.homepage         = 'https://github.com/easytarget2000/VPTree-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'easytarget2000' => 'michel@easy-target.eu' }
  s.source           = { :git => 'https://github.com/easytarget2000/VPTree-Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'VPTree/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VPTree' => ['VPTree/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
