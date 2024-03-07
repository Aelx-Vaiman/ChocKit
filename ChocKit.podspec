#
# Be sure to run `pod lib lint ChocKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ChocKit'
  s.version          = '0.1.7'
  s.summary          = 'A library of reusable SwiftUI components that are missing from the SwiftUI framework.'

  s.description      = <<-DESC
    TODO: Add long description of the pod here.
  DESC

  s.homepage         = 'https://github.com/Alex-Vaiman/ChocKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Vaiman' => 'alex.vaiman@gmail.com' }
  s.source           = { :git => 'https://github.com/Aelx-Vaiman/ChocKit.git', :tag => s.version.to_s }
  s.swift_versions   = '5.9' # Specify Swift version
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files =   'ChocKit/Sources/**/*'
  s.preserve_paths = 'ChocKit/Sources/**/*'
  
  # s.resource_bundles = {
  #   'ChocKit' => ['ChocKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
