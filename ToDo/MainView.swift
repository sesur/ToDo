import SwiftUI

struct MainView: View {
    
    enum Tab: Equatable {
        case todo
        case about
    }
    
    @State var selectedTab: Tab = .todo
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TodoItemListView()
                .tabItem {
                    Image(systemName: MainViewKey.todoImage)
                    Text(TabKey.todo)
                }
                .tag(Tab.todo)
            
            AboutView()
                .tabItem {
                    Image(systemName: MainViewKey.aboutImage)
                    Text(TabKey.about)
                }
                .tag(Tab.about)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            print("oldValue was \(String(describing: oldValue)), with newValue: \(String(describing: newValue))")
        }
    }
}

#Preview {
    MainView()
}
