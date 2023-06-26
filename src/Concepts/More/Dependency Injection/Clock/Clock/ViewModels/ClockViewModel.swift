//
//  ClockViewModel.swift
//  Clock
//
//  Created by richard Haynes on 6/25/23.
//

import Foundation
import Combine
final class ClockViewModel : ObservableObject {
    @Published var hours = "00"
    @Published var minutes = "00"
    @Published var seconds = "00"
    
    var clock : TimeProvider
    private var cancellabes = Set<AnyCancellable>()
    
    init(clock: TimeProvider){
        self.clock = clock
        Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { _ in
                let time = self.clock.Update()
                self.hours = time.Hours
                self.minutes = time.Minutes
                self.seconds = time.Seconds
            }.store(in: &cancellabes)
    }
    
}
