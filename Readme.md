#Pumpkin

## Easy way to use "SpriteKit" and more.

### Pumpkin.frameworkとは
SpriteKit.frameworkでよく使うであろう関数や部位、ゲームのセーブ・ロード等の処理を容易に扱うために作られたフレームワークです。

### 名前の由来
"S"prite"K"itの頭文字"SK"にちなんで付けました。


### 入っているもの

#### PKSceneExtension ... SKScene
- SKScene.PKshowGridLines(x:Int, y:Int)

画面上に横軸x個、縦軸y個切られた罫線を表示します。

- SKScene.PKfetchViewSize() -> (Height:CGFloat, Width:CGFloat)

アプリ起動中の画面サイズを縦横取得します。

#### PKActionExtension ... SKAction
- SKAction.PKslideInToX / PKslideInToY (toX/toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode)

指定されたX/Y座標へduration秒かけてスライドインします。

- SKAction.PKslideOutToX / PKslideOutToY (toX/toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode)

指定されたX/Y座標へduration秒かけてスライドアウトします。

- SKAction.PKApply()

上記のアクションを実行します。


#### PKFuncs
- position -> CGFloat
 - UpLeft
 - UpMiddle
 - UpRight
 - MiddleLeft
 - Middle
 - MiddleRight
 - DownLeft
 - DownMiddle
 - DownRight

画面を3分割にした際のポジションを返します。


#### PKImageSet
- PKImageSet(fileName: "FileName.jpg / png / etc...")

指定したfileName画像を使用します。

 - fetchImageSize()->(Height:CGFloat,Width:CGFloat)

画像の縦と横のピクセルを返します。

 - fitToViewer()->CGFloat

画像のサイズ、比率に応じて画面にぴったり収まる拡大率を返します。

#### PKTextSet
- PKTextSet(text: "hogefuga")
指定したtextを使用します。

 - checkMultiLineText(checkString: "\n / | / etc...")->(Result:Bool,Lines:Array<String>)

改行を含んだテキスト（長いセリフなど）から改行部分を計算し、各行ごとに配列へ挿入した上で返します。

改行を含んだテキストではない場合は"Result = false"となります。

### PKFileManage
- PKFileManage.**saveData**:Dictionary`<String,AnyObject>`

セーブする情報のキーをStringで、データをAnyObject側に入れてください。

- PKFileManage(fileName: "PlistFileName.plist")

指定したfileNameで設定ファイルを作成します。 (デフォルト：DefaultGameData.plist)


 - Save()->Bool

saveDataを参照した上で、アプリケーションの保存領域に指定したfileNameで保存します。

 - Load()->Dictionary`<String,AnyObject>`

指定したfileNameからデータを読み込みます。

データ自体はAnyObjectとして展開されるため、必要に応じて"as String"や"as Int"など型変換をしてください。