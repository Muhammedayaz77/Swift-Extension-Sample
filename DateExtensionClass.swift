import Foundation

extension Date {
    /// Converts a date to a string using a format.
    func convertDateToString(strDateFormate: String) -> String { let f = DateFormatter(); f.dateFormat = strDateFormate; return f.string(from: self) }
    /// Creates a date from a string using a UTC format.
    static func convertStringToDate(strDate: String, dateFormate: String) -> Date? { let f = DateFormatter(); f.dateFormat = dateFormate; f.timeZone = TimeZone(abbreviation: "UTC"); return f.date(from: strDate) }
    /// Returns the current date.
    static func getCurrentDate() -> Date { Date() }
    /// Returns true when the date is today.
    func isToday() -> Bool { Calendar.current.isDateInToday(self) }
    /// Returns true when the date is yesterday.
    func isYesterday() -> Bool { Calendar.current.isDateInYesterday(self) }
    /// Returns true when the date is tomorrow.
    func isTomorrow() -> Bool { Calendar.current.isDateInTomorrow(self) }
    /// Returns true when the date is in the weekend.
    func isWeekend() -> Bool { Calendar.current.isDateInWeekend(self) }
    /// Returns the start of the day.
    func getStartOfDay() -> Date { Calendar.current.startOfDay(for: self) }
    /// Returns the end of the day.
    func getEndOfDay() -> Date { Calendar.current.date(byAdding: DateComponents(day: 1, second: -1), to: getStartOfDay()) ?? self }
    /// Adds days to the date.
    func addingDays(_ days: Int) -> Date { Calendar.current.date(byAdding: .day, value: days, to: self) ?? self }
    /// Adds hours to the date.
    func addingHours(_ hours: Int) -> Date { Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? self }
    /// Adds minutes to the date.
    func addingMinutes(_ minutes: Int) -> Date { Calendar.current.date(byAdding: .minute, value: minutes, to: self) ?? self }
    /// Returns the number of days between two dates.
    func getDaysBetween(_ date: Date) -> Int { Calendar.current.dateComponents([.day], from: self, to: date).day ?? 0 }
    /// Returns a localized date string.
    func getShortDateString() -> String { let f = DateFormatter(); f.dateStyle = .short; return f.string(from: self) }
    /// Returns a localized long date string.
    func getLongDateString() -> String { let f = DateFormatter(); f.dateStyle = .long; return f.string(from: self) }
    /// Returns a localized time string.
    func getTimeString() -> String { let f = DateFormatter(); f.timeStyle = .short; return f.string(from: self) }
    /// Returns true when this date is earlier than another date.
    func isPastDate() -> Bool { self < Date() }
    /// Returns true when this date is later than another date.
    func isFutureDate() -> Bool { self > Date() }
    /// Returns a comparison message between two dates.
    static func compare(date: Date, compareDate: Date) -> String { date < compareDate ? "Future Date" : date > compareDate ? "Past Date" : "Same Date" }
    /// Converts a local date string to UTC using two formats.
    static func convertLocalToUTC(strDate: String, oldFormate: String, newFormate: String) -> String { convertTimeZone(strDate, from: oldFormate, fromZone: .current, to: newFormate, toZone: TimeZone(abbreviation: "UTC") ?? .current) }
    private static func convertTimeZone(_ value: String, from old: String, fromZone: TimeZone, to new: String, toZone: TimeZone) -> String { let f = DateFormatter(); f.dateFormat = old; f.timeZone = fromZone; guard let d = f.date(from: value) else { return value }; f.dateFormat = new; f.timeZone = toZone; return f.string(from: d) }
}
