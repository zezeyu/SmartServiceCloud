#
# Be sure to run `pod lib lint HZHome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HZHome'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HZHome.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/heze/HZHome'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'heze' => 'heze@cyclecentury.com' }
  s.source           = { :git => 'https://github.com/heze/HZHome.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'HZHome/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HZHome' => ['HZHome/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.prefix_header_contents = '#import "HZHome.h"'
   s.dependency 'HZOCLib'
   s.dependency 'HZThemeManager'
   s.dependency 'HZMedidator'
   s.dependency 'QMUIKit', '~> 4.4.3'
   s.dependency 'SDCycleScrollView','>= 1.82'
   s.dependency 'MJExtension', '~> 3.4.1'
   s.dependency 'MJRefresh', '~> 3.7.5'
   s.dependency 'SDWebImage', '~> 5.13.0'
   s.dependency 'React'
end
