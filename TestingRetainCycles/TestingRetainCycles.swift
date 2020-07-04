//
// Created by u on 06.06.20.
// Copyright (c) 2020 yes. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController, DownloaderDelegate {
    let downloader: Downloader

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.downloader = Downloader()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.downloader.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func startDownloading() {
        self.downloader.download(url: URL(string: "https://example.com/")!)
    }

    deinit {
        NSLog("deinit \(self)")
    }

    // MARK: - DownloaderDelegate

    public func downloadDidFinish(_ downloader: Downloader) {
    }
}
