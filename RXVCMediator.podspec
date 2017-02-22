




Pod::Spec.new do |s|
  s.name     = "RXVCMediator"
  s.version  = "0.2"
  s.license  = "MIT"
  s.summary  = "ViewController push or present with Mediator"
  s.homepage = "https://github.com/xzjxylophone/RXVCMediator"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXVCMediator.git', :tag => "v#{s.version}" }
  s.description = %{
    RXVCMediator is a simple viewcontroller to push or present.
  }
  s.source_files = 'RXVCMediator/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '5.0'

end




