#
# Be sure to run `pod lib lint AJCoreComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AJCoreComponent'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AJCoreComponent.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/arun.tell6@gmail.com/AJCoreComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'arun.tell6@gmail.com' => 'arun.tell6@gmail.com' }
  s.source           = { :git => 'https://github.com/arun.tell6@gmail.com/AJCoreComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'AJCoreComponent/Classes/**/*'
  
   s.resource_bundles = {
     'AJCoreComponent' => ['AJCoreComponent/Assets/**/*.{png,pdf,ttf,xcassets,json}']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SnapKit'
end
