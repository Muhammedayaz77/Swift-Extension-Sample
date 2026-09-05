import UIKit

extension UITableView {

    /// Registers a cell class using its class name.
    func registerCellClass<T: UITableViewCell>(_ type: T.Type) {
        register(
            type,
            forCellReuseIdentifier: String(describing: type)
        )
    }

    /// Dequeues a typed cell using its class name.
    func dequeueCell<T: UITableViewCell>(
        _ type: T.Type,
        for indexPath: IndexPath
    ) -> T? {
        dequeueReusableCell(
            withIdentifier: String(describing: type),
            for: indexPath
        ) as? T
    }

    /// Reloads the table view on the main queue.
    func reloadTable() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    /// Scrolls to the top.
    func scrollTableToTop(animated: Bool = true) {
        setContentOffset(
            CGPoint(x: 0, y: -adjustedContentInset.top),
            animated: animated
        )
    }

    /// Scrolls to the bottom.
    func scrollTableToBottom(animated: Bool = true) {
        guard numberOfSections > 0 else {
            return
        }

        let section = numberOfSections - 1

        guard numberOfRows(inSection: section) > 0 else {
            return
        }

        let indexPath = IndexPath(
            row: numberOfRows(inSection: section) - 1,
            section: section
        )

        scrollToRow(at: indexPath, at: .bottom, animated: animated)
    }

    /// Returns section count.
    func getSectionCount() -> Int {
        numberOfSections
    }

    /// Returns row count for a section.
    func getRowCount(section: Int) -> Int {
        section < numberOfSections ? numberOfRows(inSection: section) : 0
    }

    /// Returns whether a section exists.
    func hasSection(_ section: Int) -> Bool {
        section >= 0 && section < numberOfSections
    }

    /// Returns whether an index path exists.
    func hasRow(_ indexPath: IndexPath) -> Bool {
        indexPath.section < numberOfSections
            && indexPath.row < numberOfRows(inSection: indexPath.section)
    }

    /// Selects a row safely.
    func selectRowSafely(_ indexPath: IndexPath, animated: Bool = true) {
        if hasRow(indexPath) {
            selectRow(
                at: indexPath,
                animated: animated,
                scrollPosition: .none
            )
        }
    }

    /// Deselects all selected rows.
    func deselectAllRows(animated: Bool = true) {
        indexPathsForSelectedRows?.forEach {
            deselectRow(at: $0, animated: animated)
        }
    }

    /// Hides empty separator lines.
    func hideEmptySeparators() {
        tableFooterView = UIView(frame: .zero)
    }

    /// Removes table separators.
    func removeSeparators() {
        separatorStyle = .none
    }

    /// Shows table separators.
    func showSeparators() {
        separatorStyle = .singleLine
    }

    /// Sets row height.
    func setDefaultRowHeight(_ height: CGFloat) {
        rowHeight = height
    }

    /// Enables estimated row heights.
    func enableAutomaticRowHeight() {
        rowHeight = UITableView.automaticDimension
    }

    /// Sets header height.
    func setHeaderHeight(_ height: CGFloat) {
        sectionHeaderHeight = height
    }

    /// Sets footer height.
    func setFooterHeight(_ height: CGFloat) {
        sectionFooterHeight = height
    }

    /// Removes all selected rows.
    func removeSelectedRows() {
        indexPathsForSelectedRows?
            .sorted { $0.row > $1.row }
            .forEach {
                deleteRows(at: [$0], with: .automatic)
            }
    }
}
