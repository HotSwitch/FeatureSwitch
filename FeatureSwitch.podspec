#
#  Be sure to run `pod spec lint FeatureSwitch.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name             = "FeatureSwitch"
  s.version          = "0.1.0"
  s.summary          = "HotSwitch Feature Manager"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "Simple library that handles allowing and disallowing features in an iOS Apple."


  s.homepage         = "https://github.com/HotSwitch/FeatureSwitch"
  s.license          = 'MIT'
  s.author           = { "Ravel Antunes" => "ravelantunes@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/FeatureSwitch.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hotswitch'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  #s.source_files  = “FeatureSwitch”, "FeatureSwitch/**/*.{h,m}"
  s.source_files = 'FeatureSwitch/**/*'

  # s.public_header_files = "Classes/**/*.h"
end
