//
//  WindowContoller.swift
//  VoiceOver Designer
//
//  Created by Mikhail Rubanov on 05.05.2022.
//

import AppKit
import Projects
import Document
import Editor

class WindowContoller: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        let projects = ProjectsViewController.fromStoryboard()
        contentViewController = projects
        projects.router = self
    }
}

extension WindowContoller: ProjectsRouter {
    func show(with image: NSImage) {
        let controller = EditorViewController.fromStoryboard()
        controller.presenter.document = VODesignDocument(image: image)
        
        // VODesignDocument(fileName: "Test")
        
        window?.contentViewController = controller
    }
}

