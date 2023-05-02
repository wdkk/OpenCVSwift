# OpenCVSwift
Swift Package Managerから使えるOpenCVのパッケージです.

Apple silicon (ARM64) での開発向けにビルドしています.

## 開発環境
- Apple silicon Mac (M1以降)
- XCode14.3

## 実行環境
- iOS 15.0以降 / macOS 12.0以降

## セットアップ

### 1. パッケージの検索と追加
利用したいXCodeの開発プロジェクトを開き, Add Packagesから以下のパッケージを検索してください.

https://github.com/wdkk/OpenCVSwift.git

OpenCVSwiftパッケージが表示されます. 
利用したいOpenCVバージョンを含む範囲を設定し, プロジェクトにパッケージを追加します.

左メニュー欄の Package DependenciesにOpenCVが追加されます.

### 2. libc++ライブラリの追加
XCodeプロジェクトの **[Targets]メニュー > [General]タブ** にある **[Frameworks, Libraries, and Embedded Content]欄** を探します.

ここに **libc++.tbd** を追加してください.

### 3. -all_loadフラグの追加
OpenCVのC/C++リソースにSwiftからアクセスするため, -all_loadフラグを追加します.

**[Targets]メニュー > [Build Settings]タブ** を開き, **[Other Linker Flags]**  を検索で絞って見つけます.

[Other Linker Flags]の プロジェクト名の欄に **[-all_load]** を追記します.

## 利用法
opencvを利用したいswiftファイル内でimportします.

```[swift]
import UIKit
import opencv2
```

```[swift]
// iOSのUIImageを作成(プロジェクトに追加したtest.jpgを読みます)
let path = Bundle.main.path(forResource: "test", ofType: "jpg" )
let img = UIImage( contentsOfFile:path! )

// UIImageからOpenCVのMatを作成
let src = Mat( uiImage:img! )
```
