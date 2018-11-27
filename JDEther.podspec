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
    
    s.ios.deployment_target = '10.0'
    s.frameworks            = "Foundation"
    s.swift_version         = "4.2"

    s.default_subspec = "Core"

    s.subspec "Core" do |ss|
        ss.source_files  = "Sources/*"

        ss.dependency "JDEther/ethers"
    end

    s.subspec "ethers" do |ss|
        ss.vendored_frameworks = "Sources/lib/ethers.framework"
    end

end
