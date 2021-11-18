//
//  RoomProgressTile.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 18/11/21.
//

import SwiftUI

struct RoomProgressViewTile: View {
    var room: RoomsModel
    var width: CGFloat
    var isHorizontal: Bool
    var body: some View {
        AdaptiveStack(isHorizontal:isHorizontal,horizontalAlignment: .center, verticalAlignment: .center, spacing: 0) {
            ProgressLine(width: width, color: room.journey?.roomStatus.color ?? .roomGrey, isSmooth: room.journey?.isSmooth ?? false, isHorizontal: isHorizontal)
            RoomProgressTile(room: room, width: width)
        }
    }
}

struct RoomProgressTile: View {
    var room: RoomsModel
    var width: CGFloat
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Image("Key")
                    .resizable()
                    .scaledToFit()
                Image("Key")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -6)
                Image("Key")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                Circle().fill(room.journey?.roomStatus.color ?? .roomGrey)
                Text("\(room.room?.roomNo ?? "")")
                    .font(.Mulish(size: 22, weight: .bold))
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.black)
            }
            .aspectRatio(1, contentMode: .fit)
            Text("\(room.room?.title ?? "Room")")
                .font(.Mulish(size: 22, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .foregroundColor(.white)
        }
        .frame(width: width)
    }
}

struct RoomProgressTile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomProgressTile(room: RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "https://firebasestorage.googleapis.com/v0/b/enigma-8.appspot.com/o/Room%2FRoom%207.png?alt=media&token=adc9c32c-18e8-4d28-bd26-30dd00192d39", title: "Room 3", starQuota: 0)),width: 40)
                .padding()
                .background(Color.black)
            
            RoomProgressViewTile(room: RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["solved","unlocked","locked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "https://firebasestorage.googleapis.com/v0/b/enigma-8.appspot.com/o/Room%2FRoom%207.png?alt=media&token=adc9c32c-18e8-4d28-bd26-30dd00192d39", title: "Room 3", starQuota: 0)), width: 40, isHorizontal:  false)
                .padding()
                .background(Color.black)
            
            
            
            
        }
        .previewLayout(.sizeThatFits)
    }
}

struct ProgressLine: View {
    var width: CGFloat
    var color: Color
    var isSmooth: Bool
    var isHorizontal: Bool
    var body: some View {
        ZStack(alignment: .center) {
            Line()
                .stroke(style: isSmooth ? StrokeStyle(lineWidth: width * 0.04) : StrokeStyle(lineWidth: width * 0.04, dash: [3]))
                .fill(color)
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: width * 0.04, lineCap: .round))
                .fill(color)
        }
        .rotationEffect(.degrees(isHorizontal ? 0 : 90))
        .frame(maxWidth: !isHorizontal ? width * 0.30 : .infinity,maxHeight: isHorizontal ? width * 0.30 : .infinity)
        
    }
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: height/2))
        path.addLine(to: CGPoint(x: rect.width, y: height/2))
        return path
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.22507*height + width/2, y: 0.13444*height))
        path.addLine(to: CGPoint(x: 0.69927*height + width/2, y: 0.47932*height))
        path.addLine(to: CGPoint(x: 0.22507*height + width/2, y: 0.86251*height))
        return path
    }
}

struct AdaptiveStack<Content: View>: View {
    let isHorizontal: Bool
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(isHorizontal:Bool,horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
        self.isHorizontal = isHorizontal
    }
    
    var body: some View {
        Group {
            if isHorizontal {
                HStack(alignment: .center, spacing: spacing, content: content)
            } else {
                VStack(alignment: .center, spacing: spacing, content: content)
            }
        }
    }
}
