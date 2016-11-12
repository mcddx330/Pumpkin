//
//  PKFileManage.swift
//  Pumpkin
//
//  Created by dimbow. on 2/6/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import Foundation

public typealias PKSaveData = Dictionary<String,Any>;
open class PKFileManage {
    private var document_directory: String = "";
    private var file_path: String = "";
    private var file_data: Data;
    
    private var destination_file_name: String = "DefaultGameData";
    
    
    public init(plist_name: String!) {
        if (plist_name != nil) {
            self.destination_file_name = plist_name;
        }
        
        // initialize
        self.document_directory  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        self.file_path            = document_directory + "/" + destination_file_name + ".plist";
        self.file_data            = NSKeyedArchiver.archivedData(withRootObject:  "");
    }

    /**
     * Get save file path.
     */
    public func getDocumentPath()->String {
        return self.file_path;
    }

    /**
     * Save with serialize.
     */
    public func Save(data:  PKSaveData)->Bool {
        self.file_data = NSKeyedArchiver.archivedData(withRootObject:  data);
        do {
            try file_data.write(to:  URL(fileURLWithPath:  file_path), options:  .atomic);
        } catch {
            return false;
        }
        
        return true
    }

    /**
     * Deselialize and load save data.
     */
    public func Load()->PKSaveData {
        let fileManager = FileManager.default;
        
        guard fileManager.fileExists(atPath:  file_path) else {
            return [
                "_return":  false,
                "_message": "Save data is not exists.",
            ];
        }
        let file = try? Data(contentsOf:  URL(fileURLWithPath:  file_path));

        guard let data = NSKeyedUnarchiver.unarchiveObject(with: file!) else {
            return [
                "_return":  false,
                "_message": "Save data is malformed."
            ];
        }

        return data as! PKSaveData;
    }
}
