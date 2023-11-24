//
//  DateUtil.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/23.
//

import Foundation

class DateUtil {
    
    class func getDate(timestamp: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        
        if let timeZone = NSTimeZone(name: "GMT+2") as TimeZone? {
            dateFormatter.timeZone = timeZone
        }
        
        guard let date = dateFormatter.date(from: timestamp) else {
            return nil
        }
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    
    class func getTime(timestamp: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_ZA") as Locale
        if let timeZone = NSTimeZone(name: "UTC") as TimeZone? {
            dateFormatter.timeZone = timeZone
        }
        
        guard let date = dateFormatter.date(from: timestamp) else {
            return nil
        }
        
        dateFormatter.dateFormat = "HH:mm"
        let formattedTime = dateFormatter.string(from: date)
        return formattedTime
    }
}
