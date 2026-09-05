import Foundation

extension Calendar {

    /// Returns the current calendar.
    static func getCurrentCalendar() -> Calendar {
        return current
    }

    /// Returns the start of a date.
    func getStartOfDay(for date: Date) -> Date {
        return startOfDay(for: date)
    }

    /// Returns the end of a date.
    func getEndOfDay(for date: Date) -> Date {
        return date(byAdding: DateComponents(day: 1, second: -1), to: startOfDay(for: date)) ?? date
    }

    /// Returns true when a date is today.
    func isTodayDate(_ date: Date) -> Bool {
        return isDateInToday(date)
    }

    /// Returns true when a date is yesterday.
    func isYesterdayDate(_ date: Date) -> Bool {
        return isDateInYesterday(date)
    }

    /// Returns true when a date is tomorrow.
    func isTomorrowDate(_ date: Date) -> Bool {
        return isDateInTomorrow(date)
    }

    /// Returns true when a date falls on a weekend.
    func isWeekendDate(_ date: Date) -> Bool {
        return isDateInWeekend(date)
    }

    /// Adds days to a date.
    func addDays(_ value: Int, to date: Date) -> Date {
        return self.date(byAdding: .day, value: value, to: date) ?? date
    }

    /// Adds weeks to a date.
    func addWeeks(_ value: Int, to date: Date) -> Date {
        return self.date(byAdding: .weekOfYear, value: value, to: date) ?? date
    }

    /// Adds months to a date.
    func addMonths(_ value: Int, to date: Date) -> Date {
        return self.date(byAdding: .month, value: value, to: date) ?? date
    }

    /// Adds years to a date.
    func addYears(_ value: Int, to date: Date) -> Date {
        return self.date(byAdding: .year, value: value, to: date) ?? date
    }

    /// Returns day difference between dates.
    func getDayDifference(from: Date, to: Date) -> Int {
        return dateComponents([.day], from: from, to: to).day ?? 0
    }

    /// Returns month difference between dates.
    func getMonthDifference(from: Date, to: Date) -> Int {
        return dateComponents([.month], from: from, to: to).month ?? 0
    }

    /// Returns year difference between dates.
    func getYearDifference(from: Date, to: Date) -> Int {
        return dateComponents([.year], from: from, to: to).year ?? 0
    }

    /// Returns weekday number.
    func getWeekday(for date: Date) -> Int {
        return component(.weekday, from: date)
    }

    /// Returns day of month.
    func getDay(for date: Date) -> Int {
        return component(.day, from: date)
    }

    /// Returns month number.
    func getMonth(for date: Date) -> Int {
        return component(.month, from: date)
    }

    /// Returns year number.
    func getYear(for date: Date) -> Int {
        return component(.year, from: date)
    }

    /// Returns whether two dates are on the same day.
    func isSameDay(_ first: Date, _ second: Date) -> Bool {
        return isDate(first, inSameDayAs: second)
    }

    /// Returns the next date matching date components.
    func getNextDate(after date: Date, matching components: DateComponents) -> Date? {
        return nextDate(after: date, matching: components)
    }
}
