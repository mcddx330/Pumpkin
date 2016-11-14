#Pumpkin

## Easy way to use "SpriteKit" and more.

### Pumpkin.frameworkとは
SpriteKit.frameworkでよく使うであろう関数や部位、ゲームのセーブ・ロード等  
ひと通りのゲーム処理を容易に扱うために作られたラッパー兼フレームワークです。


### インストール
-
- `git clone https://github.com/mcddx330/Pumpkin.git`
- Pumpkin.xcodeprojを使いたいプロジェクトにドラッグ&ドロップ
- `import Pumpkin` でレッツエンジョイ


### 入っているもの
-
#### 予約済定数
##### PKPosition -> CGFloat(Tuple)
- Height
 - Full
 - Middle
 - MiddleUp
 - MiddleDown
- Width
 - Full
 - Middle
 - MiddleRight
 - MiddleLeft

画面を3分割にした際のそれぞれの交差点位置を返します。  
下の**PKShowGridLines**と組み合わせると見やすいです。


#### PKSceneExtension ... SKScene
- SKScene.PKshowGridLines(color:UIColor?=UIColor.whiteColor())  
画面上に3x3列の罫線を表示します。  
オプションでUIColorを設定できます。デフォルトは白（whiteColor()）です。

- SKScene.PKfetchViewSize() -> (Height:CGFloat, Width:CGFloat)  
アプリ起動中の画面サイズを縦横取得します。

#### PKActionExtension ... SKAction
##### ☆SlideIn(Out)X/SlideIn(Out)Yを使う場合は事前に対象となるSpriteNodeのAlpha値を "0.0" ("1.0") にしておかないと動きません。☆
- SKAction.PKslideInToX / PKslideInToY (toX/toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode, alpha:CGFloat?=1.0)  
指定されたX/Y座標へduration秒かけてスライドインします。

- SKAction.PKslideOutToX / PKslideOutToY (toX/toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode)  
指定されたX/Y座標へduration秒かけてスライドアウトします。

- SKAction.PKApply()  
上記のアクションを実行します。


#### PKImageSet
- PKImageSet(fileName: "FileName.jpg / png / etc...")  
指定したfileName画像を使用します。

 - fetchImageSize()-> (Height:CGFloat,Width:CGFloat)  
画像の縦と横のピクセルを返します。

 - fitToViewer()-> CGFloat  
画像のサイズ、比率に応じて画面にぴったり収まる拡大率を返します。

#### PKTextSet
- String.PKSeparateStrings(separator: String) -> [String]
 - Stringごとに文字を区切り、配列に並べます。

```
let text = "Sample Text.";
print(text.PKSeparateStrings(separator: " ")); // ["Sample", "Text."]
```

- String.PKSeparateStringsWithStringLength(separator: String) -> [Int: (count: Int, string: String)]
 - Stringごとに文字を区切り、文字数と文章を返します。

```
let text = "Sample Text.";
let separate = text.PKSeparateStringsWithStringLength(separator: " ");
print(separate[0]?.string) // "Sample"
for (count, sep) in separate {
    print(count)
    print(sep);
}
/*
0
(6, "Sample")
1
(5, "Text.")
*/
```

#### PKFileManage
- PKFileManage.**saveData** : Dictionary<String,AnyObject>  
セーブする情報のキーをStringで、データをAnyObject側に入れてください。

- PKFileManage(fileName: "PlistFileName.plist")  
指定したfileNameで設定ファイルを作成します。 (デフォルト：DefaultGameData.plist)


 - Save()-> Bool  
saveDataを参照した上で、アプリケーションの保存領域に指定したfileNameで保存します。

 - Load()-> Dictionary<String,AnyObject>  
指定したfileNameからデータを読み込みます。  
データ自体はAnyObjectとして展開されるため、必要に応じて**as String**や**as Int**など型変換をしてください。


### ライセンス
-
MIT License


### ToDo
-

- テキストを文字ごとに出力
- フェードイン・フェードアウト関連