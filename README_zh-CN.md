[ [English](./README.md) | [Deutsch](./README_de.md) | 简体中文 ]

# ![Fingrom Logo](./docs/design-flow/logo/main.svg) 财务会计应用
[![许可证 : CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) 
[![检查状态](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml/badge.svg?branch=main)](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml)
[![构建状态](https://github.com/lyskouski/app-finance/actions/workflows/build.yml/badge.svg)](https://github.com/lyskouski/app-finance/actions/workflows/build.yml)

[![单元测试覆盖率](https://lyskouski.github.io/app-finance/coverage/unit_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/unit/index.html)
[![小工具测试覆盖率](https://lyskouski.github.io/app-finance/coverage/widget_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/widget/index.html)
[![端到端覆盖率](https://lyskouski.github.io/app-finance/coverage/e2e_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/e2e/index.html)

**Fingrom** (金融雷击) -- 无广告、无限制的开源跨平台财务会计应用程序。该解决方案的目标是创建一个直观、高效、包容的财务会计应用程序。 
它能让用户毫不费力地管理自己的财务，同时确保没有人掉队。


[![观看英语视频](./docs/marketing-flow/presentation_video.png)](https://youtu.be/sNTbpILLsOw)


| 类型                      | 阿尔法版本             | 预发布                         | 发布                           |
| ------------------------ | ----------------------| ----------------------------- | ----------------------------- |
| ![Apple](./docs/design-flow/icons/apple.png) iOS (Apple Store)        | [fingrom_iOS.ipa](https://github.com/lyskouski/app-finance/releases/latest) | [TestFlight: Fingrom](https://testflight.apple.com/join/93ECy9ZB) | [![iOS Apple Store](./docs/design-flow/badges/ios.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Apple](./docs/design-flow/icons/apple.png) macOS (Apple Store)      | [fingrom_macOS.zip](https://github.com/lyskouski/app-finance/releases/latest) | 无法进行测试 | [![macOS Apple Store](./docs/design-flow/badges/macos.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Android](./docs/design-flow/icons/android.png) Android (Google Play)    | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [[搁置]](https://github.com/lyskouski/app-finance/issues/129) | [[搁置]](https://github.com/lyskouski/app-finance/issues/129) |
| ![Android](./docs/design-flow/icons/android.png) Android (Galaxy Store)   | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [Galaxy Store](https://galaxystore.samsung.com/detail/com.tercad.fingrom) | [![Fingrom](./docs/design-flow/badges/galaxy-store.png)](https://galaxy.store/apFinance) |
| ![Android](./docs/design-flow/icons/android.png) Android (Huawei Gallery) | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [App Gallery](https://appgallery.huawei.com/#/app/C109437079) | [![App Gallery](./docs/design-flow/badges/huawei.png)](https://appgallery.huawei.com/#/app/C109437079) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Snap Store)       | [fingrom_LinuxSnap.snap](https://github.com/lyskouski/app-finance/releases/latest) | [![Fingrom](https://snapcraft.io/fingrom/badge.svg)](https://snapcraft.io/fingrom) | [![Snapcraft: Fingrom](./docs/design-flow/badges/snap-store.png)](https://snapcraft.io/fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Flathub)          | [fingrom_LinuxFlatpak.flatpak](https://github.com/lyskouski/app-finance/releases/latest)  | 无法进行测试 | [ ![Flathub: Fingrom](./docs/design-flow/badges/flathub.png) ](https://flathub.org/apps/com.tercad.fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (AppImage)         | [未决] | [未决] | [未决] |
| ![Windows](./docs/design-flow/icons/windows.png) Windows (Partner Center) | [fingrom_Windows.zip](https://github.com/lyskouski/app-finance/releases/latest) | [App Center: Fingrom](https://appcenter.ms/orgs/terCAD/apps/Fingrom) | [![Microsoft Store](./docs/design-flow/badges/windows.png)](https://apps.microsoft.com/detail/fingrom/9NNPDJ2ST0HV) |
| ![Web Browsers](./docs/design-flow/icons/web.png) Web 浏览器           | [fingrom_Web.tar.gz](https://github.com/lyskouski/app-finance/releases/latest) | [GitHub Pages: Fingrom](https://lyskouski.github.io/app-finance/) | [terCAD: Fingrom](https://tercad.com/app/finance/index.html) |


## 功能
- 会计（账户类型、货币/加密货币）
  - 通过`/`（名称）对主页进行简单分组
  - 交易日志
  - 按更新日期冻结金额（导入以前的历史记录）
- 预算类别
  - 通过 `/`（名称）对主页进行简单分组
  - 带限制重述：
    - 每月月初更新
    - 每月可配置限额
    - 与收入相关 (0.0 ... 1.0)
  - 或无限制地显示支出金额
- 账单、转账、收入（发票）
- 目标定义
- 汇率、摘要的默认货币
- 指标： 
  - 预算：
    - 预测（蒙特卡罗模拟）
  - 账户
    - 烛台（OHLC）图
    - 收入健康雷达
    - 货币分布
  - 票据
    - 年度支出
    - 类别条形图
  - 目标图表
  - 货币历史图表
- [[演示]](https://youtu.be/RccQ8JpfJs4) 设备间同步（P2P）
- 通过 WebDav 或直接文件恢复
- 从 "CSV"、"QIF "和 "OFX "文件导入账单和发票
- 数据加密
- 本地化： 8 种语言
- 用户体验
  - 可配置的主页（每个 "宽度 x 高度 "集有多种配置）
  - 响应式和自适应设计
    - 自适应导航面板（顶部、底部、右侧）和标签（顶部、左侧）
  - 主题模式（深色、浅色、系统色）与调色板定义（系统色、自定义色、个人色--颜色选择器）
  - 保留账户、预算和货币的最后选择
  - 自动滚动到表单上的重点元素
  - 在主页上展开/折叠部分
  - 轻扫可快速访问编辑和删除操作
  - 通过 "设置 "放大/缩小（从 60% 到 200
  - 快捷方式

| 说明             | 快捷键                      |
| --------------- | -------------------------- |
| 打开/关闭导航抽屉  | `Shift` + `Enter`          |
| 向上导航          | `上`                       |
| 向下导航          | `向下`                     |
| 打开所选内容      | `Enter`                    |
| 放大             | `Ctrl` + `+`               |
| 放大（用鼠标）     | `Ctrl` + `向下滚动`         |
| 缩小             | `Ctrl` + `-`               |
| 缩小（用鼠标）     | `Ctrl` + `向上滚动`         |
| 重置缩放          | `Ctrl` + `0`               |
| 添加新事务        | `Ctrl` + `N`               |
| 返回             | `Ctrl` + `退格键`           |
<!--
| 编辑选中的项目     | `Ctrl` + `E`               |
| 删除选中的项目     | `Ctrl` + `D`               |
-->


## 支持（赞助

作为一个开源项目，订阅不会解锁应用程序的任何其他功能。但是 对应用程序的不断发展和改进的投资。因此，如果您想 资助，请考虑以下选项：

* [Github 赞助](https://github.com/users/lyskouski/sponsorship)
* [Paypal](https://www.paypal.me/terCAD)
* [Patreon](https://www.patreon.com/terCAD)
* [Donorbox](https://donorbox.org/tercad)

或者，[请我喝咖啡](https://www.buymeacoffee.com/lyskouski)。


## 投稿

我们非常感谢**所做的任何贡献**（在 "贡献者 "部分、"发布 "说明以及应用程序 "关于"-"贡献者 "中提及，以示感谢）。
关于"-"贡献者 "中提及以示感谢），详情请查看[贡献部分](./CONTRIBUTING_zh-CN.md)。

但是，如果被选为对本版本的贡献（不只是错字更正），则表示您同意向我提供
我（和我可能的团队）认为合适的非独家使用许可。您可能已经猜到 
但我只是想说得更清楚些。


## 许可证和版权

本文内容均为 &copy; 2023 年**terCAD**团队（Viachaslau Lyskouski）所有。

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />本作品采用以下许可协议进行许可 <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivs 4.0 Unported License</a>:

- **署名**：提供许可证链接，并说明是否进行了修改
- **非商业**：不能作为商业解决方案的一部分使用
- **禁止衍生**：任何修改（混音、转换或在材料基础上构建）均不得自行发布。将其推回主资源库 ( https://github.com/lyskouski/app-finance )，
  以解除对所做修改的发布限制。
