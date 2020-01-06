//
//  main.swift
//  Money Prototype
//
//  Created by Leo Puvilland on 1/6/20.
//  Copyright © 2020 Leo Commandblocks. All rights reserved.
//

import Foundation

func saveV(name:String, text:String) -> String {
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let fileURL = DocumentDirURL.appendingPathComponent(name).appendingPathExtension("txt")
    do {
        // Write to the file
        try text.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }
    return fileURL.absoluteString
}

func readV(fileURL: String) -> String {
    var readString = "" // Used to store the file contents
    do {
        // Read the file contents
        readString = try String(contentsOf: NSURL(fileURLWithPath: fileURL) as URL)
    } catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    return readString
}

func readDate() -> Date {
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let fileURL1 = DocumentDirURL.appendingPathComponent("date").appendingPathExtension("txt")
    if FileManager.default.fileExists(atPath: fileURL1.absoluteString) {
        let startDate = readV(fileURL: fileURL1.absoluteString)
        return DateFormatter().date(from: startDate) ?? Date()
    } else {
        FileManager.default.createFile(atPath: fileURL1.absoluteString, contents: "".data(using: String.Encoding.ascii))
        let startDate = Date()
        return startDate
    }
}

