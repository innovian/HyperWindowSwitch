#
# Be sure to run `pod lib lint HyperWindowSwitch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HyperWindowSwitch'
  s.version          = '0.1.3'
  s.summary          = 'Easily Switch UIWindow’s RootviewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
In some scenarios you have to change the UIWindow’s rootviewController such as when the user’s token is invalidated on the server and you have to show another viewController, e.g. a login viewController. Although you can deal with pushing or presenting the viewController but using HyperWindowSwitch brings such benefits:

Allows to other viewControllers to be released (which preserves memory)
Provides several predefined animations
Supports custom animation.
                       DESC

  s.homepage         = 'https://github.com/innovian/HyperWindowSwitch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Innovian' => 'innovian.com' }
  s.source           = { :git => 'https://github.com/innovian/HyperWindowSwitch.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/innovian'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HyperWindowSwitch/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HyperWindowSwitch' => ['HyperWindowSwitch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
