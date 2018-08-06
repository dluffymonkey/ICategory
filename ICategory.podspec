Pod::Spec.new do |s|
  s.name         = "ICategory"
  s.version      = "0.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "iLeo" => "1427694267@qq.com" }
  s.social_media_url = 'http://ileo.top'
  s.homepage     = "https://github.com/dluffymonkey/ICategory"
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.summary      = "UIKit,UIFoundation+Category"
  s.description  = <<-DESC
                   DESC
  s.source       = { :git => "https://github.com/dluffymonkey/ICategory.git", :tag => "#{s.version}" }
  
  s.requires_arc = true
  s.source_files  = 'Category/**/*.{h,m}'
  s.public_header_files = 'Category/**/*.{h}'

  s.ios.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation'

end
