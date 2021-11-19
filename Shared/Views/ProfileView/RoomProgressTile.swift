//
//  RoomProgressTile.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 18/11/21.
//

import SwiftUI

struct RoomProgressViewTile: View {
    var room: RoomsModel?
    var width: CGFloat
    var isTop: Bool
    var body: some View {
        HStack(spacing: 0) {
            if isTop {
                ProgressLine(width: width, color: room?.journey?.roomStatus.color ?? .roomGrey, isSmooth: room?.journey?.isSmooth ?? false,isTop: isTop,showArrow: room?.journey?.showArrow ?? false)
            }
            RoomProgressTile(room: room, width: width)
            if !isTop {
                ProgressLine(width: width, color: room?.journey?.roomStatus.color ?? .roomGrey, isSmooth: room?.journey?.isSmooth ?? false,isTop: isTop,showArrow: room?.journey?.showArrow ?? false)
            }
        }
    }
}

struct RoomProgressTile: View {
    var room: RoomsModel?
    var width: CGFloat
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Image(room?.journey?.questionsStatus?[0].progressImage ?? "unsolved_key")
                    .resizable()
                    .scaledToFit()
                Image(room?.journey?.questionsStatus?[1].progressImage ?? "unsolved_key")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -6)
                Image(room?.journey?.questionsStatus?[2].progressImage ?? "unsolved_key")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                Circle().fill(room?.journey?.roomStatus.color ?? .roomGrey)
                Text("\(room?.room?.roomNo ?? "")")
                    .font(.Mulish(size: 22, weight: .bold))
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.black)
            }
            .aspectRatio(1, contentMode: .fit)
            Text("\(room?.room?.title ?? "Room")")
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

            
            RoomProgressViewTile(room: RoomsModel.data, width: 40,isTop: true)
                .padding()
                .background(Color.black)
            
            RoomProgressViewTile(room: RoomsModel.data, width: 40,isTop: false)
                .padding()
                .background(Color.black)
            
            VStack {
                VerticalProgressLine(width: 40, color: .red, isSmooth: true)
                RoomProgressTile(room: RoomsModel.data,width: 40)
                    .padding()
                    .background(Color.black)
            }
            
        }
        .previewLayout(.sizeThatFits)
    }
}

struct ProgressLine: View {
    var width: CGFloat
    var color: Color
    var isSmooth: Bool
    var isTop: Bool = true
    var showArrow: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
    
            Line()
                    .stroke(style: isSmooth ? StrokeStyle(lineWidth: width * 0.04) : StrokeStyle(lineWidth: width * 0.04, dash: [3]))
                    .fill(color)
            if showArrow {
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: width * 0.04, lineCap: .round))
                .fill(color)
                .rotationEffect(.degrees(isTop ? 0 : 180))
            }
        }
        .frame(height: 10)
    }
}

struct VerticalProgressLine: View {
    var width: CGFloat
    var color: Color
    var isSmooth: Bool
    var showArrow: Bool = false

    var body: some View {
    ZStack(alignment: .center) {
                VerticalLine()
                    .stroke(style: isSmooth ? StrokeStyle(lineWidth: width * 0.04) : StrokeStyle(lineWidth: width * 0.04, dash: [3]))
                    .fill(color)
        if showArrow {
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: width * 0.04, lineCap: .round))
                .fill(color)
                .rotationEffect(.degrees(90))
                .scaledToFit()
                .frame(width: width/2, height: width)
        }
        }
        .frame(width: width)
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

struct VerticalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        path.move(to: CGPoint(x: width/2, y: 0))
        path.addLine(to: CGPoint(x: width/2, y: rect.height))
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
