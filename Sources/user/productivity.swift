import SwiftUI

// Main app view with tab navigation
struct ContentView: View {
    var body: some View {
        TabView {
            HabitsView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Habits")
                }
            
            DashboardView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Dashboard")
                }
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

// individual views for each tab

// Erza!
struct HabitsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Habits")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .navigationTitle("Habits")
        }
    }
}

// Ria S!

// Temporary struct till Habits tab is created
struct Habit{
    let title: String
    let isComplete: Bool
}

struct Day: Identifiable {
    let id = UUID()
    let day: String
    let taskDone: Int
}

struct DashboardView: View {
    
    // Daily messages that keep alternating
    let messages = [
        "Hello! Ready to tackle the day?", "You're doing great, keep going!", "We're so proud of you, keep it up 😊", "Even small progress counts. Don't give up!"
    ]
    // Mock Data for now until Habits/Calendar tabs are created (uses structs above)
    
    let todaysHabits = [
        Habit(title: "30 minutes of cardio", isComplete: true),
        Habit(title: "Read for 10 minutes", isComplete: false),
        Habit(title: "Drink 8 glasses of water", isComplete: true)
    ]
    
    let weekData = [
        Day(day: "Sun", taskDone: 5),
        Day(day: "Mon", taskDone: 4),
        Day(day: "Tue", taskDone: 4),
        Day(day: "Wed", taskDone: 2),
        Day(day: "Thu", taskDone: 3),
        Day(day: "Fri", taskDone: 2),
        Day(day: "Sat", taskDone: 1)
    ]
    var totalHabits: Int {
        todaysHabits.count
    }
    var completedHabits: Int {
        todaysHabits.filter { $0.isComplete }.count
    }
    private var streak = 12
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Text(messages.randomElement()!)
                        .font(.headline)
                        .italic()
                        .padding()
                    Spacer()
                    VStack{
                        Text("TODAY:")
                            .fixedSize()
                            .bold()
                        Spacer()
                        HStack{
                            Text("Completed:")
                                .bold()
                            Text("\(completedHabits)/\(totalHabits) tasks")
                        }
                        Spacer()
                        HStack{
                            Text("Streak:")
                                .bold()
                            Text("\(streak) 🔥")
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.mint.opacity(0.2))
                            .frame(width: 300, height: 110)
                    )
                    // Weekly Overview (Bar Graph with struct as placeholder)
                                    Text("Weekly Overview").font(.headline)
                                    HStack(alignment: .bottom, spacing: 8) {
                                            ForEach(weekData) { day in
                                                VStack {
                                                    Rectangle()
                                                        .fill(Color.blue)
                                                        .frame(width: 20, height: CGFloat(day.taskDone * 20)) // scale height
                                                    Text(day.day).font(.caption)
                                                }
                                            }
                                        }
                        
                    var averageTasks: Double {
                        let total = weekData.reduce(0) {$0 + $1.taskDone}
                        return Double(total) / Double(weekData.count)
                    }
                    Text("Try setting a goal for \(Int(averageTasks)) tasks per day.")
                        .italic()
                                    
                                    Divider()
                                    Spacer()
                                    
                                    // Quick Actions
                                    Text("Today’s Habits").font(.headline)
                                        VStack(alignment: .leading, spacing: 10) {
                                            ForEach(todaysHabits, id: \.title) { habit in
                                                Text(habit.title)
                                                    .padding()
                                                    .background(habit.isComplete ? Color.green.opacity(0.5) : Color.gray.opacity(0.5))
                                                    .cornerRadius(8)
                                            }
                                        }
                                    
                                    HStack {
                                        Button("Add New Habit") { print("Add tapped") }
                                            .buttonStyle(.borderedProminent)
                                        Button("View Full Calendar") { print("Calendar tapped") }
                                            .buttonStyle(.bordered)
                                    }
                }
                .navigationTitle("Dashboard")
            }
        }
    }
    
}

// Nancy!
struct CalendarView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Calendar")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .navigationTitle("Calendar")
        }
    }
}

// Ria S!
struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}
