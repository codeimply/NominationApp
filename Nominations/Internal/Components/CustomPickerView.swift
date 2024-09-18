////
////  PickerView.swift
////  Nominations
////
////  Created by Wiktoria Wylecial on 02/11/2023.
////  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
////
//
//import SwiftUI
//
///// Custom Picker View.
/////
///// Options can be customised as needed.
////struct PickerView: View {
////    
////    @Binding var activeSelectedOption: Bool
////    @State var options: [String]
//////    @State var nomineeId: String // API properties for list of nominees
//////    @State var firstName: String
//////    @State var lastName: String
////    @State private var selectedOption = "Select Option"
//
//struct CustomPickerView: View {
//    
//    @Binding var selection: [String]
//    let items: () -> Content
//    
//    @State var isPicking = false
//    @State var hoveredItem: [String]
//    @Environment(\.isEnabled) var isEnabled
//    
//    let buttonHeight: CGFloat = 44
//    let arrowSize: CGFloat = 16
//    let cornerRadius: CGFloat = 20
//    
//    var body: some View {
//        
//        // Select Button - Selected item
//        HStack {
//            Text("Select")
//                .lineLimit(1)
//                .minimumScaleFactor(0.8)
//            Spacer()
//            Image(systemName: isPicking ? "chevron.up" : "chevron.down")
//                .frame(width: 5, height: 5)
//                .fontWeight(.semibold)
//                .foregroundColor(.accentColor)
//        }
//        .padding(.horizontal, 15)
//        .frame(maxWidth: .infinity)
//        .frame(height: buttonHeight)
//        .background(
//            Rectangle()
//                .fill(Color("PickerColor"))
//                .stroke(Color.primary, lineWidth: 2.2)
//        )
//        .contentShape(Rectangle())
//        .onTapGesture {
//            isPicking.toggle()
//        }
//        // Picker
//        .overlay(alignment: .topLeading) {
//            VStack {
//                if isPicking {
//                    Spacer(minLength: buttonHeight + 10)
//                    
//                    ScrollView {
//                        VStack(spacing: 0) {
//                            ForEach(items()) { item in
//                                
//                                Divider()
//                                
//                                Button {
//                                    selection = item
//                                    isPicking.toggle()
//                                    
//                                } label: {
//                                    
//                                    Text(item.id.capitalized)
//                                        .lineLimit(1)
//                                        .minimumScaleFactor(0.7)
//                                        .frame(height: buttonHeight)
//                                        .frame(maxWidth: .infinity, alignment: .center)
//                                        .padding(.horizontal, 10)
//                                        .background {
//                                            Rectangle()
//                                                .fill(hoveredItem == item ? Color.accentColor.opacity(0.8) : Color.clear)
//                                                .padding(.horizontal, 8)
//                                                .padding(.bottom, 10)
//                                                .offset(y: 5)
//                                        }
//                                        .onHover { isHovered in
//                                            if isHovered {
//                                                hoveredItem = item
//                                            }
//                                        }
//                                }
//                                .buttonStyle(.plain)
//                                
//                                Divider()
//                            }
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                    .scrollIndicators(.never)
//                    .frame(height: 200)
//                    .background(Color("PickerColor"))
//                    .overlay(
//                        Rectangle()
//                        .stroke(Color.primary, lineWidth: 2.2)
//                    )
//                    .transition(.scale(scale: 0.8, anchor: .top).combined(with: .opacity).combined(with: .offset(y: -10)))
//                }
//            }
//
//        }
//    //    .padding(.horizontal, 12)
//    //    .opacity(isEnabled ? 1.0 : 0.6)
//     //   .animation(.easeInOut(duration: 0.12), value: isPicking)
//    //    .sensoryFeedback(.selection, trigger: selection)
//
//    }
//}
//
//        
//        
//        
//        
//        
//        
//        
//        
//        
////        Rectangle()
////            .stroke(activeSelectedOption ? .cubeDarkGrey : .cubeMidGrey, lineWidth: 1)
////            .frame(height: 35)
////            .overlay (
////                ZStack {
////                    HStack {
////                        Text("\(selectedOption)")
////                            .font(Font.custom("Anonymous Pro", size: 16))
////                            .frame(width: 310, alignment: .leading)
////                        
////                        Image(systemName: "chevron.down")
////                            .frame(width: 5, height: 5)
////                            .fontWeight(.semibold)
////                            .foregroundColor(.cubePink2)
////                    }
////                    
////                    HStack {
////                        Picker("", selection: $selectedOption) {
////                            ForEach(options, id: \.self) {
////                                Text($0)
////                            }
////                        }
////                        .pickerStyle(.menu)
////                        .opacity(0.025)
////                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
////                        .onChange(of: selectedOption) {
////                            activeSelectedOption = false
////                        }
////                        if apiViewModel.nominee.rawValue != "Select Option" {
////                            selectedOption = true
////                            //                                    selectedOptionNomineeId = fetched.nominees?.nomineeId
////                        }
////                    }
////                    
////                }
////            )
////    }
////}
