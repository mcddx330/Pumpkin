//: Playground - noun: a place where people can play

import Pumpkin

var file = PKFileManage(plist_name: "sample_pumpkin_save_file");
var savedata = PKSaveData();

savedata = [
    "one": 1,
    "2": "two!",
];
file.Save(data: savedata);

let savefile = file.Load();
if let status = savefile["_return"] {
    print(savefile["_message"]!);
} else {
    print(savefile);
}

print(file.getDocumentPath());
