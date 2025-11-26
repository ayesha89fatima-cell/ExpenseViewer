# ExpenseViewer
ExpenseViewer – iOS Offline Assignment
A simple, modular, MVVM-based iOS application that displays a list of expenses fetched from a mocked network service. The project demonstrates use of SwiftUI, Combine, Swift Concurrency, protocol-oriented networking, Objective-C interoperability, and fully covered Unit + UI Tests.

FEATURES
- Fetch list of expenses from a service (mockable + protocol-driven)
- Display expenses with title, amount, formatted date
- Pull-to-refresh support
- Loading, error, and empty states
- Clean MVVM architecture
- SwiftUI reusable UI components
- Network layer with dependency injection
- Objective-C parser used via bridging header
- 100% test coverage (Unit + UI)

ARCHITECTURE
MVVM with Model → View → ViewModel → Services → Networking → Utilities → ObjC Parser.

TECHNOLOGIES USED
Swift 5, SwiftUI, Combine, Swift Concurrency, Objective-C Interoperability, XCTest, XCUITest, MVVM.

TEST COVERAGE
Unit Tests: Networking, Services, ViewModels, Views, Utilities, ObjC Parser.
UI Tests: App launch, loading flow, UI state validation.

HOW TO RUN
Open ExpenseViewer.xcodeproj → build & run on iOS simulator → CMD + U for tests.

