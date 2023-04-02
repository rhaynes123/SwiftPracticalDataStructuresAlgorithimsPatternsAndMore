//
//  VisitsViewModel.swift
//  TimeForACut
//
//  Created by richard Haynes on 4/2/23.
//

import Foundation
/*
 https://developer.apple.com/forums/thread/699003
 https://azamsharp.com/2022/07/17/2022-swiftui-and-mvvm.html
 https://developer.apple.com/forums/thread/699003
 https://nalexn.github.io/clean-architecture-swiftui/
 https://matteomanferdini.com/mvvm-pattern-ios-swift/
 https://www.hackingwithswift.com/articles/226/5-steps-to-better-swiftui-views
 */
extension VisitsView {
    final class VisitsViewModel : ObservableObject {
        private let context = PersistenceProvider.shared.container.viewContext
        private let numberOfDaysForNextNotification = 7
        let visitFormatter : DateFormatter = {
           let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .medium
            return formatter
        }()
        
        
        // MARK - Private Methods
        
        private func DetermineNextVisit(visit : Visit) -> DateComponents {
            let dateOfVisit = visit.dateOf ?? Date()
            var dateComponent = DateComponents()
            dateComponent.day = numberOfDaysForNextNotification
            let scheduleDate : Date = Calendar.current.date(byAdding: dateComponent, to: dateOfVisit) ?? Date()
            let scheduleDateComponents: DateComponents = Calendar.current.dateComponents([.weekday, .day,.hour, .minute, .second], from: scheduleDate)
            return scheduleDateComponents
        }
        
        
        
        // MARK - Public Methods
        func ScheduleNextVisit(visit: Visit) {
            let scheduleDateComponents: DateComponents = DetermineNextVisit(visit: visit)
            NotificationsManager.shared.scheduleNotifications(from: scheduleDateComponents)
        }
        
        func OrganizeVisits() {
            let visit = LogVisit()
            ScheduleNextVisit(visit: visit)
        }
        
        func LogVisit() -> Visit {
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
        
    }
}
