//
// Created by u on 04.07.20.
// Copyright (c) 2020 yes. All rights reserved.
//

import Foundation

public protocol DownloaderDelegate: class {
    func downloadDidFinish(_ downloader: Downloader)
}

public class Downloader {
    public var delegate: DownloaderDelegate?

    public func download(url: URL) {
        NSLog("Start downloading \(url)")

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            NSLog("Finish downloading \(url)")
            self.delegate?.downloadDidFinish(self)
        }
    }
}
