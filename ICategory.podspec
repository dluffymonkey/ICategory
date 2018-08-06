Pod::Spec.new do |s|
  s.name         = "ICategory"
  s.version      = "0.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "iLeo" => "1427694267@qq.com" }
  s.social_media_url = 'http://ileo.top'
  s.homepage     = "https://github.com/dluffymonkey/ICategory"
  s.ios.deployment_target = '9.0'
  s.summary      = "UIKit,UIFoundation+Category"
  s.description  = <<-DESC
                  UIKit,UIFoundation+Category, yeah!
                   DESC
  s.source       = { :git => "https://github.com/dluffymonkey/ICategory.git", :tag => "v#{s.version}" }
  
  s.requires_arc = true
  s.source_files  = 'Category/*.{h,m}'
  s.public_header_files = 'Category/*.{h}'
  s.framework  = "Foundation", "UIKit"

end
