#!/bin/bash
# 安装插件用
# 233年6月21日の大改
# 内部版本0.1

#这里太多命令属实没办法，只好使用万能的GPT来帮忙了！

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！"

  while true; do
    sleep 5
    clear
    echo "欢迎使用插件喵崽插件安装管理器！"
    cd $HOME/Miao-Yunzai

    echo "------------------------插件菜单 Made By htadiy------------------------"
    echo "              请选择要执行的操作："
    echo "              1. 安装锅巴插件【重要必装】"
    echo "              2. 安装星穹铁道插件"
    echo "              3. 安装阴天插件"
    echo "              4. 安装七圣召唤插件【可能会有问题】"
    echo "              5. 安装小雪插件"
    echo "              6. 安装拓展插件"
    echo "              7. 安装金毛脆脆鲨插件"
    echo "              8. 安装枫叶插件"
    echo "              9. 安装小叶插件"
    echo "              10. 安装自动插件"
    echo "              11. 安装图鉴插件"
    echo "              12. 安装椰奶插件"
    echo "              13. 安装土块插件"
    echo "              14. 安装抽卡插件"
    echo "              15. 安装逍遥插件"
    echo "              16. 安装戏天插件【重要】"
    echo "              17. 安装TRSS插件"
    echo "              18. 安装虚空插件"
    echo "              19. 安装清凉插件（原清凉图插件）"
    echo "              20. 安装文案插件"
    echo "              21. 安装牛牛大作战插件（原yinpa插件）"
    echo "              22. 安装喵喵插件【如果没装，必须装这个】"
    echo "              23. 安装榴莲插件"
    echo "              24. 一键安装全部插件【危险选项，可能会引起插件之间的冲突，请慎重考虑！选了不可挽回！】"
    echo "-----------------------------感谢这23个插件的作者！-----------------------------"              
    echo "-------------------------------------------------------------------"

    read -p "请输入命令编号(输入小写q退出脚本)： " command_number

   case $command_number in
    1)
        git clone https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/Guoba-Plugin/
        ;;
    2)
        git clone --depth=1 https://gitee.com/hewang1an/StarRail-plugin.git ./plugins/StarRail-plugin
        ;;
    3)
        git clone https://gitee.com/wan13877501248/y-tian-plugin.git ./plugins/y-tian-plugin/
        ;;
    4)
        git clone https://gitee.com/huangshx2001/call_of_seven_saints.git ./plugins/call_of_seven_saints/
        ;;
    5)
        git clone https://gitee.com/XueWerY/XiaoXuePlugin.git ./plugins/XiaoXuePlugin/
        ;;
    6)
        git clone --depth=1 https://gitee.com/SmallK111407/expand-plugin.git ./plugins/expand-plugin/
        ;;
    7)
        git clone https://gitee.com/JMCCS/jinmaocuicuisha.git ./plugins/Jinmaocuicuisha-plugin
        ;;
    8)
        git clone https://gitee.com/kesally/hs-qiqi-cv-plugin.git  ./plugins/hs-qiqi-plugin
        ;;
    9)
        git clone https://gitee.com/xiaoye12123/xiaoye-plugin.git ./plugins/xiaoye-plugin/
        ;;
    10)
        git clone --depth=1 https://gitee.com/Nwflower/auto-plugin.git ./plugins/auto-plugin/
        ;;
    11)
        git clone --depth=1 https://gitee.com/Nwflower/atlas ./plugins/Atlas/
        ;;
    12)
        git clone --depth=1 https://github.com/yeyang52/yenai-plugin.git ./plugins/yenai-plugin
        ;;
    13)
        git clone https://gitee.com/SmallK111407/earth-k-plugin.git ./plugins/earth-k-plugin/
        ;;
    14)
        git clone --depth=1 https://gitee.com/Nwflower/flower-plugin.git ./plugins/flower-plugin/
        ;;
    15)
        git clone https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin.git ./plugins/xiaoyao-cvs-plugin/
        ;;
    16)
        git clone https://gitee.com/XiTianGame/xitian-plugin.git ./plugins/xitian-plugin/
        ;;
    17) 
        git clone --depth 1 https://Yunzai.TRSS.me plugins/TRSS-Plugin
        ;;
    18)
        git clone --depth 1 https://gitee.com/go-farther-and-farther/akasha-terminal-plugin.git ./plugins/akasha-terminal-plugin
        ;;
    19)
        git clone https://gitee.com/xwy231321/ql-plugin.git ./plugins/ql-plugin/
        ;;
    20)
        git clone --depth=1 https://gitee.com/white-night-fox/wenan-plugin.git ./plugins/wenan-plugin/
        ;;
    21)
        git clone https://gitee.com/sumght/impart-pro-plugin.git ./plugins/impart-pro-plugin/
        ;;
    22)
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        ;;
    23)
        git clone https://gitee.com/huifeidemangguomao/liulian-plugin.git ./plugins/liulian-plugin/
        ;;
    24)
        git clone --depth 1 https://Yunzai.TRSS.me plugins/TRSS-Plugin
        git clone --depth 1 https://gitee.com/go-farther-and-farther/akasha-terminal-plugin.git ./plugins/akasha-terminal-plugin
        git clone https://gitee.com/xwy231321/ql-plugin.git ./plugins/ql-plugin/
        git clone --depth=1 https://gitee.com/white-night-fox/wenan-plugin.git ./plugins/wenan-plugin/
        git clone https://gitee.com/sumght/impart-pro-plugin.git ./plugins/impart-pro-plugin/
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        git clone https://gitee.com/huifeidemangguomao/liulian-plugin.git ./plugins/liulian-plugin/
        git clone https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/Guoba-Plugin/
        git clone --depth=1 https://gitee.com/hewang1an/StarRail-plugin.git ./plugins/StarRail-plugin
        git clone https://gitee.com/wan13877501248/y-tian-plugin.git ./plugins/y-tian-plugin/
        git clone https://gitee.com/huangshx2001/call_of_seven_saints.git ./plugins/call_of_seven_saints/
        git clone https://gitee.com/XueWerY/XiaoXuePlugin.git ./plugins/XiaoXuePlugin/
        git clone --depth=1 https://gitee.com/SmallK111407/expand-plugin.git ./plugins/expand-plugin/
        git clone https://gitee.com/JMCCS/jinmaocuicuisha.git ./plugins/Jinmaocuicuisha-plugin
        git clone https://gitee.com/kesally/hs-qiqi-cv-plugin.git  ./plugins/hs-qiqi-plugin
        git clone https://gitee.com/xiaoye12123/xiaoye-plugin.git ./plugins/xiaoye-plugin/
        git clone --depth=1 https://gitee.com/Nwflower/auto-plugin.git ./plugins/auto-plugin/
        git clone --depth=1 https://gitee.com/Nwflower/atlas ./plugins/Atlas/
        git clone --depth=1 https://github.com/yeyang52/yenai-plugin.git ./plugins/yenai-plugin
        git clone https://gitee.com/SmallK111407/earth-k-plugin.git ./plugins/earth-k-plugin/
        git clone --depth=1 https://gitee.com/Nwflower/flower-plugin.git ./plugins/flower-plugin/
        git clone https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin.git ./plugins/xiaoyao-cvs-plugin/
        git clone https://gitee.com/XiTianGame/xitian-plugin.git ./plugins/xitian-plugin/
        ;;
    q)
        break
       ;;        
    *)
        echo "无效的命令编号"
        ;;
   esac
 done