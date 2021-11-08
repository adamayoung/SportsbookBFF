import Foundation
import NIO

final class PollingTask {

    private let task: RepeatedTask
    private let onCancel: (() -> Void)?

    init(task: RepeatedTask, onCancel: (() -> Void)? = nil) {
        self.task = task
        self.onCancel = onCancel
    }

    func cancel() {
        onCancel?()
        task.cancel()
    }

}
