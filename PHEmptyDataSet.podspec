#
#  Be sure to run `pod spec lint StrechableHeader.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


s.name         = "PHEmptyDataSet"
s.version      = "1.0.0"
s.summary      = "A lightWeight (No data ,no network) display tool for IOS."

s.homepage     = "https://github.com/HeterPu/PHEmptyDataSet"

s.license      = "MIT"

s.author             = { "HuterPu" => "wycgpeterhu@sina.com" }

s.platform     = :ios, "5.0"
s.source       = { :git => "https://github.com/HeterPu/PHEmptyDataSet.git", :tag => s.version }
s.source_files  = "PHEmptyDataSet/PHEmptyDataSet"

# s.resource  = "icon.png"
# s.resources = "Resources/*.png"

s.frameworks = 'Foundation', 'UIKit'
s.requires_arc = true

end
