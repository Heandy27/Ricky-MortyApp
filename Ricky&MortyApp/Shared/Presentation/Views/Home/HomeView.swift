import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    @State var selectedCharacter: Characters?
    @Environment(AppStateVM.self) var appState
    @AppStorage("showingGrid") private var showingGrid = false    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Group {
                    if showingGrid {
                        GridLayout(viewModel: viewModel)
                    } else {
                        ListLayout(viewModel: viewModel)
                    }
                }
                .toolbar {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        if showingGrid {
                            Label("Show as table", systemImage: "list.dash")
                        } else {
                            Label("Show as grid", systemImage: "square.grid.2x2")
                        }
                    }

                }
            }
        }
        .sheet(isPresented: $viewModel.showModel) {
            if let character = viewModel.characterselected {
                DetailViewHome(character: character)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environment(AppStateVM())
        .preferredColorScheme(.dark)
}
