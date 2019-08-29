import Foundation

func formatDuration(_ seconds: Int) -> String {
    if seconds == 0 {
        return "now"
    }
    var sec = seconds
    var results = [String]()
    var duration = ""
    
    let years = sec / (3600 * 24 * 365)
    sec = years != 0 ? sec % (3600 * 24 * 365) : sec
    let yearsString = years > 0 ? (years > 1 ? "\(years) years" : "1 year") : ""
    if yearsString != "" {
        results.append(yearsString)
    }
    
    let days = sec / (3600 * 24)
    sec = days != 0 ? sec % (3600 * 24) : sec
    let daysString = days > 0 ? (days > 1 ? "\(days) days" : "1 day") : ""
    if daysString != "" {
        results.append(daysString)
    }
    
    let hours = sec / 3600
    sec = hours != 0 ? sec % 3600 : sec
    let hoursString = hours > 0 ? (hours > 1 ? "\(hours) hours" : "1 hour") : ""
    if hoursString != "" {
        results.append(hoursString)
    }
    
    let minutes = sec / 60
    sec = minutes != 0 ? sec % 60 : sec
    let minutesString = minutes > 0 ? (minutes > 1 ? "\(minutes) minutes" : "1 minute") : ""
    if minutesString != "" {
        results.append(minutesString)
    }
    
    
    let secondsString = sec > 0 ? (sec > 1 ? "\(sec) seconds" : "1 second") : ""
    if secondsString != "" {
        results.append(secondsString)
    }
    
    for (index,str) in results.enumerated() {
        if index == results.count - 1 && results.count > 1 {
            duration += " and "
        }
        else {
            if index > 0 {
                duration += ", "
            }
        }
        duration += str
        
    }
    
    return duration
}

formatDuration(3662)
