//
//  BBookProgressUpdateModifier.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI
import SwiftData
import OSLog

struct BDataModifier: ViewModifier {

    @Environment(\.scenePhase)
    private var phase: ScenePhase

    @Environment(\.modelContext)
    private var context: ModelContext

    @State
    private var readModel: BReadModel = .shared

    @State
    private var dataModel: DataModel = .shared

    func body(content: Content) -> some View {
        content
            .onAppear {
                dataModel.context = context
            }
            .onChange(of: phase) { _, newValue in
                switch newValue {
                case .active:
                    readModel.refresh(into: context)
                case .inactive, .background:
                    readModel.save(into: context)
                @unknown default:
                    Logger.views.error(
                        "I really don't know what I should do."
                    )
                }
            }
    }
}

extension View {
    func connectSwiftData() -> some View {
        modifier(BDataModifier())
    }
}
