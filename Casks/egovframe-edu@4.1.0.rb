cask "egovframe-edu@4.1.0" do
    version "4.1.0"
  
    app_name = ""
  
    on_arm do
      sha256 "aca2196203d5b6cfd0ba5f9f2c5f71705e2e534400b98707136f4c902ca6a77d"
  
      url "https://maven.egovframe.go.kr/publist/HDD1/public/eGovFrame-#{version}-Mac-64bit.dmg"
      app_name = "eGovFrame-#{version}-Mac-64it.app"
    end
    on_intel do
      sha256 "aca2196203d5b6cfd0ba5f9f2c5f71705e2e534400b98707136f4c902ca6a77d"
  
      url "https://maven.egovframe.go.kr/publist/HDD1/public/eGovFrame-#{version}-Mac-64bit.dmg"
      app_name = "eGovFrame-#{version}-Mac-64it.app"
    end
  
    name "egovframe"
    desc "Open-source framework by South Korea for web-based public service development"
    homepage "https://www.egovframe.go.kr/"
  
    livecheck do
      url "https://www.egovframe.go.kr/home/sub.do?menuNo=39"
      regex(/개발환경 (\d+\.\d+\.\d+)/i)
      strategy :page_match
    end
  
    app app_name
  
    postflight do
      set_ownership "/Users/EGOVEDU/eGovFrame-4.1.0/#{app_name}"
      system_command "/usr/bin/xattr",
                     args: ["-cr", "/Users/EGOVEDU/eGovFrame-4.1.0/#{app_name}"],
                     sudo: true
    end
  
    zap trash: [
      "~/Library/Preferences/org.eclipse.platform.ide.plist",
      "~/Library/Saved Application State/org.eclipse.platform.ide.savedState",
    ]
  end
  
