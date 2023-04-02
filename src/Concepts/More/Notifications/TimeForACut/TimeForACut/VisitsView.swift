//
//  ContentView.swift
//  TimeForACut
//
//  Created by richard Haynes on 3/29/23.
//
// TODO I really think I should move some stuff either to a view model or some other pattern to keep the view small
/*
 https://www.appsdeveloperblog.com/add-days-months-years-to-current-date-in-swift/
 https://stackoverflow.com/questions/45061324/repeating-local-notifications-for-specific-days-of-week-swift-3-ios-10
 https://auth0.com/blog/introduction-date-time-programming-swift-2/
 */
import SwiftUI
import CoreData
struct VisitsView: View {
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        fetchRequest: Visit.all,
        animation: .default)
    private var visits: FetchedResults<Visit>
    
    private let visitFormatter : DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    private func LogVisit() -> Visit{
        let visit = Visit(context: context)
        visit.dateOf = Date()
        visit.id = UUID()
        
        do {
            try context.save()
        }
        catch {
            
        }
        
        return visit
    }
    
    private func DetermineNextVisit(visit : Visit) -> DateComponents {
        let dateOfVisit = visit.dateOf ?? Date()
        var dateComponent = DateComponents()
        dateComponent.day = 7
        let scheduleDate : Date = Calendar.current.date(byAdding: dateComponent, to: dateOfVisit) ?? Date()
        let scheduleDateComponents: DateComponents = Calendar.current.dateComponents([.weekday, .day,.hour, .minute, .second], from: scheduleDate)
        return scheduleDateComponents
    }
    
    private func ScheduleNextVisit(visit: Visit) {
        let scheduleDateComponents: DateComponents = DetermineNextVisit(visit: visit)
        NotificationsManager.shared.scheduleNotifications(from: scheduleDateComponents)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(visits) { visit in
                    NavigationLink {
                        Text("\(visit.dateOf!, formatter: visitFormatter)")
                    } label: {
                        Text(visit.dateOf!, formatter: visitFormatter)
                    }
                }
            }.toolbar{
                ToolbarItem {
                    Button("Log"){
                        let visit = LogVisit()
                        ScheduleNextVisit(visit: visit)
                    }
                }
            }
        }.onAppear{
             NotificationsManager.shared.requestNotificationAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VisitsView().environment(\.managedObjectContext, PersistenceProvider.preview.container.viewContext)
    }
}
