# Uncomment the next line to define a global platform for your project
# platform :ios, '8.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def pods
    # Pods for talento-tech-ios
    pod 'Alamofire', '~> 4.4'
    
    pod 'ReachabilitySwift', '~> 3.0'
    
    pod 'SwiftyJSON'
    
    #pod for UITextfield
    pod 'IQKeyboardManagerSwift'
    
    #pod for progress
    pod 'NVActivityIndicatorView', '~> 4.0.0'
    
    #pods for Firebase
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'

    #pods for Facebook
    pod 'FBSDKLoginKit'
    

end

target 'talento-tech-ios' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  pods

  target 'talento-tech-iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'talento-tech-iosUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
