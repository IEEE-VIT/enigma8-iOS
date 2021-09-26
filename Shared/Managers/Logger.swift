//
//  Logger.swift
//  Enigma
//
//  Created by Aaryan Kothari on 27/09/21.
//

import SwiftyBeaver

class Logger {
    
    fileprivate static let log = SwiftyBeaver.self

    class func configure() {
        let console = ConsoleDestination()  // log to Xcode Console
        console.minLevel = .verbose
        Logger.log.addDestination(console)
        
        let file = FileDestination()  // log to default swiftybeaver.log file
        file.minLevel = .error
        Logger.log.addDestination(file)
    }
    
    class func verbose(_ message: Any?, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        if let message = message {
            Logger.log.verbose(message, file, function, line: line, context: context)
        }
    }
    
    class func debug(_ message: Any?, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        if let message = message {
            Logger.log.debug(message, file, function, line: line, context: context)
        }
    }
    
    class func info(_ message: Any?, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        if let message = message {
            Logger.log.info(message, file, function, line: line, context: context)
        }
    }
    
    class func warning(_ message: Any?, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        if let message = message {
            Logger.log.warning(message, file, function, line: line, context: context)
        }
    }
    
    class func error(_ message: Any?, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        if let message = message {
            Logger.log.error(message, file, function, line: line, context: context)
        }
    }
    
}
