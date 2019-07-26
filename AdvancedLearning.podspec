

Pod::Spec.new do |spec|

  spec.name         = "AdvancedLearning"
  spec.version      = "0.0.1"
  spec.summary      = "Learning Advanced."
  spec.description  = <<-DESC 
			  一个学习库Learning Advanced
			DESC

  spec.homepage     = "https://github.com/985589477/iOS-AdvancedLearning.git"



  spec.license      = "MIT"

  spec.author             = { "985589477" => "lx985589477@sina.com" }

  spec.platform     = :ios, "8.0"

  #spec.ios.deployment_target = "8.0"


  spec.source       = { :git => "https://github.com/985589477/iOS-AdvancedLearning.git", :tag => "#{spec.version}" }


  spec.source_files  = "Objective-C/OC-Foundation/**/Source/*.{h,m}"


  spec.requires_arc = true

end
