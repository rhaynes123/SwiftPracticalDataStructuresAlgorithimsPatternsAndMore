//
//  ContentView.swift
//  TimeForACut
//
//  Created by richard Haynes on 3/29/23.
//

/*
 https://www.appsdeveloperblog.com/add-days-months-years-to-current-date-in-swift/
 https://stackoverflow.com/questions/45061324/repeating-local-notifications-for-specific-days-of-week-swift-3-ios-10
 https://auth0.com/blog/introduction-date-time-programming-swift-2/
 https://www.appcoda.com/navigationstack/
 */
import SwiftUI
import CoreData
struct VisitsView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        fetchRequest: Visit.all,
        animation: .default)
    private var visits: FetchedResults<Visit>
    @ObservedObject private var model = VisitsViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(visits) { visit in
                    NavigationLink {
                        Text("\(visit.dateOf!, formatter: model.visitFormatter)")
                    } label: {
                        Text(visit.dateOf!, formatter: model.visitFormatter)
                    }
                }
            }
            .navigationTitle("Visits")
            .toolbar{
                ToolbarItem {
                    Button("Log Visit", action: model.OrganizeVisits)
                }
            }
        }
        .onAppear {
             NotificationsManager.shared.requestNotificationAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VisitsView().environment(\.managedObjectContext, PersistenceProvider.preview.container.viewContext)
    }
}
