import Foundation
import XCTest
@testable import PencilPages

final class NotebookStoreTests: XCTestCase {
    @MainActor
    func testNotebookChangesSurviveStoreReopen() throws {
        let storageRoot = FileManager.default.temporaryDirectory
            .appendingPathComponent("PencilPagesTests-\(UUID().uuidString)", isDirectory: true)
        defer { try? FileManager.default.removeItem(at: storageRoot) }

        let notebookID: UUID
        let pageID: UUID
        do {
            let store = NotebookStore(storageRootURL: storageRoot)
            guard let firstNotebook = store.notebooks.first, let firstPage = store.notebooks.first?.pages.first else {
                return XCTFail("The starter notebook and page should be available")
            }
            notebookID = firstNotebook.id
            pageID = firstPage.id
            store.setPaper(.grid, notebookID: notebookID, pageID: pageID)
            store.flushPendingSaves()
        }

        let reopenedStore = NotebookStore(storageRootURL: storageRoot)
        let reopenedNotebook = try XCTUnwrap(reopenedStore.notebook(id: notebookID))
        XCTAssertEqual(reopenedNotebook.pages.first?.id, pageID)
        XCTAssertEqual(reopenedNotebook.pages.first?.paper, .grid)
        XCTAssertNil(reopenedStore.storageMessage)
    }

    @MainActor
    func testUnreadableNotebookFileIsPreserved() throws {
        let storageRoot = FileManager.default.temporaryDirectory
            .appendingPathComponent("PencilPagesTests-\(UUID().uuidString)", isDirectory: true)
        try FileManager.default.createDirectory(at: storageRoot, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: storageRoot) }

        let originalBytes = Data([0x00, 0x01, 0x02])
        let fileURL = storageRoot.appendingPathComponent("\(UUID().uuidString).pencilpages")
        try originalBytes.write(to: fileURL)

        let store = NotebookStore(storageRootURL: storageRoot)

        XCTAssertTrue(store.notebooks.isEmpty)
        XCTAssertNotNil(store.storageMessage)
        XCTAssertEqual(try Data(contentsOf: fileURL), originalBytes)
    }
}
