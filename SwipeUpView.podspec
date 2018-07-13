#
# Be sure to run `pod lib lint SwipeUpView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwipeUpView'
  s.version          = '1.0.1'
  s.summary          = 'You can easly create swipeable views by using SwipeUpView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

SwipeUpView is used to create swipeable views. This is very useful to build swipe-based views. The interface is as simple as UIKit's.

                       DESC

  s.homepage         = 'https://github.com/zingat/SwipeUpView'
  s.screenshots     = 'https://raw.githubusercontent.com/zingat/SwipeUpView/master/SwipeUpView.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kadir Kemal Dursun' => 'kkdursun@yahoo.com', 'Yusuf Çınar' => 'yusuf.cinar@zingat.com', }
  s.source           = { :git => 'https://github.com/zingat/SwipeUpView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

  s.source_files = 'SwipeUpView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwipeUpView' => ['SwipeUpView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
