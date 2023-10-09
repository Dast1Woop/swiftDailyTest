//
//  Date+Ex.swift
//  isCurrentTimeInTimeRange
//
//  Created by LongMa on 2023/10/9.
//

import Foundation

extension Date {
    
    /// 判断当前时间是否在指定时间段内，比如：对于9:00-18:00范围， 16:00在范围内，19:00不在范围内。
    /// - Parameters:
    ///   - startTime: HH:mm格式的起始时间
    ///   - endTime: HH:mm格式的终止时间
    /// - Returns: bool值
    static func isCurrentTimeInTimeRange(startTime: String, endTime: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let currentTime = Date()
        let calendar = Calendar.current
        
        guard let todayStart = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentTime),
            let todayEnd = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: currentTime),
            let startDateTime = dateFormatter.date(from: "\(calendar.component(.year, from: currentTime))-\(calendar.component(.month, from: currentTime))-\(calendar.component(.day, from: currentTime)) \(startTime)"),
            var endDateTime = dateFormatter.date(from: "\(calendar.component(.year, from: currentTime))-\(calendar.component(.month, from: currentTime))-\(calendar.component(.day, from: currentTime)) \(endTime)") else {
                return false
        }
        
        /**对于 06:00-01:00这种跨天导致 startDateTime > endDateTime 的情况，需要对 endDateTime +1天。
         2023-10-09 10:00:00 +0000
         2023-10-09 08:44:39 +0000
         2023-10-08 17:05:00 +0000 // +1天
         */
        if startDateTime > endDateTime {
            endDateTime = Date.getDateByPlusOneDay(originalDate: endDateTime)
        }
        
        /**---
         2023-10-07 00:00:00 +0000
         2023-10-07 10:06:00 +0000
         2023-10-07 11:00:00 +0000
         ---
         */
        print("---")
        print(startDateTime)
        print(currentTime)
        print(endDateTime)
        print("---")
        
        return currentTime >= startDateTime && currentTime <= endDateTime &&
            currentTime >= todayStart && currentTime <= todayEnd
    }


    /// 判断当前时间是否在多个时间段内
    /// - Parameter timeRanges: 多个时间段字典，键代表起始时间（HH:mm格式），值代表结束时间（HH:mm格式）
    /// - Returns: bool值
    static func isCurrentTimeIn(timeRanges:[String:String]) -> Bool  {
        var isIn = false
        if nil != timeRanges.firstIndex(where: { (key: String, value: String) in
            isCurrentTimeInTimeRange(startTime: key, endTime: value)
        }) {
            isIn = true
        }
        return isIn
    }
    
    static func getDateByPlusOneDay(originalDate:Date)->Date {
        // 创建一个 Calendar 对象
        let calendar = Calendar.current

        // 创建一个 DateComponents 对象，指定要增加的天数
        var dateComponents = DateComponents()
        dateComponents.day = 1

        // 使用 Calendar 对象将原始日期加上指定天数
        if let newDate = calendar.date(byAdding: dateComponents, to: originalDate) {
            print("原始日期: \(originalDate)")
            print("增加一天后的日期: \(newDate)")
            return newDate
        } else {
            print("无法计算增加一天后的日期。")
            return originalDate
        }
    }
}
