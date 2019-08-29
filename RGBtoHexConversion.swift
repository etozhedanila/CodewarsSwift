import Foundation

func convert(_ number: Int) -> String {
    switch number {
    case 0...9:
        
        return number.description
    case 10:
        return "A"
    case 11:
        return "B"
    case 12:
        return "C"
    case 13:
        return "D"
    case 14:
        return "E"
    case 15:
        return "F"
    default:
        return ""
    }
}

func convertColor(_ from: Int) -> String {
    var color: Int
    if from > 255 {
        color = 255
    }
    else if from <= 0 {
        return "00"
    }
    else {
        color = from
        if color <= 15 {
            return "0" + convert(color)
        }
    }
    var remain: Int
    var result = ""
    while color > 0 {
        remain = color % 16
        
        result += convert(remain)
        
        color = color / 16
    }
    
    return String(result.reversed())
    
}

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    let red = convertColor(r)
    let green = convertColor(g)
    let blue = convertColor(b)
    
    return red + green + blue
}


print(rgb(148,10,211))
print(rgb(255,255,300))
