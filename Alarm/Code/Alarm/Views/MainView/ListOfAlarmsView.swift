//
//  ListOfAlarmsView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct ListOfAlarmsView: View {
    //MARK: - Variables
    @EnvironmentObject var lnManager: LocalNotificationManager
    @State var isActive: Bool = false
    @State var currentIndex: Int? = nil
    //@State var addEditViewType: AddEditViewType = .standard
    @State var addEditViewType: AddEditViewType = .circular
    
    //MARK: - Views
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(lnManager.alarmViewModels.indices, id: \.self) {item in
                            AlarmRowViewButton(
                                model: lnManager.alarmViewModels[item],
                                item: item,
                                currentIndex: $currentIndex,
                                isActive: $isActive)
                            .padding(.vertical)
                            .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                                return viewDimensions[.listRowSeparatorLeading] - 50

                            }
                            .alignmentGuide(.listRowSeparatorTrailing) { viewDimensions in
                                return viewDimensions[.listRowSeparatorTrailing]

                            }
                            
                        }
                        .onDelete(perform: deleteMe)
                    }
                    
                    SelectView(
                        width: 50.0,
                        addEditViewType: $addEditViewType)
                }
                FourCoolCircles()
                    .opacity(0.3)
            }
            .navigationTitle("Alarm List")
            .sheet(isPresented: $isActive, onDismiss: {}) {
                ChooseAlarmView(
                    currentAlarmIndex: $currentIndex,
                    addEditViewType: $addEditViewType
                )
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    
                    Button(
                        action: {
                            isActive.toggle()
                        },
                        label: {
                            Text("+")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.appColorBlack)
                        })
                }
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
        }
        }
    }
    
    func deleteMe(offsets: IndexSet){
        for index in offsets {
            lnManager.removeRequest(id: lnManager.alarmViewModels[index].id)
        }
        //MARK: - Removing from alarmViewModels
        lnManager.alarmViewModels.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfAlarmsView()
    .environmentObject(LocalNotificationManager())
}
