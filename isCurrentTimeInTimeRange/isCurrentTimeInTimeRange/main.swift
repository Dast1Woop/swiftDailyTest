import Foundation


if Date.isCurrentTimeIn(timeRanges: ["6:00":"12:00", "13:00":"18:00"]) {
    print("1 在时间范围内")
}else {
    print("1 不在时间范围内")
}

if Date.isCurrentTimeIn(timeRanges: ["6:00":"16:39", "16:40":"00:00"]) {
    print("2 在时间范围内")
}else {
    print("2 不在时间范围内")
}

if Date.isCurrentTimeIn(timeRanges: ["6:00":"12:00", "16:00":"01:05"]) {
    print("3 在时间范围内")
}else {
    print("3 不在时间范围内")
}


