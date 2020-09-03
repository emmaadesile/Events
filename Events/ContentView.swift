//
//  ContentView.swift
//  Events
//
//  Created by Emmanuel Adesile on 01/09/2020.
//  Copyright © 2020 Emmanuel Adesile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Latest Events")
          .font(.system(size: 22, weight: .bold, design: .default))
        Spacer()
      }
      .padding(.leading, 25.0)
      .padding(.bottom, 20.0)
      
      HStack {
        Text("Browse by categories")
          .font(.subheadline)
          .fontWeight(.medium)
          .foregroundColor(Color("GreyHound"))
        
        Spacer()
        
        Text("See all")
          .font(.subheadline)
          .fontWeight(.medium)
          .foregroundColor(Color("Tomato"))
      }
      .padding(.horizontal, 25.0)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          EventCategory(image: "conference", title: "Conference")
          EventCategory(image: "club", title: "Club")
          EventCategory(image: "festival", title: "Festival")
          EventCategory(image: "gallery", title: "Gallery")
          EventCategory(image: "conference", title: "Sport")
        }
        .padding(.leading, 25.0)
      }
      
      HStack {
        Text("All Events")
          .font(.system(size: 22, weight: .bold, design: .default))
        
        Spacer()
      }
      .padding(.leading, 30.0)
      .padding(.vertical, 20.0)
      .padding(.bottom, 20)
      
      VStack(spacing: 36) {
        EventCard(
          eventName: "Coachela Music Arts and Festival '20",
          price: "$60",
          date: "Friday, 9 October | 09:00",
          description: "The Coachella Valley Music and Arts Festival is an annual music and arts festival held at the Empire Polo Club in Indio, California, in the Coachella Valley in the Colorado Desert.",
          attendantsCount: 10
        )
        EventCard(
          eventName: "OSS Summit North America 2020",
          price: "Free",
          date: "Mon, 22 June | 10:00",
          description: "Open Source Summit connects the open source ecosystem under one roof. It’s a unique environment for cross-collaboration between developers, sysadmins",
          attendantsCount: 18
        )
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct EventCategory: View {
  var image: String
  var title: String
  
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 104, height: 110)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
      
      Text(title)
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundColor(Color("Grey57"))
    }
    
  }
}

struct EventCardFilter: View {
  var title: String
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: 11, weight: .medium, design: .default))
        .foregroundColor(Color("Tomato"))
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
    }
    .background(Color("LightTomato"))
    .cornerRadius(20)
  }
}

struct AttendingEvent: View {
  var image: String
  
  var body: some View {
    Image(image)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 26, height: 26)
      .cornerRadius(13)
//      .border(Color.white, width: 1)
  }
}

struct EventCard: View {
  var eventName: String
  var price: String
  var date: String
  var description: String
  var attendantsCount: Int
  
  var body: some View {
    VStack(spacing: 12.0) {
      HStack {
        Text(eventName)
          .font(.system(size: 19, weight: .bold, design: .default))
          .fontWeight(.bold)
          .foregroundColor(Color("Dark40"))
        
        Spacer()
      }
      
      HStack {
        EventCardFilter(title: "Festival")
        EventCardFilter(title: "Party")
        
        Spacer()
        
        Text(date)
          .font(.system(size: 11, weight: .medium, design: .default))
          .foregroundColor(Color("Grey9"))
      }
      
      HStack {
        AttendingEvent(image: "avatar")
        AttendingEvent(image: "avatar2")
          .offset(x: -20.0)
        AttendingEvent(image: "avatar3")
          .offset(x: -40.0)
        
        Text("+\(attendantsCount) friends attending")
          .font(.system(size: 11, weight: .bold, design: .default))
          .foregroundColor(Color("Tomato"))
          .offset(x: -40.0)
        
        Spacer()
      }
      .padding(.bottom, 10)
      .padding(.top, 5)
      
      Text(description)
        .font(.system(size: 12, weight: .medium, design: .default))
        .foregroundColor(Color(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)))
        .lineLimit(3)
      
    }
    .frame(width: 350, height: 220)
    .padding(.horizontal, 20)
    .padding(.top, 8)
    .background(Color.white)
    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    .shadow(color: Color.black.opacity(0.05), radius: 15, x: 0, y: 2)
    .overlay(
      Text(price)
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(Color("Tomato"))
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)))
        .cornerRadius(20)
        .offset(x: -160, y: -115)
    )
  }
}
