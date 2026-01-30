

# 显式指定 iOS 平台版本（解决自动分配版本警告）
platform :ios, '13.0'
use_modular_headers!

# 定义主工程 Target 名称（避免硬编码错误）
MAIN_TARGET_NAME = '111'

# 配置需要安装的第三方库
target MAIN_TARGET_NAME do
  pod 'AFNetworking'  # 网络库（4.0.1 版本，适配 iOS 13.0+）
end

# post_install 钩子：修复架构、部署版本、Info.plist 路径
post_install do |installer|
  # 1. 修复第三方库的架构和部署版本
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # 适配 M 芯片 ARM64 架构
      config.build_settings.delete('VALID_ARCHS')
      config.build_settings['ARCHS'] = 'arm64'
      # 关闭警告转错误
      config.build_settings['TREAT_WARNINGS_AS_ERRORS'] = 'NO'
      # 强制部署版本为 13.0（解决 libarclite 报错）
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end

  # 2. 修复主工程的 Info.plist 路径（精准定位）
  # 获取工程根目录（Pods 目录的上级目录）
  project_root = File.dirname(installer.pods_project.path)
  # 主工程 .xcodeproj 的正确路径
  main_project_path = File.join(project_root, "#{MAIN_TARGET_NAME}.xcodeproj")
  
  # 验证文件存在后再操作，避免报错
  if File.exist?(main_project_path)
    main_project = Xcodeproj::Project.open(main_project_path)
    
    main_project.targets.each do |target|
      target.build_configurations.each do |config|
        # 拼接 Info.plist 的绝对路径
        info_plist_abs_path = File.join(project_root, MAIN_TARGET_NAME, 'Info.plist')
        config.build_settings['INFOPLIST_FILE'] = info_plist_abs_path
        # 同步主工程部署版本
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
    
    # 保存主工程的修改
    main_project.save
  else
    # 仅输出警告，不中断安装
    puts "⚠️  警告：未找到主工程文件 #{main_project_path}，请手动检查 Info.plist 路径！"
  end
end
