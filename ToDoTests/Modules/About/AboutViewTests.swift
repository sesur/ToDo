@testable import ToDo
import XCTest
import SwiftUI
import ViewInspector

@MainActor
final class AboutViewTests: XCTestCase {
    
    func test_textModifiers() throws {
        let sut = AboutView()
        XCTAssertEqual(try expect(text: sut).string(), "This app was made during\n a SwiftUI course 🧑‍🎓🧑‍🎓")
        XCTAssertEqual(try expect(text: sut).multilineTextAlignment(), .center)
        XCTAssertEqual(try expect(text: sut).hasPadding(), true)
    }
    
    func test_moreInfoButton() throws {
        let sut = AboutView()
        let buttonTitle = try expect(button: sut).labelView().text().string()
        XCTAssertEqual(buttonTitle , "More info")
        
        try expect(button: sut).tap()
    }
    
    func test_sheetIsPresented() throws {
        let sut = AboutView()
        XCTAssertFalse(sut.isMoreInfoPresented)
        
        try expect(button: sut).tap()
        
        var view = MoreInfoView().sheet2(isPresented: sut.$isMoreInfoPresented)  {
            MoreInfoView()
        }
        
        XCTAssertNotNil(view)
    }
    
    //MARK: - Helpers
    private func expect(text sut: AboutView) throws -> InspectableView<ViewType.Text> {
       return try sut.inspect().vStack().text(0)
    }
    
    private func expect(button sut: AboutView) throws -> InspectableView<ViewType.Button> {
        return try sut.inspect().vStack().button(1)
    }
}

extension InspectableAlert: PopupPresenter { }
