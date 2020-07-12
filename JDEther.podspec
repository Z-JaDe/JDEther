Pod::Spec.new do |s|
    s.name             = "JDEther"
    s.version          = "1.0.0"
    s.summary          = "区块链钱包"
    s.description      = <<-DESC
    区块链钱包库
    DESC
    s.homepage         = "https://github.com/Z-JaDe"
    s.license          = 'MIT'
    s.author           = { "ZJaDe" => "zjade@outlook.com" }
    s.source           = { :git => "git@github.com:Z-JaDe/JDEther.git", :tag => s.version.to_s }
    
    s.requires_arc          = true
    
    s.ios.deployment_target = '13.0'
    s.swift_versions        = '5.0','5.1','5.2','5.3'
    s.frameworks            = "Foundation"

    s.default_subspec = "Core"

    s.subspec "Core" do |ss|
        ss.source_files  = "Sources/*"

        ss.dependency "JDEther/ethers"
    end

    s.subspec "ethers" do |ss|
        ss.vendored_frameworks = "Sources/lib/ethers.framework"
    end

end
